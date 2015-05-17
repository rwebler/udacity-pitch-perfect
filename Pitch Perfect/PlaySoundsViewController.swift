//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rodrigo Webler on 5/16/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            var soundUrl = NSURL(fileURLWithPath: filePath)
            println(soundUrl)
            audioPlayer = AVAudioPlayer(contentsOfURL: soundUrl, error: nil)
            audioPlayer.enableRate = true
            audioPlayer.prepareToPlay()
        } else {
            println("File not found")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        snailButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playAudio(atRate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = atRate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func snailSoundButtonAction(sender: UIButton) {
        //snailButton.enabled = false
        playAudio(0.5)
    }

    @IBAction func rabbitSoundButtonAction(sender: UIButton) {
        //rabbitButton.enabled = false
        playAudio(1.5)
    }

    @IBAction func stopPlaybackButtonAction(sender: UIButton) {
        
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
