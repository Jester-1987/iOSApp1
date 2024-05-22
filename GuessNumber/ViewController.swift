import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet var slider: UISlider!
    @IBOutlet var sLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: "My number is \(targetValue)",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Try again!",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let currentValue = Int(slider.value)
        sLabel.text = "\(currentValue)" // displays the current number on the slider in real time
            }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 1 // moves the slider back to 1 after each round
        slider.value = Float(currentValue)
        sLabel.text = "\(currentValue)"
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
