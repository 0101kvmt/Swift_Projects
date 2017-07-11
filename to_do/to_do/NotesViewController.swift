//
//  ViewController.swift
//  to_do
//
//  Created by Kevin M Tran on 1/22/17.
//  Copyright © 2017 Kevin M Tran. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController, AddItemDelegate
 {
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredItems = [String]()
    var notes: [Note] = []
    
    let today = String(describing: Date())
    
    func cancelButtonPressedby(by controller: AddItemViewController){
        print("cancel")
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
       print("filter")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        print("\(today)")
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // SEARCH
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        // setup
        
        tableView.tableHeaderView = searchController.searchBar

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) as UITableViewCell
        
         cell.textLabel!.text = notes[indexPath.row].content
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }

    
   override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "editItemSegue" {
            let noteDetailViewController = segue.destination as! AddItemViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow
            noteDetailViewController.note = notes[selectedIndexPath!.row]
        } else if segue.identifier! == "addItemSegue" {
            let note = Note()
            notes.append(note)
            let noteDetailViewController = segue.destination as! AddItemViewController
            noteDetailViewController.note = note
        }

           }
//    func itemSaved(by controller: AddItemViewController, with text: String, at indexPath: NSIndexPath?) {
//      
//        if let ip = indexPath {
//            notes[ip.row] = text
//        } else {
//            notes.append(text)
//        }
//         print("hidden text rec bb")
//        tableView.reloadData()
//        dismiss(animated: true, completion: nil)
//    }

    

    
}




//extension NotesViewController: UISearchBarDelegate {
//    // MARK: - UISearchBar Delegate
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//}
//
//extension NotesViewController: UISearchResultsUpdating {
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
//    }
//}

extension NotesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}


