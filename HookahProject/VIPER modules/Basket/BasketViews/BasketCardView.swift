//
//  BasketCardView.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.11.2020.
//

import UIKit

class BasketCardView: UIView {
//    let basketImageName: String
//    let basketInfoProduct: String
//    let basketShortDescription: String
    private let basketIN = UIImageView()
    private let basketIP = UILabel()
    private let basketSD = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.basketIN)
        self.addSubview(self.basketIP)
        self.addSubview(self.basketSD)
        
        
        self.basketIP.numberOfLines = 1
        self.basketIP.font = Font.system(ofSize: 20, weight: .regular)
        self.basketIP.textColor = .black
        
        self.basketSD.numberOfLines = 1
        self.basketSD.font = Font.system(ofSize: 20, weight: .regular)
        self.basketSD.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - 16 * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        let basketIPSize = self.basketIP.sizeThatFits(maxLabelSize)
        self.basketIP.frame.origin = CGPoint(x: self.frame.height + 10, y: self.frame.height/2 - 10)
        self.basketIP.frame.size = basketIPSize
        
        let basketSDSize = self.basketSD.sizeThatFits(maxLabelSize)
        self.basketSD.frame.origin = CGPoint(x: self.frame.width - self.frame.height, y: self.frame.height/2 - 10)
        self.basketSD.frame.size = basketSDSize
        
        self.basketIN.frame.size = CGSize(width: self.frame.height, height: self.frame.height)
        
    }
    
    func update(with viewModel: BasketCardViewModel){
        self.basketIP.text = viewModel.basketInfoProduct
        self.basketSD.text = viewModel.basketShortDescription
        self.basketIN.image = UIImage(named: viewModel.basketImageName)
        self.setNeedsLayout()
    }
    
}
