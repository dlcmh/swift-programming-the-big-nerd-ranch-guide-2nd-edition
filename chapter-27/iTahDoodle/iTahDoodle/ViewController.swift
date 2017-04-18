//
//  ViewController.swift
//  iTahDoodle
//
//  Created by David Chin on 18/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = TodoList() /* property that adds an instance of TodoList */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addButtonPressed(_ sender: UIButton) {
//        print("Add to-do item: \(String(describing: itemTextField.text))")
        guard let todo = itemTextField.text else { // checks that itemTextField.text is not nil
            return
        }
        todoList.add(todo)
    }
}

