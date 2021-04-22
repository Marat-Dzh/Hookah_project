//
//  CircleCollectionViewCell.swift
//  testApp
//
//  Created by M Dzh on 06.12.2020.
//

import UIKit

extension UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

final class CircleCollectionViewCell: UICollectionViewCell {
    
    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    override var bounds: CGRect {
        didSet {
            // перерисовывает всё
            layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(circleImageView)
        circleImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        circleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        circleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        circleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // для создания окружности
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        circleImageView.image = nil
    }
    // установка картинки из вью контроллера
    func configureWith(image: UIImage) {
        circleImageView.image = image
    }
}
