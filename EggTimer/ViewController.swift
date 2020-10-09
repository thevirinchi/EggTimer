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
    var duration = 0;
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardness(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!;
        label.text = hardness + " eggs in making...";
        secondsRemaining = eggTimers[hardness]!;
        duration = eggTimers[hardness]!;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if(secondsRemaining>0){
            secondsRemaining-=1
            progressBar.progress = Float(1-Float(secondsRemaining)/Float(duration))
        }
        else if(secondsRemaining == 0){
            timer.invalidate()
            label.text = "Done!"
        }
    }
    
}
