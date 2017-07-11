//
//  itemAddTableViewDelegate.swift
//  core_data
//
//  Created by Kevin M Tran on 1/19/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit
protocol itemAddTableViewDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
    func itemSaved(by controller: UIViewController, with text: String)
}
