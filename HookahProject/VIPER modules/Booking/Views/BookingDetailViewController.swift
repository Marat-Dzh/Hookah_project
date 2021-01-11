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
        self.bookingDetailView.imageView.load(url: self.bcvm.imageName ?? URL.init(string: "https://pbs.twimg.com/profile_images/1186126408055173120/8RN3221B_400x400.jpg")!)
        self.bookingDetailView.titleLabel.text = self.bcvm.title
        self.bookingDetailView.shortDescriptionLabel.text = self.bcvm.shortDescription
        self.bookingDetailView.infoLabel.set(text: self.bcvm.info)
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
