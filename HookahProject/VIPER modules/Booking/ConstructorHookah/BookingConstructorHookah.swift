//
//  BookingDetailViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.11.2020.
//

import UIKit

class BookingConstructorHookahVC : UIViewController {
    
    private var bookingConstructorHookahView : BookingConstructorHookahView{
        self.view as! BookingConstructorHookahView
    }
    
    override func loadView() {
        self.view = BookingConstructorHookahView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Конструктор кальяна"
        
        self.bookingConstructorHookahView.set()
        self.bookingConstructorHookahView.backgroundColor = .darkGray
        self.bookingConstructorHookahView.onTapButtonToBasketHookah = {
            [weak self] in
            print("Добавил кальян в корзину")
        }
        self.hideKeyboard()
    }
    


}


extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
