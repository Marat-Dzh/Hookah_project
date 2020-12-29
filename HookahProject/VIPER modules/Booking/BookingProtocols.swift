
import Foundation
import UIKit

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
    
}

protocol BookingModuleInput: class{
<<<<<<< HEAD
    
=======
>>>>>>> fd0d6b1d6ddc58a959911a4f21d8cafdae217459
    
}

protocol BookingModuleOutput: class{
    func makeCatalog()
}

protocol BookingInteractorInput{
    func getCatalog()
    func addToBasket()
}

protocol BookingInteractorOutput: class{
    func makeMenuArray(arrayDicts: [[String : Any]], images: [String:URL])
}

protocol BookingRouterInput: class{
   
}

protocol BookingRouterOutput: class{
   
}
