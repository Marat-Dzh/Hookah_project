//
//  BookingDetailViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.11.2020.
//

import UIKit

class BookingConstructorHookahVC : UIViewController {
    
    private let infoLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    private let buttonToBasket  = ButtonToBasket()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Конструктор кальяна"
        self.view.backgroundColor = .darkGray
        
    }
    
    
}
