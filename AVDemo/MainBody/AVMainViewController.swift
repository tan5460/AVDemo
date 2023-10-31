//
//  AVMainViewController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class AVMainViewController: XYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        main_createBackButton()
    }
    
    
    func main_createBackButton() {
        if navigationController?.viewControllers.first != self {
            let backBtn = UIButton(type: .custom)
            backBtn.setImage(UIImage(named: "common_navi_back"), for: .normal)
            backBtn.addTarget(self, action: #selector(main_backAction(sender:)), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        }
    }
    
    @objc func main_backAction(sender: UIButton) {
        if isBeingPresented {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

}
