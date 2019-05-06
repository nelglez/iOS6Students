//
//  MainViewController.swift
//  Students
//
//  Created by Nelson Gonzalez on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    //create instance
    private let networkClient = NetworkClient()
    
    private var studentsTableViewController: StudentsTableViewController! {
        didSet {
            updateSort()
        }
    }

    private var students: [Student] = [] {
        didSet {
            updateSort()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) in
            if let error = error {
                /*
                DispatchQueue.main.async {
                    //Show alert to user.
                }
                */
                NSLog("Error loading students: \(error.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                self.students = students ?? []
            }
        }
    }
    
    
    private func updateSort() {
        let sortedStudents: [Student]
        
        if sortSelector.selectedSegmentIndex == 0 {
            sortedStudents = students.sorted { $0.firstName < $1.firstName }
        } else {
            sortedStudents = students.sorted {
                ($0.lastName ?? "") < ($1.lastName ?? "")
            }
        }
        
        studentsTableViewController.students = sortedStudents
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            studentsTableViewController = (segue.destination as! StudentsTableViewController)
        }
    }
   
    @IBAction func sort(_ sender: UISegmentedControl) {
        updateSort()
    }
    
}
