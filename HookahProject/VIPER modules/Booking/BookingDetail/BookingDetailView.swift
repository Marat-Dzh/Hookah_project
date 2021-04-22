//
//  BookingDetailView.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit

final class BookingDetailView: AutoLayoutView {
    
    private let stackViewVerical = ScrollableStackView(config: .defaultVertical)
    var infoLabel = FullDescriptionView()
    var titleLabel = UILabel()
    var shortDescriptionLabel = UILabel()
    var imageView = UIImageView()

//    private let buttonToBasket  = ButtonToBasket()
//    var onTapButtonToBasketItem: (() -> Void)?
    
    
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(self.stackViewVerical)
        self.stackViewVerical.addArrangedSubview(self.imageView)
        self.stackViewVerical.addArrangedSubview(self.titleLabel)
        self.stackViewVerical.addArrangedSubview(self.shortDescriptionLabel)
        self.stackViewVerical.addArrangedSubview(self.infoLabel)
        self.imageView.contentMode = .scaleAspectFit
        
        self.titleLabel.textColor = .white
//        self.infoLabel.textColor = .white
//        self.infoLabel.numberOfLines = 10
        self.shortDescriptionLabel.textColor = .white
        self.infoLabel.autoresizingMask = [.flexibleHeight]
        //self.backgroundColor = .white
        
//        self.buttonToBasket.addTarget(self, action: #selector(onTapButtonToBasketFunc), for: .touchUpInside)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.stackViewVerical.pins(UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: -16.0))
        self.imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.stackViewVerical.setCustomSpacing(10.0, after: self.imageView)
        self.stackViewVerical.setCustomSpacing(10.0, after: self.titleLabel)
        self.stackViewVerical.setCustomSpacing(10.0, after: self.shortDescriptionLabel)
        self.stackViewVerical.setCustomSpacing(10.0, after: self.infoLabel)
        [
            self.imageView.heightAnchor.constraint(equalToConstant: 200)
        ].forEach { $0.isActive = true }

    }
    
//    @objc
//    private func onTapButtonToBasketFunc() {
//        self.onTapButtonToBasketItem?()
//
//    }
    

}
