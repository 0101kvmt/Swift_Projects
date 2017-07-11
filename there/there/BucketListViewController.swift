//
//  ViewController.swift
//  there
//
//  Created by Kevin M Tran on 1/17/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit
import CoreData


// ADD FEATURE(SAVE/CANCEL) WORKED PERFECTLY BEFORE WORKING ON UPDATE/DELETE FEATURE. WILL COME BACK TO THIS WHEN I GET THE CHANCE.

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        print("cancel")
    }

    var item = [BucketListItem]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row].text!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
         performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        item.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{

        let navigationController = segue.destination as! UINavigationController
        let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
        addItemTableViewController.delegate = self
        } else if segue.identifier == "EditItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let itemz = item[indexPath.row]
            
            addItemTableViewController.item = itemz.text!
            addItemTableViewController.indexPath = indexPath

        }
    }
    
    func fetchAllItems() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
              let result = try managedObjectContext.fetch(request)
              item = result as! [BucketListItem]
        } catch {
            print("\(error)")
        }
      
    }
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("hidden controller, but i am responding to the cancel button press on the top view controller")
        dismiss(animated: true, completion: nil)
    }
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?){
        
        if let ip = indexPath {
            let item = item[ip.row]
            item.text = text
        } else{
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext)
            item.append(text)
        }
        print("hidden controller, but i am responding to the save button press on the top view controller")
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

