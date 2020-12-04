//
//  TableReserveCell.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

class TableReserveCell<T: UIView>: UITableViewCell {
    
    let containerView: T
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = T(frame: .zero)
        super.init(style: .default, reuseIdentifier: .none)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
}

