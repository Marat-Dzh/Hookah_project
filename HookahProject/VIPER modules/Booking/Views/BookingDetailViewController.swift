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
    
    var bookingDetailModel = BookingDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookingDetailView.backgroundColor = .black
        
        let bdvc = BookingCardViewModel.makeExample()
        self.bookingDetailView.set(with: bdvc[1])
    
        self.bookingDetailView.onTapButtonToBasketItem = { [weak self] in
            print("Привет, добавил чай в корзину")
        }
    }
}


