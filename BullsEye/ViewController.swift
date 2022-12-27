//
//  ViewController.swift
//  BullsEye
//
//  Created by Lalit kumar on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    var  currentValue : Int = 50
    var targetValue = 0
    var score = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var labelTargetValue:UILabel!
    @IBOutlet weak var totalScore:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doubledValue = slider.value.rounded()
        currentValue = Int(doubledValue) ;
        roundLabel.text = "0"
        self.startNewRound()
        self.setLabelsToZero()
        // Do any additional setup after loading the view.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlight = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let leftTrackImage = UIImage(named: "SliderTrackLeft")!
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftResizeable  = leftTrackImage.resizableImage(withCapInsets:insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let rightTrackImage = UIImage(named: "SliderTrackRight")!
//        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackRightResizeable  = rightTrackImage.resizableImage(withCapInsets:insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
    }
   
    @IBAction func showAlert(){
        let diffrence = abs(targetValue - currentValue)
        var points = 100 - diffrence
        score += points
        let title:String
        if(diffrence == 0){
            points += 100
        }
        else if diffrence == 1 {
            points += 50
        }
        if diffrence == 0{
            title = "Perfect !"
            
        }else if diffrence < 5 {
            title = "You almost had it !"
        }else if diffrence < 10 {
            title = "Preety Good !!"
        }else{
            title = "Not even close!"
        }
                    
        let alert = UIAlertController(title: title, message: "you scored : \(points) points", preferredStyle:.alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated : true, completion: nil)
//        startNewRound()
        
    }
    @IBAction func SliderChanged(_ slider : UISlider){
        let doubledValue = slider.value.rounded()
        currentValue = Int(doubledValue) ;
    }
    @IBAction func startover() {
        setLabelsToZero()
    }
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        let currentRound = (Int(roundLabel.text!) ?? 0 ) + 1
        roundLabel.text = String(currentRound)
        totalScore.text = String(score)
        labelTargetValue.text = String(targetValue)
    }
    func setLabelsToZero(){
        roundLabel.text = "0"
        score = 0
        startNewRound()
    }
}

