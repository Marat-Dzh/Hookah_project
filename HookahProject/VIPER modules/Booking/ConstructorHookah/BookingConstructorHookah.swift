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
        self.bookingConstructorHookahView.kbShowHide()
        self.bookingConstructorHookahView.onTapButtonToBasketHookah = { [weak self] in
            guard let self = self else {return}
            if self.bookingConstructorHookahView.isEmptyTF(){
                print("Hello")
            } else {
                self.alertConstructor()
            }
        }
        self.hideKeyboard()
    }
    


}

extension BookingConstructorHookahVC {
    func alertConstructor() {
        let ac = UIAlertController(title: "ВНИМАНИЕ", message: "Заполните все поля", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Собрать кальян полностью", style: .default, handler: nil)
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
        //view.resignFirstResponder() // тоже самое, что и view.endEditing(true)
    }
}


