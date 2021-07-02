//
//  MultitimerUIView.swift
//  Multitimer
//
//  Created by Елена on 01.07.2021.
//

import UIKit
import SnapKit

class MultitimerUIView: UIView {
    
    private let firstGrayView: UIView = {
        let firstGrayView = UIView()
        firstGrayView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489067197, alpha: 1)
        return firstGrayView
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        title.text = "Мульти таймер"
        return title
    }()
    
    private let grayView: UIView = {
        let grayView = UIView()
        grayView.backgroundColor = #colorLiteral(red: 0.9763852954, green: 0.9765252471, blue: 0.9763546586, alpha: 1)
        return grayView
    }()
    
    private let grayLine: UIView = {
        let grayLine = UIView()
        grayLine.backgroundColor = #colorLiteral(red: 0.7605746388, green: 0.7612934709, blue: 0.7678839564, alpha: 1)
        return grayLine
    }()
    
    private let grayLine2: UIView = {
        let grayLine = UIView()
        grayLine.backgroundColor = #colorLiteral(red: 0.7605746388, green: 0.7612934709, blue: 0.7678839564, alpha: 1)
        return grayLine
    }()
    
    private let grayLine3: UIView = {
        let grayLine = UIView()
        grayLine.backgroundColor = #colorLiteral(red: 0.7605746388, green: 0.7612934709, blue: 0.7678839564, alpha: 1)
        return grayLine
    }()

    private let titleGrayView: UILabel = {
        let titleTask = UILabel()
        titleTask.textColor = #colorLiteral(red: 0.5564509034, green: 0.5580769181, blue: 0.5747948289, alpha: 1)
        titleTask.text = "Добавление таймеров"
        return titleTask
    }()
    
    private let nameContainer: UIView = {
        let nameContainer = UIView()
        nameContainer.backgroundColor = #colorLiteral(red: 0.9763852954, green: 0.9765252471, blue: 0.9763546586, alpha: 1)
        nameContainer.layer.borderColor = #colorLiteral(red: 0.815472126, green: 0.8161981106, blue: 0.8227795362, alpha: 1)
        nameContainer.layer.borderWidth = 1
        nameContainer.layer.cornerRadius = 10
        nameContainer.layer.masksToBounds = true
        return nameContainer
    }()
    
    private let timeContainer: UIView = {
        let timeContainer = UIView()
        timeContainer.backgroundColor = #colorLiteral(red: 0.9763852954, green: 0.9765252471, blue: 0.9763546586, alpha: 1)
        timeContainer.layer.borderColor = #colorLiteral(red: 0.815472126, green: 0.8161981106, blue: 0.8227795362, alpha: 1)
        timeContainer.layer.borderWidth = 1
        timeContainer.layer.cornerRadius = 10
        timeContainer.layer.masksToBounds = true
        return timeContainer
    }()
    
    let nameTimer: UITextField = {
        let nameTimer = UITextField()
        nameTimer.placeholder = "Название таймера"
        return nameTimer
    }()
    
    let timeTimer: UITextField = {
        let timeTimer = UITextField()
        timeTimer.placeholder = "Время в секундах"
        return timeTimer
    }()
    
    let addTimeButton: UIButton = {
        let addTimetButton = UIButton()
        addTimetButton.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489067197, alpha: 1)
        addTimetButton.setTitle("Добавить", for: .normal)
        addTimetButton.setTitleColor(#colorLiteral(red: 0.1306751072, green: 0.5215091109, blue: 0.9667938352, alpha: 1), for: .normal)
        addTimetButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        addTimetButton.layer.cornerRadius = 20
        addTimetButton.layer.masksToBounds = true
        return addTimetButton
    }()
    
    private let titleTable: UILabel = {
        let titleTable = UILabel()
        titleTable.text = "Taймеры"
        titleTable.textColor = #colorLiteral(red: 0.5564509034, green: 0.5580769181, blue: 0.5747948289, alpha: 1)
        return titleTable
    }()
    
    let table: UITableView = {
        let table = UITableView()
        table.register(TimerTableViewCell.self, forCellReuseIdentifier: "CellID")
        table.isHidden = true
        table.backgroundColor = .clear
        return table
    }()
    
    let tableContainer: UIView = {
        let tableContainer = UIView()
        tableContainer.backgroundColor = #colorLiteral(red: 0.9763852954, green: 0.9765252471, blue: 0.9763546586, alpha: 1)
        return tableContainer
    }()
    
    func setSettings() {
        
        addSubview(firstGrayView)
        firstGrayView.addSubview(title)
        
        addSubview(grayView)
        grayView.addSubview(titleGrayView)
        
        addSubview(grayLine)
        
        addSubview(nameContainer)
        nameContainer.addSubview(nameTimer)
        
        addSubview(timeContainer)
        timeContainer.addSubview(timeTimer)
        
        addSubview(addTimeButton)
        addSubview(tableContainer)
        
        tableContainer.addSubview(titleTable)
        tableContainer.addSubview(table)
        tableContainer.addSubview(grayLine2)
        tableContainer.addSubview(grayLine3)
        
        firstGrayView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(self)
            make.height.equalTo(80)
        }
        
        title.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(firstGrayView).offset(-10)
            make.centerX.equalTo(firstGrayView)
        }
        
        grayView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(100)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(45)
        }

        grayLine.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self)
            make.bottom.equalTo(grayView).offset(2)
            make.height.equalTo(2)
        }

        titleGrayView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(grayView).offset(-10)
            make.left.equalTo(self).offset(30)
        }

        nameContainer.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(grayView.snp_bottomMargin).offset(35)
            make.left.equalTo(self).offset(25)
            make.height.equalTo(30)
            make.width.equalTo(235)
        }

        nameTimer.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(nameContainer).offset(5)
            make.top.equalTo(nameContainer).offset(5)
        }
        
        timeContainer.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nameContainer.snp_bottomMargin).offset(25)
            make.left.equalTo(nameContainer)
            make.height.equalTo(nameContainer)
            make.width.equalTo(nameContainer)
        }

        timeTimer.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(timeContainer).offset(5)
            make.top.equalTo(timeContainer).offset(5)
        }

        addTimeButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(timeContainer.snp_bottomMargin).offset(40)
            make.height.equalTo(65)
        }
        
        tableContainer.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(addTimeButton.snp_bottomMargin).offset(20)
            make.bottom.equalTo(self).offset(-30)
        }
        
        titleTable.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(titleGrayView)
            make.bottom.equalTo(grayLine2).offset(-10)
        }
        
        table.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(tableContainer).offset(45)
            make.bottom.equalTo(tableContainer)
        }
        
        grayLine2.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(table).offset(-2)
            make.height.equalTo(2)
        }
        
        grayLine3.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(table.snp_bottomMargin).offset(-2)
            make.height.equalTo(2)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setSettings()
    }
    


}
