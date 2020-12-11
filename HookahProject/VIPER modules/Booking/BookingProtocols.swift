
import Foundation
import UIKit

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
    
}

protocol BookingModuleInput{
    
    
}

protocol BookingModuleOutput: class{
    func makeCatalog()
}

protocol BookingInteractorInput{
    func getCatalog()
    func addToBasket()
}

protocol BookingInteractorOutput: class{
    func makeMenu(arrayDicts: [[String : Any]], image: UIImage)
}

protocol BookingRouterInput{
   
}
