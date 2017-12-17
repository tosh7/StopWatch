//
//  ViewController.swift
//  StopWatch
//
//  Created by Satoshi Komatsu on 2017/09/16.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ueLabel: UILabel!
    @IBOutlet var table: UITableView!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    var countTimerArray = [Float]()
    var fakeArray = [Float]()
    var index = 0
    var cell: UITableViewCell!
//    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countTimerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = String(countTimerArray[indexPath.row])
        
        return cell!
    }
    
//    func put(indexPath: IndexPath){
//        cell?.textLabel?.text = String(countTimerArray[indexPath.row])
//    }

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
    
    @IBAction func lap(_ sender: Any) {
        
        if timer.isValid{
            countTimerArray.append(count)
            fakeArray.append(count)
//            if n >= 1{
//                reset()
//            }
            table.reloadData()
//            n = n + 1
        }
    }
    
//    func reset(){
//        print("here")
//        for i in 0...fakeArray.count{
//            countTimerArray[countTimerArray.count - i] = fakeArray[i]
//        }
//    }
    
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

