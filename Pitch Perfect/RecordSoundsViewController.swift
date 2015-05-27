//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rodrigo Webler on 5/13/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var microphoneButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var pausedLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    
    var recordedAudio: RecordedAudio!
    
    // three possible states: stopped, recording and paused
    var recordingState: String!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setUIElementsToPaused("stopped")
    }

    @IBAction func recordAction(sender: UIButton) {
        println("In recordAction")
        
        if (recordingState == "stopped") {
            startNewRecording()
        } else if (recordingState == "paused") {
            restartRecording()
        } else if (recordingState == "recording") {
            pauseRecording()
        }
    }
    
    func startNewRecording() {
        setUIElementsToRecording()
        
        //saving the audio file in the temp (caches) directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as! String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        println("In startNewRecording")
    }
    
    func pauseRecording() {
        setUIElementsToPaused("paused")
        audioRecorder.pause()
        
        println("In pauseRecording")
    }
    
    func restartRecording() {
        setUIElementsToRecording()
        audioRecorder.record()
        
        println("In restartRecording")
    }

    @IBAction func stopAction(sender: UIButton) {
        setUIElementsToPaused("stopped")
        
        println("In stopAction")
        
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag) {
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("Recording failed")
            
            setUIElementsToPaused("stopped")
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    //methods for showing and hiding buttons and labels, called from some methods above
    
    func setUIElementsToPaused(recordingState: String?) {
        recordingLabel.hidden = true
        pausedLabel.hidden = false
        stopButton.hidden = true
        
        //sets the recording state to stopped or paused
        self.recordingState = recordingState
    }
    
    func setUIElementsToRecording() {
        recordingLabel.hidden = false
        pausedLabel.hidden = true
        stopButton.hidden = false
        
        recordingState = "recording"
    }
}

