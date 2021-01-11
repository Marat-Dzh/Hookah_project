
import Foundation
import UIKit

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
    
}

protocol BookingModuleOutput: class{
    //func makeCatalog()
}

protocol BookingModuleInput: class{
    
}

protocol BookingInteractorInput{
    func fetchCatalog()
    func addToBasket()
}

protocol BookingInteractorOutput: class{
    func makeMenuArray(arrayDicts: [[String : Any]], images: [String:URL])
}

protocol BookingRouterInput: class{
   
}

protocol BookingRouterOutput: class{
   
}
