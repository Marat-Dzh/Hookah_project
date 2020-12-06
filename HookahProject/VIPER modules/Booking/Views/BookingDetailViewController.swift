//
//  BookingDetailView.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit

class BookingDetailViewController : UIViewController {
    
    
    private var bookingDetailView: BookingDetailView {
        self.view as! BookingDetailView
    }
    
    
    
    override func loadView() {
        self.view = BookingDetailView()
    }
    
    //var bookingDetailModel = BookingDetailView()
    
    var bcvm = BookingCardViewModel(info: "", title: "", shortDescription: "", imageName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookingDetailView.backgroundColor = .black
        self.bookingDetailView.imageView.image = UIImage(named: self.bcvm.imageName)
        self.bookingDetailView.titleLabel.text = self.bcvm.title
        self.bookingDetailView.shortDescriptionLabel.text = self.bcvm.shortDescription
        self.bookingDetailView.infoLabel.text = self.bcvm.info

     
//        let bdvc = BookingCardViewModel.makeExample()
//        self.bookingDetailView.set(with: bdvc[1])
        
        
    
//        self.bookingDetailView.onTapButtonToBasketItem = { [weak self] in
//            
//            print("Привет, добавил чай в корзину")
//        }
    }
}


