//
//  UpdateInfoDelegate.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateInfoDelegate: class {
    func UpdateInfoWith(pictureName picturename: String?, picturedescription: String?, imagename: String?, atIndexPath indexpath: Int)
}
