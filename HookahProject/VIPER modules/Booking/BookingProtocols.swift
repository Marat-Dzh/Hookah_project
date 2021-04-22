
import Foundation
import UIKit

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
    func showBookingDetailVC(bookingCardViewModel:  BookingCardViewModel)
}

protocol BookingModuleOutput: class{
    //func makeCatalog()
}

protocol BookingModuleInput: class{
    
}

protocol BookingInteractorInput{
    func fetchCatalog()
}

protocol BookingInteractorOutput: class{
    func didLoadObjects(images: [String : URL], data: [[String : Any]])
    func didReciveError()
}

protocol BookingRouterInput: class{
    func bookingDetailVC(bookingCardViewModel:  BookingCardViewModel)
}

protocol BookingRouterOutput: class{
   
}
