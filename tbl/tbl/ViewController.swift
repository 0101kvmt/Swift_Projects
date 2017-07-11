//
//  ViewController.swift
//  tbl
//
//  Created by Kevin M Tran on 1/16/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tasks = ["Do laundry", "Gets laundry", "Eat chips", " Read book", "Eats chips"]
    
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var beastB: UIButton!
    @IBOutlet weak var textf: UITextField!

    @IBAction func buttonPress(_ sender: UIButton) {
        let task = textf.text
        tasks.append(task!)
        tableV.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableV.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
}
