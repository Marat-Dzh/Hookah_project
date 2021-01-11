//
//  ViewStoryViewController.swift
//  testApp
//
//  Created by M Dzh on 06.12.2020.
//

import UIKit

class ViewStoryViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "berrytea")!
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        if #available(iOS 13.0, *) {
            let closeButton = UIButton(type: .system)
            closeButton.setTitle("✕", for: .normal)
            closeButton.titleLabel?.font = .boldSystemFont(ofSize: 34)
            closeButton.backgroundColor = .init(white: 0.25, alpha: 0.3)
            closeButton.layer.cornerRadius = 20
            closeButton.layer.masksToBounds = true
            closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
            
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(closeButton)
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
            closeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            closeButton.heightAnchor.constraint(equalToConstant: 50).isActive  = true
        } else {
            // Fallback on earlier versions
        }

    }
    
    @objc private func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
