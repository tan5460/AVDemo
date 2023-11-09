//
//  AVRecordViewController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class AVRecordViewController: AVMainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "录制"
        view.backgroundColor = UIColor.hexColor(0xEEEEEE)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
