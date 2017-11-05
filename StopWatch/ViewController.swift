//
//  ViewController.swift
//  StopWatch
//
//  Created by Satoshi Komatsu on 2017/09/16.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ueLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: Any) {
        if !timer.isValid{
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true)
        }
    }

    @IBAction func stop(_ sender: Any) {
//        もしタイマーがvalidならば
        if timer.isValid{
//            タイマーをinvalidにします
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        if timer.isValid{
            count = 0.0
            
        }
    }
    func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    func hantei(){
        /*if count >= 9.80 && count <= 10.20{
            ueLabel.text = "PERFECT"
        }else if count >= 9.70 && count <= 10.30{
            ueLabel.text = "GREAT"
        }else if count >= 9.50 && count <= 10.50{
            ueLabel.text = "GOOD"
        }else {
            ueLabel.text = "BAD"
        }*/
        
        if 9.80...10.20 ~= count{
            ueLabel.text = "PERFECT"
        } else if 9.70...10.30 ~= count{
            ueLabel.text = "GREAT"
        } else if 9.50...10.50 ~= count{
            ueLabel.text = "GOOD"
        } else {
            ueLabel.text = "BAD"
        }
    }
}

