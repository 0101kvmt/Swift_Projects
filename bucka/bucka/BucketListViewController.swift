//
//  ViewController.swift
//  bucka
//
//  Created by Kevin M Tran on 1/18/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController {
    
    var items = ["unity", "corolla", "roja", "crysanthenum tea", "jasmine green tea"]
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
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

}

