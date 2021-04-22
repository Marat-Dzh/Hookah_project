//
//  BookingViewCell.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit

class BookingViewCell<T: UIView>: UICollectionViewCell {
    
    let containerView: T
    
    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
