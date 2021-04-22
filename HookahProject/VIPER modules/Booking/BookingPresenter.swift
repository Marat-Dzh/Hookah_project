//
//  BookingPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import Foundation

final class BookingPresenter{
    weak var view: BookingViewInput?
    weak var moduleOutput: BookingModuleOutput?
    private let router: BookingRouterInput
    private let interactor: BookingInteractorInput
    
    private var arrayBookingModels = [BookingCardViewModel]()
    private var dictMenuPictures = [String : URL]()

    
    init(_ router:BookingRouterInput,_ interactor:BookingInteractorInput){
        self.interactor = interactor
        self.router = router
    }
    
}

extension BookingPresenter: BookingModuleInput{
    
}

extension BookingPresenter: BookingInteractorOutput {
    func didLoadObjects(images: [String : URL], data: [[String : Any]]) {
        self.dictMenuPictures = images
        self.makeMenuArray(arrayDicts: data)
        self.makeMenu()
    }
    
    func didReciveError() {
        // show error on view
    }
}

extension BookingPresenter {
    private func makeDictPictUrl(namePic: String, urlPic: URL) {
        self.dictMenuPictures[namePic] = urlPic
    }
    
    private func makeMenuArray(arrayDicts: [[String : Any]]) {
        for arrayDict in arrayDicts{
            var helpArray = BookingCardViewModel(info: "", title: "", shortDescription: "", imageName: "", imageNameURL: URL.init(string: ""))
            for (key, value) in arrayDict{
                if (key == "info") {
                    helpArray.info = String(describing: value)
                } else if (key == "title") {
                    helpArray.title = String(describing: value)
                } else if (key == "shortDescription") {
                    helpArray.shortDescription = String(describing: value)
                } else if (key == "imageName"){
                    helpArray.imageName = String(describing: value)
                }
            }
            self.arrayBookingModels.append(helpArray)
        }
//        self.view?.set(viewModels:makeViewModels())
       // self.view?.set(viewModels: arrayBookingModels)
    }
    private func makeMenu(){
        for i in 0..<self.arrayBookingModels.count{
            var item = self.arrayBookingModels[i]
            for (key, value) in self.dictMenuPictures {
                if item.imageName == key {
                    item.imageNameURL = value
                }
            }
            self.arrayBookingModels[i] = item
        }
        self.view?.set(viewModels: self.arrayBookingModels)
    }
}

extension BookingPresenter: BookingViewOutput{
    func viewDidLoad(){
        self.interactor.fetchCatalog()
    }
    
    func showBookingDetailVC(bookingCardViewModel:  BookingCardViewModel) {
        self.router.bookingDetailVC(bookingCardViewModel: bookingCardViewModel)
    }
}

