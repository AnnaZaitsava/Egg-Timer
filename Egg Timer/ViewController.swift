//
//  ViewController.swift
//  Egg Timer
//
//  Created by Anna Zaitsava on 27.07.23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7 ]
    var timeLeft = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.isHidden = true
        
    }
    
    //    let sofTime = 5
    //    let mediumTime = 7
    //    let hardTime = 12
    
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timerLabel.text = sender.currentTitle
        timer.invalidate()
        progressBar.isHidden = false
        
        
        let hardness = sender.currentTitle!
        let result = eggTime[hardness]!
        timeLeft = result
        
        setTimer()

    }
    
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLeft), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLeft() {
        if timeLeft > 0 {
            print("\(timeLeft) seconds left")
            timeLeft -= 1
            progressBar.setProgress(Float(timeLeft), animated: true)
            
        } else {  playSound()
            timer.invalidate()
            progressBar.isHidden = true
            timerLabel.text = "Done"
        
            
        }
        
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
    



