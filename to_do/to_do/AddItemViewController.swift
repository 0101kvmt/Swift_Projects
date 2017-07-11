//
//  AddItemViewController.swift
//  to_do
//
//  Created by Kevin M Tran on 1/22/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var itemTextView: UITextView!
    
    
    weak var delegate: AddItemDelegate?

    var indexPath: NSIndexPath?
    var note: Note!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        itemTextView.text = note.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        note.content = itemTextView.text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
