//
//  ViewController.swift
//  HappyNewYear
//
//  Created by 陆华敬 on 2022/1/31.
//

//
//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController {
//
//    var queuePlayer = AVQueuePlayer()
//    var playerLooper: AVPlayerLooper?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        guard let url = Bundle.main.url(forResource: "Gamescene(new)", withExtension: "mp3") else { return }
//        let playerItem = AVPlayerItem(asset: AVAsset(url: url))
//        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
//        queuePlayer.play()
//    }
//}

import UIKit
import Lottie
import TransitionButton
import AVFoundation

class ViewController: UIViewController {
    
    var queuePlayer = AVQueuePlayer()
    var playerLooper: AVPlayerLooper?
    
    private let leftLabel:UILabel = {
        let leftLabel = UILabel()
        leftLabel.backgroundColor = .systemRed
        let text = "四\n海\n笙\n歌\n迎\n虎\n岁"
        leftLabel.numberOfLines = 7
        leftLabel.text = text
        let font = UIFont(name: "WenYue-HuiMoShouShu-J", size: 40)
        leftLabel.font = font
        leftLabel.textAlignment = .center
        return leftLabel
    }()
    
    
    
    private let rightLabel:UILabel = {
        let rightLabel = UILabel()
        rightLabel.backgroundColor = .systemRed
        let text = "九\n州\n英\n杰\n跃\n鹏\n程"
        rightLabel.numberOfLines = 7
        rightLabel.text = text
        let font = UIFont(name: "WenYue-HuiMoShouShu-J", size: 40)
        rightLabel.font = font
        rightLabel.textAlignment = .center
        return rightLabel
    }()
    
    private let middleLabel:UILabel = {
        let middleLabel = UILabel()
        middleLabel.backgroundColor = .systemRed
        middleLabel.numberOfLines = 0
        let text = "新年快乐"
        middleLabel.text = text
        let font = UIFont(name: "WenYue-HuiMoShouShu-J", size: 40)
        middleLabel.font = font
        middleLabel.textAlignment = .center
        return middleLabel
    }()
    
    private let animationView:AnimationView = {
        let animationView = AnimationView()
        animationView.animation = Animation.named("2045-furtune")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    
    private let button:TransitionButton = {
        let button = TransitionButton()
        button.backgroundColor = .systemGreen
        button.setTitle("开启新年", for: .normal)
        let font = UIFont(name: "WenYue-HuiMoShouShu-J", size: 40)
        button.titleLabel?.font = font
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        button.spinnerColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private let muteButton:UIButton = {
        let muteButton = UIButton()
        muteButton.tintColor = .systemRed
        muteButton.setBackgroundImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        muteButton.addTarget(self, action: #selector(didTapMuteButton), for: .touchUpInside)
        return muteButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftLabel.frame = CGRect(x: 20, y: 140, width: 60, height: 400)
        rightLabel.frame = CGRect(x: view.frame.origin.x + view.frame.width  -  80, y: 140, width: 60, height: 400)
        middleLabel.frame = CGRect(x: (view.frame.origin.x + view.frame.width)/2 - 90, y: 60, width: 180, height: 60)
        animationView.frame = CGRect(x: (view.frame.origin.x + view.frame.width)/2 - 160, y: 200, width: 320, height: 320)
        button.frame = CGRect(x: 20, y: 650, width: view.frame.width - 40, height: 60)
        muteButton.frame = CGRect(x: 330, y: 65, width: 30, height: 30)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
        view.addSubview(middleLabel)
        view.addSubview(animationView)
        view.addSubview(button)
        view.addSubview(muteButton)
        animationView.play()
        guard let url = Bundle.main.url(forResource: "春节序曲", withExtension: "mp3") else { return }
        let playerItem = AVPlayerItem(asset: AVAsset(url: url))
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animationView.play()
    }
    
    @objc private func didTapButton(){
        button.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
            let vc = NewYearViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            self.button.stopAnimation(animationStyle: .normal, revertAfterDelay: 1)
            
        })
        
    }
    
    @objc private func didTapMuteButton(){
        self.queuePlayer.pause()
        DispatchQueue.main.async {
            self.muteButton.setBackgroundImage(UIImage(systemName: "speaker.fill"), for: .normal)
        }
    }


}

