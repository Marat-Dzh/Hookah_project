//
//  BookingDetailView.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit
import Kingfisher

class BookingDetailViewController : UIViewController {
    private var output: BookingDetailViewOutput
    
    private var bookingDetailView: BookingDetailView {
        self.view as! BookingDetailView
    }
    
    init(output: BookingDetailViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = BookingDetailView()
    }
    
    //var bookingDetailModel = BookingDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookingDetailView.backgroundColor = .black
        //self.bookingDetailView.imageView.image = self.bcvm.imageName
//        self.bookingDetailView.imageView.load(url: self.bcvm.imageName ?? URL.init(string: "https://pbs.twimg.com/profile_images/1186126408055173120/8RN3221B_400x400.jpg")!)

    }
}

extension BookingDetailViewController: BookingDetailViewInput {
    func setupBookingDetail(bcvm: BookingCardViewModel) {
        self.bookingDetailView.imageView.kf.setImage(with: bcvm.imageNameURL)
        self.bookingDetailView.titleLabel.text = bcvm.title
        self.bookingDetailView.shortDescriptionLabel.text = bcvm.shortDescription
        self.bookingDetailView.infoLabel.set(text: bcvm.info)
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
