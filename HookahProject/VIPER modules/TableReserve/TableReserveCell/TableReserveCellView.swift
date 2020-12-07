//
//  TableReserveCellView.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

class TableReserveCellView: AutoLayoutView {
    private let numberGuestLabel = UILabel()
    private let timeReserveLabel = UILabel()
    private let nameUserLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
        
    }
    
    private func setup() {
        self.setupNumberGuestLabel()
        self.setupTimeReserveLabel()
        self.setupNameUserLabel()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.numberGuestLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.numberGuestLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            
            self.timeReserveLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.timeReserveLabel.leadingAnchor.constraint(equalTo: self.numberGuestLabel.trailingAnchor, constant: 10.0),
            
            self.nameUserLabel.topAnchor.constraint(equalTo: self.timeReserveLabel.bottomAnchor, constant: 10.0),
            self.nameUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0)
            
        ].forEach{$0.isActive = true}
    }
    
    func updateCellTableReserve(with viewModelReserve: TableReserveModel, with viewModelPersonInfo: PersonInfo) {
        self.numberGuestLabel.text = "Количество: " + viewModelReserve.numberGuest
        self.timeReserveLabel.text = "Дата: " + viewModelReserve.timeReserve
        self.nameUserLabel.text = "Имя: " + viewModelPersonInfo.fio
        self.setNeedsLayout()
    }
}

extension TableReserveCellView {
    func setupNumberGuestLabel() {
        self.addSubview(self.numberGuestLabel)
        self.numberGuestLabel.textColor = .black
    }
    
    func setupTimeReserveLabel() {
        self.addSubview(self.timeReserveLabel)
        self.timeReserveLabel.textColor = .black
    }
    func setupNameUserLabel() {
        self.addSubview(self.nameUserLabel)
        self.nameUserLabel.textColor = .black
    }
}
