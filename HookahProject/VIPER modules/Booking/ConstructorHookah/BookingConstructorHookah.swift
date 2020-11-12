//
//  BookingDetailViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.11.2020.
//

import UIKit

class BookingConstructorHookahVC : UIViewController {
    
    var x = 10
    
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
        self.bookingConstructorHookahView.onTapButtonToBasketHookah = { [weak self] in
            if self!.bookingConstructorHookahView.isEmptyTF(){
                print("Hello")
            } else {
                self!.alertConstructor()
            }
                
        }
        self.hideKeyboard()
    }
    
    func alertConstructor() {
        let ac = UIAlertController(title: "Внимание", message: "Заполните все поля", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        ac.view.backgroundColor = .gray
        ac.view.tintColor = .black
        
        self.present(ac, animated: true, completion: nil)
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
