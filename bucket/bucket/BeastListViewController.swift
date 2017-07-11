//
//  ViewController.swift
//  BEAST
//
//  Created by Kevin M Tran on 1/28/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

import CoreData

class BeastListViewController: UITableViewController, buttonDelegate{

    var items = [BeastListItem]()
    var filtereditems = [String]()
    
    
    //add, change delete items and saves into database
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beastCell1", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].text!
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
         performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       print("selected")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        } else if segue.identifier == "editItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item.text!
            addItemTableViewController.indexPath = indexPath
        }
       
    }
    
    func saveButtonPressed(by controller: UIViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            
           let item = items[ip.row]
            item.text = text
            items.remove(at: ip.row)
            items.insert(item, at: 0)
            print("inserto")
            
            
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "BeastListItem", into: managedObjectContext) as! BeastListItem
            item.text = text
            items.append(item)
            print("saved ns entity")
        }
        
        do {
            try managedObjectContext.save()
            print("saved at a;ll")
        } catch {
            print("\(error)")
        }
        
        print("hidden saved")
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func cancelButtonPressed(by controller: UIViewController) {
        print("hidden in the leaf")
        dismiss(animated: true, completion: nil)
    }
    
    func fetchAllItems() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BeastListItem")
        do{
            let result = try managedObjectContext.fetch(request)
            items = result as! [BeastListItem]
        } catch {
            print("\(error)")
        }
        
    }

}

