//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by David Chin on 18/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func speakButtonClicked(_ sender: NSButton) {
        print("The speak buton was clicked")
    }

    @IBAction func stopButtonClicked(_ sender: NSButton) {
        print("The stop button was clicked")
    }
}

