//
//  ViewController.swift
//  instrument
//
//  Created by Eduardo F. Ruiz on 2020/08/26.
//  Copyright © 2020 Eduardo F. Ruiz. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var gifView: UIImageView!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pads", ofType: "wav")!)
//               player = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
//               player.prepareToPlay()
//               player.numberOfLoops = -1
//               player.play()
//        gifView.loadGif(name: "chickenDance")
//        MusicPlayer.shared.startBackgroundMusic()
//        MusicPlayer2.shared.startBackgroundMusic()
//        MusicPlayer3.shared.startBackgroundMusic()
        playChord()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        playSquareNote()
        
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
    }
    @IBAction func sawPressed(_ sender: UIButton) {
    
        playSaw()
                 
        sender.alpha = 0.5
                 
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        sender.alpha = 1.0
        }
               
    }
    
    @IBAction func chordPressed(_ sender: UIButton) {
    
        playChord()
          
          sender.alpha = 0.5
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              sender.alpha = 1.0
          }
        
    }
    
  
    @IBAction func startMusic(_ sender: UIButton) {
        gifView.loadGif(name: "chickenDance")
               MusicPlayer.shared.startBackgroundMusic()
               MusicPlayer2.shared.startBackgroundMusic()
               MusicPlayer3.shared.startBackgroundMusic()
    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        MusicPlayer.shared.stopBackgroundMusic()
        MusicPlayer2.shared.stoptBackgroundMusic()
        MusicPlayer3.shared.stopBackgroundMusic()
        gifView.loadGif(name: "chickenStill")
    }
    
    func playSquareNote() {
        let square = ["squareG","squareA","squareB","squareC","squareD","squareE","squareF","squareG8"]
        let squareNumber = Int.random(in: 0..<3)
        let url = Bundle.main.url(forResource: square[squareNumber], withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    func playSaw() {
           let saw = ["sawA","sawB","sawD","sawD8","sawE","sawG","sawG",]
           let sawNumber = Int.random(in: 0..<7)
           let url = Bundle.main.url(forResource: saw[sawNumber], withExtension: "wav")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
           
       }
    
    func playChord() {
        let chord = ["chord1","chord2"]
        let chordNumber = Int.random(in: 0..<2)
        let url = Bundle.main.url(forResource: chord[chordNumber], withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    class MusicPlayer {
        static let shared = MusicPlayer()
        var audioPlayer: AVAudioPlayer?

        func startBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "pads", ofType: "wav") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                    
                    
                } catch {
                    print(error)
                }
            }
        }
        func stopBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "pads", ofType: "wav") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.stop()
                    
                    
                } catch {
                    print(error)
                }
            }
        }
    }
 
    class MusicPlayer2 {
        static let shared = MusicPlayer2()
        var audioPlayer: AVAudioPlayer?

        func startBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "percLoop", ofType: "wav") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print(error)
                }
            }
        }
        
        func stoptBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "percLoop", ofType: "wav") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.stop()
                } catch {
                    print(error)
                }
            }
        }
        
    }
    
    class MusicPlayer3 {
        static let shared = MusicPlayer3()
        var audioPlayer: AVAudioPlayer?

        func startBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "bassLoop", ofType: "wav") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print(error)
                }
            }
        }
        func stopBackgroundMusic() {
                  if let bundle = Bundle.main.path(forResource: "bassLoop", ofType: "wav") {
                      let backgroundMusic = NSURL(fileURLWithPath: bundle)
                      do {
                          audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                          guard let audioPlayer = audioPlayer else { return }
                          audioPlayer.numberOfLoops = -1
                          audioPlayer.prepareToPlay()
                          audioPlayer.stop()
                      } catch {
                          print(error)
                      }
                  }
              }
    }
    
}








