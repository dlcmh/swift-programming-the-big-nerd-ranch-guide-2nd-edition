//
//  TodoList.swift
//  iTahDoodle
//
//  Created by David Chin on 18/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    override init() {
        super.init()
        loadItems()
    }

    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todo")
    }()

    fileprivate var items: [String] = []
    
    func saveItems() {
        let itemsArray = items as NSArray
        print("Saving items to \(fileURL)")
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /* Called every time the table view needs the data source to configure a cell that will be displayed to the user.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) /* Asks the table view for a reusable cell with the identifier "Cell" and the given index path. What does reusable cell mean? To achieve good scrolling performance on mobile devices, UITableView uses a reuse pool of cells. When cells are no longer needed by the system, such as when the user scrolls and cells “fall off” the screen, the table view puts that cell into its reuse pool. If the table view has a cell in the reuse pool, it will give that one to you, dequeueing it from the pool. Otherwise, it will create a new one. Either way, you are guaranteed to get an instance back. */
        let item = items[indexPath.row] /* The indexPath argument indicates which row the table view needs to display. It contains properties for both a section and a row. As mentioned above, the iTahDoodle table view only has one section, so you can ignore the section and just look up which item to display based on the row. */
        cell.textLabel?.text = item
        return cell
    }
}
