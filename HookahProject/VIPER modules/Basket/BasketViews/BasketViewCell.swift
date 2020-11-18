//
//  BasketViewCell.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.11.2020.
//

import UIKit

class BasketViewCell<T: UIView>: UITableViewCell {
    let basketContainerView: T
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.basketContainerView = T(frame: .zero)
        super.init(style: .default, reuseIdentifier: .none)
        self.contentView.addSubview(self.basketContainerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.basketContainerView.frame = self.contentView.frame
    }
}


