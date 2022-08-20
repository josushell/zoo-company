//
//  Sound.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/20.
//

import Foundation
import AVKit

class Sound {
    var button_bgm: AVAudioPlayer?
    
    func playSelectSound() {
        if let _ = button_bgm {
        }
        else {
            button_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "button_clicked", withExtension: "wav")!)
            button_bgm?.volume = 1
        }
        button_bgm?.prepareToPlay()
        button_bgm?.play()
    }
    
    func setVolumeFadeOut(_ sender: AVAudioPlayer?, completion: (() -> Void)?) {
        sender?.setVolume(0, fadeDuration: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            sender?.stop()
            completion?()
        })
    }
    
}

class HomeSound: Sound {
    var home_bgm: AVAudioPlayer?
    
    func playHomeMusic() {
        if let _ = home_bgm {
        }
        else {
            home_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "home_music", withExtension: "mp3")!)
            home_bgm?.volume = 0.7
        }
        home_bgm?.prepareToPlay()
        home_bgm?.play()
    }
}

class ElevatorSound: Sound {
    var elevator_bgm: AVAudioPlayer?
    
    func playElevatorMusic() {
        if let _ = elevator_bgm, let _ = button_bgm {
        }
        else {
            elevator_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "elevator_sound", withExtension: "mp3")!)
            elevator_bgm?.volume = 1
            
            button_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "elevator_ding", withExtension: "mp3")!)
            button_bgm?.volume = 1
        }
        elevator_bgm?.prepareToPlay()
        elevator_bgm?.play()
        button_bgm?.prepareToPlay()
        button_bgm?.play(atTime: (button_bgm?.deviceCurrentTime ?? 0) + 2)
        
    }
}
