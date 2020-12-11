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
    weak var moduleOutput: LoginModuleOutput?
    private let router: BookingRouterInput
    private let interactor: BookingInteractorInput
    
    private var arrayBookingModel = [BookingCardViewModel]()
    
    init(_ router:BookingRouterInput,_ interactor:BookingInteractorInput){
        self.interactor = interactor
        self.router = router
    }
    
}

extension BookingPresenter: BookingModuleInput{
    
}

extension BookingPresenter: BookingInteractorOutput{
    func makeMenu(arrayDicts: [[String : Any]], image: UIImage) {
        for arrayDict in arrayDicts{
            var helpArray = BookingCardViewModel(info: "", title: "", shortDescription: "", imageName: image)
            //print("arrayDict: \(arrayDict)")
            for (key, value) in arrayDict{
                //print("key: \(key) --- value \(value)")
                if (key == "info") {
                    helpArray.info = String(describing: value)
                } else if (key == "title") {
                    helpArray.title = String(describing: value)
                } else if (key == "shortDescription") {
                    helpArray.shortDescription = String(describing: value)
                }
                helpArray.imageName = image
            }
            arrayBookingModel.append(helpArray)
        }
//        self.view?.set(viewModels:makeViewModels())
        print("arrayBookingModel: \(arrayBookingModel)")
        self.view?.set(viewModels: arrayBookingModel)
    }
}

extension BookingPresenter: BookingViewOutput{
    func viewDidLoad(){
        self.interactor.getCatalog()
    }
}

private extension BookingPresenter {
    func makeViewModels() -> [BookingCardViewModel] {
        return [BookingCardViewModel(info: "info1", title: "Кальян на чаше", shortDescription: "800 руб.", imageName: UIImage(named: "Constructor")!),
                BookingCardViewModel(info: "info1", title: "Кальян на грейпфруте", shortDescription: "1200 руб.", imageName: UIImage(named: "Constructor")!)]
    }
}
