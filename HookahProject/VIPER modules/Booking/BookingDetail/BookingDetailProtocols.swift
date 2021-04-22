//
//  BookingDetailProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 21.03.2021.
//

import Foundation

protocol BookingDetailModuleInput: class {
    func setBookingDetailInfo(bcvm: BookingCardViewModel)
}

protocol BookingDetailModuleOutput: class {
    
}

protocol BookingDetailViewInput: class {
    func setupBookingDetail(bcvm: BookingCardViewModel)
}

protocol BookingDetailViewOutput : class {

}

protocol BookingDetailInteractorInput {

}

protocol BookingDetailInteractorOutput: class {

}

protocol BookingDetailRouterInput: class {

}

protocol BookingDetailRouterOutput: class {
    
}
