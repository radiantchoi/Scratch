//
//  ViewController.swift
//  Sandbox
//
//  Created by 러닝포인트 on 6/17/24.
//

import SwiftUI
import UIKit

import Lottie

final class ViewController: UIViewController {
    private lazy var lottieAnimatedView: LottieAnimationView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.loopMode = .playOnce
        $0.animationSpeed = 1.5
        
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        $0.layer.masksToBounds = false
        
        return $0
    }(LottieAnimationView(name: "veteran"))

    private lazy var coinButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton())
    
    private lazy var capsule: UIView = {
        let vc = UIHostingController(
            rootView: CapsuleView(
                icon: UIImage(
                    systemName: "chevron.left"
                )!,
                title: "Go Left",
                backgroundColor: .red,
                contentsColor: .white,
                borderColor: .clear
            )
        )
        
        let capsule = vc.view!
        capsule.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(vc)
        
        capsule.widthAnchor.constraint(equalToConstant: 100).isActive = true
        capsule.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        vc.didMove(toParent: self)
        
        return capsule
    }()
    
    var feedbackGenerator: UINotificationFeedbackGenerator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        setupGenerator()
    }

    func setupSubviews() {
        view.addSubview(lottieAnimatedView)
        lottieAnimatedView.addSubview(coinButton)
        
        view.addSubview(capsule)
        
        coinButton.addTarget(self, action: #selector(coinButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        lottieAnimatedView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        lottieAnimatedView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        lottieAnimatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottieAnimatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        coinButton.topAnchor.constraint(equalTo: lottieAnimatedView.topAnchor).isActive = true
        coinButton.bottomAnchor.constraint(equalTo: lottieAnimatedView.bottomAnchor).isActive = true
        coinButton.leadingAnchor.constraint(equalTo: lottieAnimatedView.leadingAnchor).isActive = true
        coinButton.trailingAnchor.constraint(equalTo: lottieAnimatedView.trailingAnchor).isActive = true
        
        capsule.topAnchor.constraint(equalTo: coinButton.bottomAnchor).isActive = true
        capsule.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupGenerator() {
        feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator?.prepare()
    }
    
    @objc func coinButtonTapped() {
        lottieAnimatedView.play(fromFrame: 1, toFrame: 20)
        feedbackGenerator?.notificationOccurred(.success)
    }
}

