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
    @IBOutlet weak var speakButton: NSButton! // for setting the enabled property when speech starts or stops
    @IBOutlet weak var stopButton: NSButton! // for setting the enabled property when speech starts or stops
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
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
        speechSynthesizer.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func speakButtonClicked(_ sender: NSButton) {
        if let contents = textView.string, !contents.isEmpty {
            speakButton.isEnabled = false
            stopButton.isEnabled = true
            progressIndicator.isHidden = false
            speechSynthesizer.startSpeaking(contents)
        } else {
            speakButton.isEnabled = false
            stopButton.isEnabled = true
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(_ sender: NSButton) {
        speakButton.isEnabled = true
        stopButton.isEnabled = false
        speechSynthesizer.stopSpeaking()
    }


}


extension ViewController: NSSpeechSynthesizerDelegate {
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        speakButton.isEnabled = true
        stopButton.isEnabled = false
        progressIndicator.isHidden = true
        progressIndicator.doubleValue = 0
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        let wordStartLocation = characterRange.location
        let length = characterRange.length
        let wordEndLocation = wordStartLocation + length
        let textLength = string.characters.count
//        let estimatedCompletionBasedOnWordStart = ((Double(wordStartLocation)/Double(textLength)) * 100).rounded(.toNearestOrEven)
        let estimatedCompletionBasedOnWordEnd = ((Double(wordEndLocation)/Double(textLength)) * 100).rounded(.toNearestOrEven)
//        print("location: \(wordStartLocation), length: \(length), word end location: \(wordEndLocation), textLength: \(textLength), estimated completion based on word start: \(estimatedCompletionBasedOnWordStart), estimated completion based on word end: \(estimatedCompletionBasedOnWordEnd)")
        progressIndicator.doubleValue = estimatedCompletionBasedOnWordEnd
    }
}

