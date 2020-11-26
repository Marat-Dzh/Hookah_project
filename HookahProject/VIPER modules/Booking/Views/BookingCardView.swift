//
//  BookingCardView.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit

class BookingCardView: UIView{
    
    private let infoLabel = UILabel()
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let cardImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(self.cardImageView)
        self.addSubview(self.infoLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.shortDescriptionLabel)

//        self.layer.cornerRadius = 30
//        self.layer.masksToBounds = true
 
        
        //self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 1

        self.infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.infoLabel.numberOfLines = 0
        
        
        self.infoLabel.font = Font.system(ofSize: 20, weight: .bold)
        self.infoLabel.textColor = .white
        //self.titleLabel.font = Font.system(ofSize: 32, weight: .bold)
        //self.titleLabel.textColor = .white
        self.shortDescriptionLabel.font = Font.system(ofSize: 16, weight: .regular)
        //self.shortDescriptionLabel.textColor = UIColor.rgba(158, 158, 158)
        self.shortDescriptionLabel.textColor = .white
        
        //self.imageView.contentMode = .scaleAspectFill
    }
    

    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxLabelWidth = self.frame.width - Constans.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        let infoLabelSize = self.infoLabel.sizeThatFits(maxLabelSize)
        self.infoLabel.frame.origin = CGPoint(x: self.frame.height, y: Constans.margin)
        self.infoLabel.frame.size = infoLabelSize
        
        
        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: self.frame.height + Constans.margin, y: self.frame.height - Constans.margin - shortDescriptionSize.height)
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionSize
        
        
//        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
//        let titleLabelOrigin = CGPoint(x: Constans.margin, y: self.shortDescriptionLabel.frame.minY - Constans.margin - titleLabelSize.height)
//        self.titleLabel.frame.origin = titleLabelOrigin
//        self.titleLabel.frame.size = titleLabelSize
        //self.titleLabel.sizeToFit()
        

        //Картинки
        self.cardImageView.frame.size = CGSize(width: self.frame.height, height: self.frame.height)
        

    }
    
    func update(with viewModel: BookingCardViewModel){
        self.infoLabel.text = viewModel.info
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.shortDescription
        self.cardImageView.image = UIImage(named: viewModel.imageName)
        self.setNeedsLayout()
    }
}


private struct Constans {
    static let margin: CGFloat = 16
}
