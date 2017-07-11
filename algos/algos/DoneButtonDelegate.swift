//
//  DoneButtonDelegate.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation

protocol DoneButtonDelegate: class {
    func DoneButtonPressed(_ controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?)
    func DoneButtonPressed(_ controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int)
}
