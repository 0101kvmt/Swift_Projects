//
//  ViewController.swift
//  core_data
//
//  Created by Kevin M Tran on 1/19/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class BListViewController: UITableViewController, itemAddTableViewDelegate  {

    var items = ["item1", "water bottle", "corolla", "iced ice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell" , for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let itemAddTableViewController = navigationController.topViewController as! ItemAddTableViewController
        itemAddTableViewController.delegate = self
    }

    func cancelButtonPressed(by controller: UIViewController) {
        print("printo")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: UIViewController, with text: String) {
        print("saved")
        dismiss(animated: true, completion: nil)

    }
    
}

