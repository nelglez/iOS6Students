//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Nelson Gonzalez on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return students.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        let student = students[indexPath.row]
        
        cell.textLabel?.text = student.name
        
        return cell
    }
  

}
