//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rodrigo Webler on 5/13/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var microphoneButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        stopButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAction(sender: UIButton) {
        recordingLabel.hidden = false
        stopButton.hidden = false
        stopButton.enabled = true
        microphoneButton.enabled = false
        //TODO: Record user's voice
        println("In recordAudio")
    }

    @IBAction func stopAction(sender: UIButton) {
        recordingLabel.hidden = true
        stopButton.hidden = true
        stopButton.enabled = false
        microphoneButton.enabled = true
        //TODO: Stop recording user's voice
        println("In stopAction")
    }
}

