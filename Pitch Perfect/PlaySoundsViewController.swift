//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by WangHaoxin on 1/11/16.
//  Copyright © 2016 Haoxin Wang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        audioPlayer = try!
        
        AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)

    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithVariableRate(0.5)
    }

    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithVariableRate(1.5)
    }
    
    @IBAction func PlayChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariableRate(rate: Float){
        resetAudio()
        
        audioPlayer.rate = rate
        
        audioPlayer.currentTime = 0
        
        audioPlayer.play()
    
    }
    
    func playAudioWithVariablePitch(pitch : Float){
        resetAudio()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
        
        
    }
    
    func resetAudio(){
        audioPlayer.stop()
        
        audioEngine.stop()
        
        audioEngine.reset()
    
    }
    
    @IBAction func stopAudioPlay(sender: UIButton) {
        resetAudio()
    }

}
