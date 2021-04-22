//
//  BookingCardView.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit
import Kingfisher

class BookingCardView: AutoLayoutView{
    
    private let infoLabel = UILabel()
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let cardImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    

    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    private func setup(){
        setupCardImageView()
        setupTitleLabel()
        setupShortDescriptionLabel()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cardImageView.widthAnchor.constraint(equalToConstant: self.frame.height),
            self.cardImageView.heightAnchor.constraint(equalToConstant: self.frame.height),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.cardImageView.trailingAnchor, constant: 5.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            
            self.shortDescriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10.0),
            self.shortDescriptionLabel.leadingAnchor.constraint(equalTo: self.cardImageView.trailingAnchor, constant: 5.0),
            self.shortDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0)
            
            
        ].forEach{$0.isActive = true}
    }
    
    func update(with viewModel: BookingCardViewModel){
        self.infoLabel.text = viewModel.info
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.shortDescription
        //self.cardImageView.image =  viewModel.imageName
//        self.cardImageView.load(url: ((viewModel.imageName ?? URL.init(string: "https://pbs.twimg.com/profile_images/1186126408055173120/8RN3221B_400x400.jpg"))!))
        self.cardImageView.kf.setImage(with: viewModel.imageNameURL)
        self.setNeedsLayout()
    }
}

extension BookingCardView {
    func setupCardImageView() {
        self.addSubview(self.cardImageView)

    }
    
    func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        self.titleLabel.font = Font.system(ofSize: 20, weight: .bold)
        self.titleLabel.textColor = .white
        self.titleLabel.numberOfLines = 1
        //        self.titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        //        self.titleLabel.numberOfLines = 0
    }
    
    func setupShortDescriptionLabel() {
        self.addSubview(self.shortDescriptionLabel)
        self.shortDescriptionLabel.font = Font.system(ofSize: 16, weight: .regular)
        self.shortDescriptionLabel.textColor = .white
    }
}




//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let maxLabelWidth = self.frame.width - Constans.margin * 2
//        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
//
//        let infoLabelSize = self.infoLabel.sizeThatFits(maxLabelSize)
//        self.infoLabel.frame.origin = CGPoint(x: self.frame.height, y: Constans.margin)
//        self.infoLabel.frame.size = infoLabelSize
//
//
//        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
//        let shortDescriptionOrigin = CGPoint(x: self.frame.height + Constans.margin, y: self.frame.height - Constans.margin - shortDescriptionSize.height)
//        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
//        self.shortDescriptionLabel.frame.size = shortDescriptionSize

////        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
////        let titleLabelOrigin = CGPoint(x: Constans.margin, y: self.shortDescriptionLabel.frame.minY - Constans.margin - titleLabelSize.height)
////        self.titleLabel.frame.origin = titleLabelOrigin
////        self.titleLabel.frame.size = titleLabelSize
//        //self.titleLabel.sizeToFit()

//        //Картинки
//        self.cardImageView.frame.size = CGSize(width: self.frame.height, height: self.frame.height)

//    }

//private struct Constans {
//    static let margin: CGFloat = 16
//}
