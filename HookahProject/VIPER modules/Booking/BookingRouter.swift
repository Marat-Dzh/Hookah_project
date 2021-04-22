//
//  BookingRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.


import Foundation
final class BookingRouter: BaseRouter{
    weak var output: BookingRouterOutput?
    weak var bookingDetailModuleInput: BookingDetailModuleInput?
    override init() {
        
    }
}

extension BookingRouter: BookingRouterInput{
    func bookingDetailVC(bookingCardViewModel: BookingCardViewModel) {
        let bookinfDetailContext = BookingDetailContext(bookingCardViewModel: bookingCardViewModel, moduleOutput: nil)
        let bookingDetailContainer = BookingDetailContainer.assemble(context: bookinfDetailContext)
        
        self.bookingDetailModuleInput = bookingDetailContainer.moduleInput


        if let bookingDetailModuleInput = self.bookingDetailModuleInput {
            bookingDetailModuleInput.setBookingDetailInfo(bcvm: bookingCardViewModel)
        } else {
            print("oooops...")
        }
        
        self.navigationController?.pushViewController(bookingDetailContainer.viewController, animated: true)
    }
    
//    func bookingDetailVC(bookingCardViewModel:  BookingCardViewModel) {
//        self.navigationController?.pushViewController(BookingDetailViewController(), animated: true)
//    }
}
