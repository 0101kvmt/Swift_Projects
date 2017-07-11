//
//  ViewController.swift
//  yessir
//
//  Created by Kevin M Tran on 1/13/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let image0 = UIImage(named: "green_drag.jpg")
    let image1 = UIImage(named: "drager.jpg")
    let image2 = UIImage(named: "drager.jpg")

    @IBOutlet weak var white: UIImageView!
    
    
   
    
    @IBAction func shaek(_ sender: Any) {
        white.isHidden = !white.isHidden
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.white.alpha = 0.0
            
        }, completion: nil)
    }
    
    @IBOutlet weak var drago: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.white.alpha == 0.0{
        white.isHidden = !white.isHidden
        } else{
            white.isHidden = true
        }

    }
}
