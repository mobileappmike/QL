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
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    // MARK: - Load Data
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contact = contacts?[indexPath.row].fragments.contactDetails else {
            fatalError("Couldn't find contact at row \(indexPath.row)")
        }
        
        let cell = tableView.cellForRow(at: indexPath) as? ContactTableViewCell
        
        guard let name = contact.name else {
            fatalError("Unable to get name")
        }
        guard let number = contact.number else {
            fatalError("Unable to get number")
        }
        
        let alert = UIAlertController(title: "Edit Contact", message: nil, preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = name
        }

        alert.addTextField { (textField) in
            textField.text = "\(number)"
        }

        let updateAction = UIAlertAction(title: "Update", style: .default) { (action) in
            let nameTextField = alert.textFields![0] as UITextField
            let numberTextField = alert.textFields![1] as UITextField

            // MARK: Update Name & Number Methods
            if nameTextField.text != contact.name {
                guard let newName = nameTextField.text else {fatalError("Unable to get name text field text")}
                apollo.perform(mutation: EditNameMutation(id: contact.id, name: newName)) { result in
                    switch result {
                    case .success(let resultData):
                        cell?.updatedLabel.text = resultData.data?.updateContact?.updatedAt
                        cell?.nameLabel.text = resultData.data?.updateContact?.name
                    case .failure(let error):
                        fatalError("Edit Name mutation didn't work. \(error.localizedDescription)")
                    }
                }
            }
            if numberTextField.text != "\(number)" {
                guard let newNumber = Int(numberTextField.text!) else {fatalError("Unable to get number text field text")}
                apollo.perform(mutation: EditNumberMutation(id: contact.id, number: newNumber)) { result in
                    switch result {
                    case .success(let resultData):
                        cell?.updatedLabel.text = resultData.data?.updateContact?.updatedAt
                        cell?.numberLabel.text = "\(resultData.data?.updateContact?.number ?? 00000)"
                    case .failure(let error):
                        fatalError("Edit number mutation didn't work. \(error.localizedDescription)")
                    }
                }
            }
            
            self.loadData()

            alert.dismiss(animated: true, completion: nil)

        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }

        alert.addAction(updateAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

}
