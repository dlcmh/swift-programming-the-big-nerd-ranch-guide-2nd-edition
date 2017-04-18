//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by David Chin on 18/04/2017.
//  Copyright © 2017 David Chin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let speechSynthesizer = NSSpeechSynthesizer()

    @IBOutlet var textView: NSTextView!

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
        if let contents = textView.string {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(_ sender: NSButton) {
        print("The stop button was clicked")
    }
}

