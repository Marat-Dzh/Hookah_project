
import Foundation

protocol BookingViewInput: class{
    func set(viewModels: [BookingCardViewModel])
}

protocol BookingViewOutput : class{
    func viewDidLoad()
}

protocol BookingModuleInput{
    
    
}

protocol BookingModuleOutput: class{
    
}

protocol BookingInteractorInput{
//    func addComponent()
//    func confirmOrder()
}

protocol BookingInteractorOutput: class{
//    func confirmAdding()
//    func confirmNewOrder()
}

protocol BookingRouterInput{
//    func openConstructor()
}
