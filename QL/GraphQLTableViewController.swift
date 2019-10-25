//
//  GraphQLTableViewController.swift
//  QL
//
//  Created by Michael Miles on 10/22/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class GraphQLTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Edit Contact", message: nil, preferredStyle: .alert)
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "Contact Name"
//        }
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "Contact Number"
//        }
//
//        let updateAction = UIAlertAction(title: "Update", style: .default) { (action) in
//            let nameTextField = alert.textFields![0] as UITextField
//            let numberTextField = alert.textFields![1] as UITextField
//
//            if nameTextField.text != name {
//                //call update name mutation
//            }
//            if numberTextField.text != number {
//                //call update number mutation
//            }
//
//            alert.dismiss(animated: true, completion: nil)
//
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//            alert.dismiss(animated: true, completion: nil)
//        }
//
//        alert.addAction(updateAction)
//        alert.addAction(cancelAction)
//
//        present(alert, animated: true)
//    }

}
