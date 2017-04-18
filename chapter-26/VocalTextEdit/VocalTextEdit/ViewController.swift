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
    
    // Refactoring result: `contents` computed property to represent the contents of Text View
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }

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
        if let contents = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(_ sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }


}

