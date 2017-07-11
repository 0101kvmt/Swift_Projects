//
//  AddViewController.swift
//  algos
//
//  Created by Kevin M Tran on 2/2/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//



import Foundation
import UIKit

class AddViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var customCellDelegate: CustomCellDelegate?
    weak var doneButtonDelegate: DoneButtonDelegate?
    var addname: String?
    var adddescription: String?
    var addimagefilename: String?
    var addImage: Int?
    override func viewDidLoad() {
        imagePicker.delegate = self
        if let unwrapaddname = addname {
            addImageLabel.image = UIImage(named: unwrapaddname)
            addDescriptionTextField.text = adddescription
            addNameTextField.text = unwrapaddname
            
        }
    }
    weak var cancelButtonDelegate: CancelButtonDelegate?
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.CancelButtonPressed(self)
    }
    @IBAction func selectImageButtonPressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            addImageLabel.contentMode = .scaleAspectFit
            addImageLabel.image = pickedImage
            print (pickedImage)
            print (UIImagePickerControllerOriginalImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var addImageLabel: UIImageView!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addDescriptionTextField: UITextField!
    @IBAction func DoneBarButtonPressed(_ sender: UIBarButtonItem) {
        print("DoneBarButton pressed")
        if var picturename = addname {
            // Update functionality
            picturename = addNameTextField.text!
            adddescription = addDescriptionTextField.text
            doneButtonDelegate?.DoneButtonPressed(self, finishedUpdating: picturename, picturedescription: adddescription, imagename: addimagefilename, atIndexPath: addImage!)
            //            print("updatename done button")
            //            print (adddescription)
        }
        else {
            let picturename = addNameTextField.text!
            adddescription = addNameTextField.text
            doneButtonDelegate?.DoneButtonPressed(self, finishedAdding: picturename, picturedescription: adddescription, imagename: addimagefilename)
            print("addname done button")
        }
    }
    
}
