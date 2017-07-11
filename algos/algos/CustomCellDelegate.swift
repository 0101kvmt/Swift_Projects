//
//  CustomCellDelegate.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation

protocol CustomCellDelegate: class {
    func DescriptionButtonPressed(_ sender: CustomCell)
    func AddButtonPressed(_ sender: CustomCell)
}
