//
//  CustomCell.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var buttonDelegate : CustomCellDelegate?
    weak var customCellDelegate: CustomCellDelegate?
    
    @IBOutlet weak var MainImage: UIImageView!
    
    
    @IBOutlet weak var Name: UILabel!
    
    
    @IBAction func DescriptionButtonPressed(_ sender: UIButton) {
        // First We click this button
        // When we click we want to segue
        // We want to try to perform segue here
        // Somehow get someone to perform segue for us *** Delegates ***
        buttonDelegate?.DescriptionButtonPressed(self)
        print("Description")
    }
 
}
