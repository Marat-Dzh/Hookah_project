//
//  BookingDetailView.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit

final class BookingDetailView: AutoLayoutView {
    
    private let infoLabel = UILabel()
    //private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    private let buttonToBasket  = ButtonToBasket()
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func set(_ viewModel: BookingCardViewModel){
//        self.imageView.image = UIImage(named: viewModel.imageName)
//        self.infoLabel.text = viewModel.info
//        self.shortDescriptionLabel.text = viewModel.shortDescription
//    }
    func set(_ viewModel: BookingCardViewModel){
        self.imageView.image = UIImage(named: viewModel.imageName)
        self.infoLabel.text = viewModel.info
        self.shortDescriptionLabel.text = viewModel.shortDescription
    }
    
    private func setup() {
        self.addSubview(self.imageView)
        self.addSubview(self.infoLabel)
        self.addSubview(self.shortDescriptionLabel)
        self.addSubview(self.buttonToBasket)
        self.imageView.contentMode = .scaleAspectFit
        
        self.infoLabel.textColor = .white
        self.shortDescriptionLabel.textColor = .white
        
        self.backgroundColor = .white
    }
    
    override func setupConstraints() {
        super.setupConstraints()

        [
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 200),

            self.infoLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 24.0),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
//            self.infoLabel.bottomAnchor.constraint(equalTo: self.shortDescriptionLabel.topAnchor, constant: -4.0),
            
            self.shortDescriptionLabel.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor, constant: 4.0),
            self.shortDescriptionLabel.leadingAnchor.constraint(equalTo: self.infoLabel.leadingAnchor),
            self.shortDescriptionLabel.trailingAnchor.constraint(equalTo: self.infoLabel.trailingAnchor),


        ].forEach { $0.isActive = true }

        self.buttonToBasket.attach(to: self)
    }
}
