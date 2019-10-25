//
//  GraphQLTableViewController.swift
//  QL
//
//  Created by Michael Miles on 10/22/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit
import Apollo

class GraphQLTableViewController: UITableViewController {
    
    var contacts: [LoadContactsQuery.Data.AllContact]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var watcher: GraphQLQueryWatcher<LoadContactsQuery>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    // MARK: - Data Manipulation
    
    func loadData() {
        watcher = apollo.watch(query: LoadContactsQuery(), resultHandler: { result in
            switch result {
            case .success(let newResult):
                self.contacts = newResult.data?.allContacts
            case .failure(let error):
                print("Error loading contacts: \(error.localizedDescription)")
            }
        })
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactTableViewCell else {
            fatalError("Couldn't dequeue contactCell")
        }

        guard let contact = contacts?[indexPath.row].fragments.contactDetails else {
            fatalError("Couldn't find contact at row \(indexPath.row)")
        }
        
        cell.nameLabel.text = contact.name
        cell.numberLabel.text = "\(contact.number ?? 00000)"
        cell.createdLabel.text = "Created: \(contact.createdAt)"
        cell.updatedLabel.text = "Updated: \(contact.updatedAt)"

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
