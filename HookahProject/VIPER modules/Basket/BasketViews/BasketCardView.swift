//
//  BasketCardView.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.11.2020.
//

import UIKit

class BasketCardView: UIView {
//    let basketImageName: String
//    let basketInfofoProduct: String
//    let basketShortDescription: String
    //private let basketINView = UIImageView()
    private let basketIPLabel = UILabel()
    private let basketSDLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.addSubview(self.basketINView)
        self.addSubview(self.basketIPLabel)
        self.addSubview(self.basketSDLabel)
        
        
        self.basketIPLabel.numberOfLines = 1
        self.basketIPLabel.font = Font.system(ofSize: 20, weight: .regular)
        self.basketIPLabel.textColor = .black
        
        self.basketSDLabel.numberOfLines = 1
        self.basketSDLabel.font = Font.system(ofSize: 20, weight: .regular)
        self.basketSDLabel.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - 16 * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        let basketIPLabelSize = self.basketIPLabel.sizeThatFits(maxLabelSize)
        self.basketIPLabel.frame.origin = CGPoint(x: self.frame.height + 10, y: self.frame.height/2 - 10)
        self.basketIPLabel.frame.size = basketIPLabelSize
        
        let basketSDLabelSize = self.basketSDLabel.sizeThatFits(maxLabelSize)
        self.basketSDLabel.frame.origin = CGPoint(x: self.frame.width - self.frame.height, y: self.frame.height/2 - 10)
        self.basketSDLabel.frame.size = basketSDLabelSize
        
       // self.basketINView.frame.size = CGSize(width: self.frame.height, height: self.frame.height)
        
    }
    
    
    func update(with viewModel: BasketCardViewModel){
        self.basketIPLabel.text = viewModel.basketInfoProduct
        self.basketSDLabel.text = viewModel.basketShortDescription
        //self.basketINView.image = UIImage(named: viewModel.basketImageName)
        self.setNeedsLayout()
    }
    
}
