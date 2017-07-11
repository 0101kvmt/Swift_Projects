//
//  ViewController.swift
//  tictacto
//
//  Created by Kevin M Tran on 1/15/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player = 1
    }

    @IBAction func pressed(_ sender: UIButton) {
        if player == 1 {
            sender.setImage(UIImage(named:"/Users/kvnmtrn/Desktop/work/ios/ios_1/tictacto/tictacto/IMG_1956.JPG"), for: UIControlState.normal)
            player = 2
        } else {
            sender.setImage(UIImage(named:"IMG_1956.JPG"), for: UIControlState.normal)
            player = 1
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

