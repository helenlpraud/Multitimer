//
//  TimetTableViewCell.swift
//  Multitimer
//
//  Created by Елена on 01.07.2021.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
    
    var timer: myTimer? {
        didSet {
            name.text = timer?.name
            setState()
            updateTime()
        }
    }
    
    func updateState() {
      guard let timer = timer else {
        return
      }
      
      timer.completed.toggle()
      
      setState()
      updateTime()
    }
    
    func updateTime() {
        
      guard let timer = timer else {
        return
      }
      
      if !timer.completed {
        
        let currentTime = timer.leftTime
        let m = (currentTime % 3600) / 60
        let s = (currentTime % 3600) % 60
        time.text = String(format:"%d:%02d", m, s)
        timer.leftTime -= 1
      }
    }
    
    private func setState() {
        guard timer != nil else {
        return
      }
    }
    
    var name: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        name.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return name
    }()
    
    var time: UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        time.textColor = #colorLiteral(red: 0.6428650618, green: 0.6438763738, blue: 0.6538501382, alpha: 1)
        return time
    }()
    
    func setupViews() {
        addSubview(name)
        addSubview(time)
        
        name.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(30)
        }
        
        time.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(name)
            make.right.equalTo(self).offset(-30)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdentifiere: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifiere)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
