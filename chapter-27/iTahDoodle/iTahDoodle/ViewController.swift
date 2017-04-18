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
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addButtonPressed(_ sender: UIButton) {
//        print("Add to-do item: \(String(describing: itemTextField.text))")
        // https://github.com/apple/swift-evolution/blob/master/proposals/0099-conditionclauses.md
        // http://stackoverflow.com/questions/29381994/swift-check-string-for-nil-empty
        guard let todo = itemTextField.text, !todo.isEmpty else { // checks that itemTextField.text is not nil and not empty
            return
        }
        todoList.add(todo)
        tableView.reloadData()
        itemTextField.text = ""
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        print("Removing row: \(row)")
        todoList.remove(row)
        tableView.reloadData()
    }
}
