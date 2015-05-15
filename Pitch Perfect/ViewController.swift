//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rodrigo Webler on 5/13/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAction(sender: UIButton) {
        recordingLabel.hidden = false
        stopButton.hidden = false;
        //TODO: Record user's voice
        println("In recordAudio")
    }

    @IBAction func stopAction(sender: UIButton) {
        recordingLabel.hidden = true
        stopButton.hidden = true;
        //TODO: Stop recording user's voice
        println("In stopAction")
    }
}

