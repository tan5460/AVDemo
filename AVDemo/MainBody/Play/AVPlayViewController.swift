//
//  AVPlayViewController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class AVPlayViewController: AVMainViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    
    let dataList = [[AVAudioLooperViewController.self]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "播放"
        createViews()
    }
    
    private func createViews() {
        
        tableView.backgroundColor = .hexColor(0xF9F9F9)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
  
}

extension AVPlayViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = dataList[section]
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let list = dataList[indexPath.section]
        let cls = list[indexPath.row]
        cell.textLabel?.text = cls.description()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = dataList[indexPath.section]
        let cls = list[indexPath.row]
        XYCurrentVC?.navigationController?.pushViewController(cls.init(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
