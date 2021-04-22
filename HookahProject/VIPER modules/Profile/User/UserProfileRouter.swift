//
//  UserProfileRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import UIKit

final class UserProfileRouter: BaseRouter {
    weak var output: UserProfileRouterOutput?
    weak var viewController: UIViewController?
    override init() {
        
    }
}

extension UserProfileRouter: UserProfileRouterInput {
    func showChangeScores(){
        let changeScoresContainer = ChangeScoresContainer.assemble()
        self.navigationController?.pushViewController(changeScoresContainer.viewController, animated: true)
    }
    
    func showTableReserve() {
        let tableReserveContainer = TableReserveContainer.assemble()
        self.navigationController?.pushViewController(tableReserveContainer.viewController, animated: true)
    }
    
    func callNumber(){
        guard let number1 = URL(string: "tel://" + "+74957064148")  else { return }
        UIApplication.shared.open(number1)
    }
    
    func showMap() {
        let acMaps = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let yandexMap = UIAlertAction(title: "Яндекс.Карты", style: .default) { _ in
            if let url = URL(string: "yandexmaps://maps.yandex.ru/?oid=236017618097"){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        }
        
        let googleMap = UIAlertAction(title: "Google Maps", style: .default) { _ in
            if let url = URL(string: "https://goo.gl/maps/7tH2gjuAz8aqBkMw6"){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }

        }
        
        let appleMap = UIAlertAction(title: "Карты", style: .default) { _ in
            if let url = URL(string: "http://maps.apple.com/?ll=55.686142,37.855289"){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }

        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        acMaps.addAction(yandexMap)
        acMaps.addAction(googleMap)
        acMaps.addAction(appleMap)
        acMaps.addAction(cancel)
        if acMaps.traitCollection.userInterfaceStyle == .dark {
            acMaps.view.tintColor = .white
        } else {
            acMaps.view.tintColor = .black
        }
        
        self.navigationController?.present(acMaps, animated: true, completion: nil)
    }
    
    func openInstagram() {
        if let url = URL(string:"instagram://user?username=white_wolf_lounge") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}


//55.675874, 37.875283
//        let url = URL(string: "yandexmaps://build_route_on_map/?lat_from=55.675874&lon_from=37.875283&lat_to=55.686202&lon_to=37.855187")!

//        self.navigationController?.pushViewController(YandexMapViewController(), animated: true)
