//
//  ViewController.swift
//  algos
//
//  Created by Kevin M Tran on 2/1/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CustomCellDelegate, CancelButtonDelegate, DoneButtonDelegate, UpdateInfoDelegate {
    var pictures = ["Arrays","Binary_Search_Trees","Singly_Linked_Lists","Stacks & Queues","Greedy Algorithms"]
    var ImageName = ["Arrays","Binary Search Trees","Singly Linked Lists","Stacks & Queues","Greedy Algorithms"]
    var imagedescriptions = ["An array stores a sequence of values that are all of the same type. We want not only to store values but also to access each individual value. The method that we use to refer to individual values in an array is numbering and then indexing them. If we have N values, we think of them as being numbered from 0 to N–1. Then, we can unambiguously specify one of them in Java code by using the notation a[i] to refer to the ith value for any value of i from 0 to N-1. This Java construct is known as a one-dimensional array.","BST is a collection of nodes arranged in a way where they maintain BST properties. Each node has a key and an associated value. While searching, the desired key is compared to the keys in BST and if found, the associated value is retrieved.","Insertion into a singly-linked list has two special cases. It's insertion a new node before the head (to the very beginning of the list) and after the tail (to the very end of the list). In any other case, new node is inserted in the middle of the list and so, has a predecessor and successor in the list. There is a description of all these cases below.","A stack can be implemented by means of Array, Structure, Pointer, and Linked List. Stack can either be a fixed size one or it may have a sense of dynamic resizing. Here, we are going to implement stack using arrays, which makes it a fixed size stack implementation.","A greedy algorithm is an algorithmic paradigm that follows the problem solving heuristic of making the locally optimal choice at each stage with the hope of finding a global optimum."]
     var imageExamples = ["Arrays","Binary Search Trees","Singly Linked Lists","Stacks & Queues","Greedy Algorithms"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomCell
        cell.buttonDelegate = self
        cell.Name.text = pictures[indexPath.row]
        cell.MainImage.image = UIImage(named: ImageName[indexPath.row])
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func DescriptionButtonPressed(_ sender: CustomCell) {
        performSegue(withIdentifier: "GoToDescription", sender: sender)
    }
    func AddButtonPressed(_ sender: CustomCell) {
        performSegue(withIdentifier: "GoToAdd", sender: sender)
    }
    
    func CancelButtonPressed(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func DoneButtonPressed(_ controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?) {
        print ("its working")
        dismiss(animated: true, completion: nil)
        pictures.append(picturename!)
        imagedescriptions.append(picturedescription!)
        tableView.reloadData()
        
        
    }
    func DoneButtonPressed(_ controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int) {
        dismiss(animated: true, completion: nil)
        pictures[indexpath] = picturename!
        imagedescriptions[indexpath] = picturedescription!
        print (pictures)
        print (imagedescriptions)
        tableView.reloadData()
    }
    
    // We can perform a segue in here
    func performSegueForCell(_ sender: CustomCell) {
        // What you have to do now:
        // 1. Be able to call this method from the cell *** Delegates ***
        // 2. input this method into some delegate so that we can refer to it
        
        performSegue(withIdentifier: "GoToDescription", sender: sender)
    }
    
    func UpdateInfoWith(pictureName picturename: String?, picturedescription: String?, imagename: String?, atIndexPath indexpath: Int) {
        print("Tada")
        pictures[indexpath] = picturename!
        imagedescriptions[indexpath] = picturedescription!
        print (pictures)
        print (imagedescriptions)
        tableView.reloadData()
        // This is where we can use the info to update our array
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("preparing for segue")
        if segue.identifier=="GoToAdd" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddViewController
            controller.cancelButtonDelegate=self
            controller.doneButtonDelegate=self
        }
        else if segue.identifier == "GoToDescription" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! UpdateViewController
            controller.cancelButtonDelegate=self
            controller.customCellDelegate=self
            controller.updateInfoDelegate = self
            if let indexPath = tableView.indexPath(for: sender as! CustomCell) {
                controller.updatename = pictures[indexPath.row]
                controller.updatedescription = imagedescriptions[indexPath.row]
                controller.example = imageExamples[indexPath.row]
                controller.updatecellpath = indexPath.row
                controller.updateimagename = ImageName[indexPath.row]
                
            }
        }
    }
}

