//
//  ViewController.swift
//  StopWatch
//
//  Created by Hitomi Chu on 5/9/2020.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var label2: UILabel!
 
    @objc func up() {
        
        count = count + 0.01
        label.text = String(format: "%.2f", count)
        
    }
    
    @objc func hantei() {
        if count >= 9.80 && count <= 10.20 {
            print ("PERFECT")
            label2.text = "PERFECT"
    }
        
        else if count >= 9.70 && count <= 10.30 {
            print ("GREAT")
            label2.text = "GREAT"
            
        }
        
        else if count >= 9.50 && count <= 10.50 {
            print ("GOOD")
            label2.text = "GOOD"
            
        }
        
        else {
            print ("BAD")
            label2.text = "BAD"
        }

    }
    
    @IBAction func start(){
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func resetbtn() {
        

        timer.invalidate()
        count = 0.0
        label.text = String(count)
        
}



}
