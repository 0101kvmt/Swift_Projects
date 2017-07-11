//
//  ViewController.swift
//  mayhem
//
//  Created by Kevin M Tran on 1/12/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mask: CALayer!
    var animation: CABasicAnimation!
    
    
    @IBOutlet weak var dab: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animate(withDuration: 3.0, delay: 32, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

