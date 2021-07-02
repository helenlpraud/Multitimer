//
//  MultitimerViewController.swift
//  Multitimer
//
//  Created by Елена on 01.07.2021.
//

import UIKit

class myTimer {
    let name: String
    var completed = false
    var time: Int
    var leftTime: Int
    
    init(name: String, time: Int) {
        self.name = name
        self.time = time
        self.leftTime = time
    }
}

class MultitimerViewController: UIViewController {
    
    var timer: Timer?
    
    let multitimerView = MultitimerUIView()
    var timers: [myTimer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(multitimerView)
        multitimerView.table.delegate = self
        multitimerView.table.dataSource = self
        multitimerView.addTimeButton.addTarget(self, action: #selector(addNewTimer), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        multitimerView.frame = view.frame
        multitimerView.backgroundColor = .white
    }
    
    @objc func addNewTimer() {
        createTimer()
        
        let name = multitimerView.nameTimer.text ?? "testName"
        let time = Int(multitimerView.timeTimer.text ?? "0") ?? 0
        let newTimer = myTimer(name: name, time: time)
        timers.append(newTimer)
        timers = timers.sorted(by: { $0.leftTime > $1.leftTime })
        multitimerView.table.isHidden = false
        multitimerView.table.reloadData()
    }
}

extension MultitimerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .none
        tableView.separatorStyle = .none
        
        let timer = timers[indexPath.row]
        
        let cell: TimerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TimerTableViewCell
        cell.backgroundColor = #colorLiteral(red: 0.9763852954, green: 0.9765252471, blue: 0.9763546586, alpha: 1)
        cell.name.text = timer.name
        
        cell.timer = timers[indexPath.row]
        
        return cell
    }

}

extension MultitimerViewController {
    func createTimer() {
      if timer == nil {
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
          target: self,
          selector: #selector(updateTimer),
          userInfo: nil,
          repeats: true)
        
        self.timer = timer
      }
    }
    
    func cancelTimer() {
      timer?.invalidate()
      timer = nil
    }
    
    @objc func updateTimer() {
        guard let visibleRowsIndexPaths = multitimerView.table.indexPathsForVisibleRows else {
        return
      }
      
      for indexPath in visibleRowsIndexPaths {
        if let cell = multitimerView.table.cellForRow(at: indexPath)
            as? TimerTableViewCell {
          cell.updateTime()
            if (cell.timer?.leftTime == 0) {
                timers.remove(at: indexPath.row)
                multitimerView.table.reloadData()
            }
        }
      }
    }
}

