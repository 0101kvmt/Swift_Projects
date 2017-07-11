//
//  buttonDelegate.swift
//  bucket
//
//  Created by Kevin M Tran on 1/29/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

protocol buttonDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
    func saveButtonPressed(by controller: UIViewController, with text: String, at indexPath: NSIndexPath?)
    func beastButtonPressed(by controller: UIViewController, with text: String, at indexPath: NSIndexPath?)
    
}
