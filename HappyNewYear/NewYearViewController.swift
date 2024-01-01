//
//  NewYearViewController.swift
//  HappyNewYear
//
//  Created by 陆华敬 on 2022/2/1.
//

import UIKit
import Lottie
class NewYearViewController: UIViewController {
    
    private let tigerAnimationView:AnimationView = {
        let tigerAnimationView = AnimationView()
        tigerAnimationView.animation = Animation.named("74268-cute-tiger")
        tigerAnimationView.contentMode = .scaleAspectFit
        tigerAnimationView.loopMode = .loop
        return tigerAnimationView
    }()
    
    private let newYearAnimationView:AnimationView = {
        let newYearAnimationView = AnimationView()
        newYearAnimationView.animation = Animation.named("14274-chinese-new-year")
        newYearAnimationView.contentMode = .scaleAspectFit
        newYearAnimationView.loopMode = .loop
        return newYearAnimationView
    }()
    
    private let backButton:UIButton = {
        let backButton = UIButton()
        backButton.setTitle("返回", for: .normal)
        backButton.backgroundColor = .systemGreen
        let font = UIFont(name: "WenYue-HuiMoShouShu-J", size: 40)
        backButton.titleLabel?.font = font
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 8.0
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return backButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tigerAnimationView.frame = CGRect(x: 100, y: 80, width: 200, height: 200)
        newYearAnimationView.frame = CGRect(x: 47, y: 300, width: 300, height: 300)
        backButton.frame = CGRect(x: 20, y: 700, width: view.frame.width - 40, height: 60)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(tigerAnimationView)
        view.addSubview(newYearAnimationView)
        view.addSubview(backButton)
        tigerAnimationView.play()
        newYearAnimationView.play()

        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapBackButton(){
        self.dismiss(animated: true, completion: nil)
    }
    

}
