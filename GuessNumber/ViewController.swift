import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet var slider: UISlider!
    @IBOutlet var sLabel: UILabel!
    
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = Int.random(in: 1...100)
        startNewRound()
    }
    
    @IBAction func showAlert() {
       
        let alert = UIAlertController(
            title: "\(targetValue)",
            message: "How close were you?",
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
    }
}
