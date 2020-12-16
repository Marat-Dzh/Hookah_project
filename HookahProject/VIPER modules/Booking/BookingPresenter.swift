//
//  BookingPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import Foundation
import UIKit

final class BookingPresenter{
    weak var view: BookingViewInput?
    weak var moduleOutput: BookingModuleOutput?
    private let router: BookingRouterInput
    private let interactor: BookingInteractorInput
    
    private var arrayBookingModels = [BookingCardViewModel]()
    
    init(_ router:BookingRouterInput,_ interactor:BookingInteractorInput){
        self.interactor = interactor
        self.router = router
    }
    
}

extension BookingPresenter: BookingModuleInput{
    
}

extension BookingPresenter: BookingInteractorOutput{
    func makeMenuArray(arrayDicts: [[String : Any]], images: [String:UIImage]) {
        print("arrayDicts COUNT: \(arrayDicts.count)")
        print("IMAGES: \(images.count)")
        for arrayDict in arrayDicts{
            var helpArray = BookingCardViewModel(info: "", title: "", shortDescription: "", imageName: UIImage(named: "hole")!)
            for (key, value) in arrayDict{
                if (key == "info") {
                    helpArray.info = String(describing: value)
                } else if (key == "title") {
                    helpArray.title = String(describing: value)
                } else if (key == "shortDescription") {
                    helpArray.shortDescription = String(describing: value)
                } else if (key == "imageName"){
                    helpArray.imageName = images[String(describing: value)]!
                }
            }
            arrayBookingModels.append(helpArray)
        }
//        self.view?.set(viewModels:makeViewModels())
        print("arrayBookingModel: \(arrayBookingModels)")
        self.view?.set(viewModels: arrayBookingModels)
    }
    
}

extension BookingPresenter: BookingViewOutput{
    func viewDidLoad(){
        self.interactor.getCatalog()
    }
}

private extension BookingPresenter {

}

