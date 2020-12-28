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
    
    var bcvm = BookingCardViewModel(info: "", title: "", shortDescription: "", imageName: URL.init(string: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookingDetailView.backgroundColor = .black
        //self.bookingDetailView.imageView.image = self.bcvm.imageName
        self.bookingDetailView.imageView.load(url: self.bcvm.imageName!)
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


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
