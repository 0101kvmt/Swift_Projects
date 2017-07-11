//
//  AddItemDelegate.swift
//  to_do
//
//  Created by Kevin M Tran on 1/22/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

protocol AddItemDelegate: class {
    func cancelButtonPressedby(by controller: AddItemViewController)
//    func itemSaved(by controller: AddItemViewController, with text: String, at indexPath: NSIndexPath?)
}
