//
//  BookingDetailView.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit

final class BookingDetailView: AutoLayoutView {
    
    var infoLabel = UILabel()
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
    
//    func set(with viewModel: BookingCardViewModel) {
//        self.imageView.image = UIImage(named: viewModel.imageName)
//        self.titleLabel.text = viewModel.title
//        self.infoLabel.text = viewModel.info
//        self.shortDescriptionLabel.text = viewModel.shortDescription
//    }
    
    private func setup() {
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.shortDescriptionLabel)
        self.addSubview(self.infoLabel)
//        self.addSubview(self.buttonToBasket)
        self.imageView.contentMode = .scaleAspectFit
        
        self.titleLabel.textColor = .white
        self.infoLabel.textColor = .white
        self.infoLabel.numberOfLines = 10
        self.shortDescriptionLabel.textColor = .white
        
        //self.backgroundColor = .white
        
        
//        self.buttonToBasket.addTarget(self, action: #selector(onTapButtonToBasketFunc), for: .touchUpInside)
    }
    
    override func setupConstraints() {
        super.setupConstraints()

        [
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 200),

            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 24.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.shortDescriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.shortDescriptionLabel.leadingAnchor.constraint(equalTo: self.infoLabel.leadingAnchor),
            self.shortDescriptionLabel.trailingAnchor.constraint(equalTo: self.infoLabel.trailingAnchor),
            
            self.infoLabel.topAnchor.constraint(equalTo: self.shortDescriptionLabel.bottomAnchor, constant: 24.0),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
//            self.infoLabel.bottomAnchor.constraint(equalTo: self.shortDescriptionLabel.topAnchor, constant: -4.0),
            
        ].forEach { $0.isActive = true }

        //self.buttonToBasket.attach(to: self)
    }
    
//    @objc
//    private func onTapButtonToBasketFunc() {
//        self.onTapButtonToBasketItem?()
//
//    }
    

}
