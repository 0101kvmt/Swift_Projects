//
//  AddItemViewControllerDelegate.swift
//  there
//
//  Created by Kevin M Tran on 1/17/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
