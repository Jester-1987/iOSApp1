import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet var slider: UISlider!
    @IBOutlet var sLabel: UILabel!
    
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
       
        let alert = UIAlertController(
            title: "Your Guess",
            message: "You guessed: ",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let currentValue = Int(slider.value)
        sLabel.text = "\(currentValue)"
            }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
}
