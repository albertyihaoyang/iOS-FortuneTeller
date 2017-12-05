//
//  ViewController.swift
//  FortuneTeller
//
//  Created by 杨以皓 on 12/3/17.
//  Copyright © 2017 yyh. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    @IBOutlet weak var yourFortune: UIImageView!
    
    @IBAction func tellMeSomethine(_ sender: UIButton) {
        showAnswer()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
            showAnswer()
        }
    }
    
    func showAnswer(){
        if yourFortune.isHidden == true {
            // Random Num
            let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6) + 1
            // Show ans
            yourFortune.image = UIImage(named: "\(answer)")
            yourFortune.isHidden = false
            // Sount
            AudioServicesPlaySystemSound(1000)
        } else {
            yourFortune.isHidden = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

