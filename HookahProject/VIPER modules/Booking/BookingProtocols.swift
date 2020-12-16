
import Foundation
import UIKit

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
    
}

protocol BookingModuleInput: class{
    
    
}

protocol BookingModuleOutput: class{
    func makeCatalog()
}

protocol BookingInteractorInput{
    func getCatalog()
    func addToBasket()
}

protocol BookingInteractorOutput: class{
    func makeMenuArray(arrayDicts: [[String : Any]], images: [String:UIImage])
}

protocol BookingRouterInput: class{
   
}

protocol BookingRouterOutput: class{
   
}
