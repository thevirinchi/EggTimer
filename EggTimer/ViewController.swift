//
//  ViewController.swift
//  EggTimer
//
//  
//

import UIKit

class ViewController: UIViewController {

    let eggTimers = ["Soft":300, "Medium":420, "Hard":720];
    var secondsRemaining = 60;
    @IBOutlet weak var label: UILabel!
    var timer = Timer()
    
    @IBAction func hardness(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!;
        
        secondsRemaining = eggTimers[hardness]!;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if(secondsRemaining>0){
            secondsRemaining-=1
        }
        else if(secondsRemaining == 0){
            timer.invalidate()
            label.text = "Done!"
        }
    }
    
}
