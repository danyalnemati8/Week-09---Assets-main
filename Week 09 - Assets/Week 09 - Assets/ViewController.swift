//
//  ViewController.swift
//  Week 09 - Assets
//
// Created by Danyal Nemati

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet var theImage: UIImageView!
    @IBOutlet var toggleButton: UIButton!
    
    private var glassesState:Bool = false
    private var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonClicked(_ btn: UIButton){
        self.glassesState = !self.glassesState
        
        if(self.glassesState){
            self.theImage.image = UIImage(named: "DudeGlasses")
            
            if let audioPath = Bundle.main.path(
                forResource: "dark_laugh", ofType: "mp3"
            )
            {
                do{
                    let audioURL = URL(fileURLWithPath: audioPath)
                    try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.audioPlayer.volume = 10
                    self.audioPlayer.currentTime = 0
                    self.audioPlayer.prepareToPlay()
                    self.audioPlayer.play()
                }
                catch{
                    print("Failed to play dark laugh audio file")
                }
            }
            if let asset = NSDataAsset(name: "CoolData"){
                let dataAsString = String(
                    data: asset.data,
                    encoding: String.Encoding.utf8
                )
                print("Loaded CoolData: \(dataAsString ?? "[nothing]")")
            }
            else{
                print("Failed to load the data asset")
            }
        }
        else{
            self.theImage.image = UIImage(named: "DudePlain")
        }
    }

}

