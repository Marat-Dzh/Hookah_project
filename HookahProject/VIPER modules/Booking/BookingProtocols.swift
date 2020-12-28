
import Foundation

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
    func makeModels()
}

protocol BookingRouterInput{
   
}
