//
//  AVAudioLooperViewController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/27.
//

import UIKit

class AVAudioLooperViewController: AVMainViewController {
    
    private let containerView = UIView()
    private let leftImageView = UIImageView(image: UIImage(named: "guitar"))
    private let leftPanKnob = AVAudioRotaryKnobControl()
    private let leftValumnKnob = AVAudioRotaryKnobControl()
    
    private let centerImageView = UIImageView(image: UIImage(named: "bass"))
    private let centerPanKnob = AVAudioRotaryKnobControl()
    private let centerValumnKnob = AVAudioRotaryKnobControl()
    
    private let rightImageView = UIImageView(image: UIImage(named: "drum"))
    private let rightPanKnob = AVAudioRotaryKnobControl()
    private let rightValumnKnob = AVAudioRotaryKnobControl()
    
    
    private let rateKnob = AVAudioRotaryKnobControl()
    
    override class func description() -> String {
        return "Audio Looper"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        xy_forceRotate(orientation: .landscapeRight)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        xy_forceRotate(orientation: .portrait)
    }
    
    private func createViews() {
//        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        
        view.backgroundColor = .hexColor(0x383838)
        
        containerView.backgroundColor = .hexColor(0x272727)
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(view.snp.width).multipliedBy(0.75)
        }
        
        leftImageView.contentMode = .scaleAspectFit
        containerView.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            
        }
    }
   

}
