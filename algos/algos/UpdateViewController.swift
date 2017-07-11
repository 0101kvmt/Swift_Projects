//
//  UpdateViewController.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import Foundation
import UIKit

class UpdateViewController: UITableViewController, CancelButtonDelegate, DoneButtonDelegate {
    var updatename: String?
    var updatedescription: String?
    var updatecellpath: Int?
    var updateimagename: String?
    var example: String?
    
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
    weak var updateInfoDelegate: UpdateInfoDelegate?
    weak var customCellDelegate: CustomCellDelegate?
    func CancelButtonPressed(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        print ("updateviewcontroller")
        UpdateNameLabel.text = updatename
        UpdateImage.image = UIImage(named: updateimagename!)
        UpdateDescription.text = updatedescription
        algoExample.text = example
        algoExample.isEditable = false
        algoExample.isSelectable = false
        
        UpdateDescription.isEditable = false
        UpdateDescription.isSelectable = false
        
    }
   
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.CancelButtonPressed(self)
    }
   
    @IBOutlet weak var UpdateNameLabel: UILabel!


    @IBOutlet weak var UpdateImage: UIImageView!
    
    @IBOutlet weak var UpdateDescription: UITextView!

  
    @IBOutlet weak var algoExample: UITextView!
  
  
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToUpdate", sender: sender)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="GoToUpdate" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddViewController
            controller.cancelButtonDelegate = self
            controller.doneButtonDelegate = self
            controller.addname = updatename
            controller.adddescription = updatedescription
            controller.addImage = updatecellpath
            controller.addimagefilename = updateimagename
        }
        
    }
    func DoneButtonPressed(_ controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?) {
        print ("its working")
        
    }
    func DoneButtonPressed(_ controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int) {
        print("it's working")
        // First step is to update the fields on this page
        UpdateNameLabel.text = picturename
        UpdateDescription.text = picturedescription
        
        // You also need to update image and description here
        
        // Second step is to send that info to the viewcontroller page so that we can update that info
        updateInfoDelegate?.UpdateInfoWith(pictureName: picturename, picturedescription: picturedescription ,imagename: imagename, atIndexPath: indexpath)
        dismiss(animated: true, completion: nil)
    }
    
}
