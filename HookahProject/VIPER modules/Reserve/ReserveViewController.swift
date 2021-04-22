//
//  ReserveViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit


class ReserveViewController : UIViewController {
    
   // var timer: Timer?
    
    private var output: ReserveViewOutput
    private var reserveView: ReserveView {
        self.view as! ReserveView
    }

    
    init(output: ReserveViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ReserveView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.reserveView.onTapButtonToReserve = {[weak self] in
            guard let self = self else {return}
            if (self.reserveView.datePickerToReserve.date.timeIntervalSince1970 - Date().timeIntervalSince1970 > 45*60) {
                self.output.addReserve(date: self.reserveView.datePickerToReserve.date, numGuest: self.reserveView.numGuest)
            }else {
                self.output.showErrorReserve()
            }
        }
    }
}

extension ReserveViewController: ReserveViewInput {
    
}

class ReserveView : AutoLayoutView {
    
    //private let stackView = UIStackView()
    
    private let whatTimeTitleLabel = UILabel()
    fileprivate let datePickerToReserve = UIDatePicker()
    private let howManyGuestTitleLabel = UILabel()
    private let minusGuestButton = UIButton()
    private let plusGuestButton = UIButton()
    fileprivate let numberOfGuestsLabel = UILabel()
    let buttonToReserve = ButtonToBasket()
    
    
    fileprivate var numGuest = 1
    
    var onTapButtonToReserve: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        self.setupWhatTimeTitleLabel()
        self.setupDatePickerToReserve()
        self.setupHowManyGuestTitleLabel()
        self.setupMinusGuestButton()
        self.setupPlusGuestButton()
        self.setupNumberOfGuestsLabel()
        self.setupButtonToReserve()
    }
    
    override func setupConstraints(){
        super.setupConstraints()
        
        [
            self.whatTimeTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            self.whatTimeTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.whatTimeTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            //self.whatTimeTitleLabel.heightAnchor.constraint(equalToConstant: 200),
            
            self.datePickerToReserve.topAnchor.constraint(equalTo: self.whatTimeTitleLabel.bottomAnchor, constant: 10.0),
            self.datePickerToReserve.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.datePickerToReserve.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            self.datePickerToReserve.heightAnchor.constraint(equalToConstant: 185),
            
            self.howManyGuestTitleLabel.topAnchor.constraint(equalTo: self.datePickerToReserve.bottomAnchor, constant: 15.0),
            self.howManyGuestTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.howManyGuestTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.minusGuestButton.topAnchor.constraint(equalTo: self.howManyGuestTitleLabel.bottomAnchor, constant: 15.0),
            self.minusGuestButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            //self.minusGuestButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25.0),
            
            self.minusGuestButton.widthAnchor.constraint(equalToConstant: 35.0),
            self.minusGuestButton.heightAnchor.constraint(equalToConstant: 35.0),
            
            self.numberOfGuestsLabel.topAnchor.constraint(equalTo: self.howManyGuestTitleLabel.bottomAnchor, constant: 20.0),
            self.numberOfGuestsLabel.leadingAnchor.constraint(equalTo: self.minusGuestButton.trailingAnchor, constant: 16.0),
            
            
            self.plusGuestButton.topAnchor.constraint(equalTo: self.howManyGuestTitleLabel.bottomAnchor, constant: 15.0),
            self.plusGuestButton.leadingAnchor.constraint(equalTo: self.minusGuestButton.trailingAnchor, constant: 40.0),
            
            self.plusGuestButton.widthAnchor.constraint(equalToConstant: 35.0),
            self.plusGuestButton.heightAnchor.constraint(equalToConstant: 35.0)
            
        ].forEach{$0.isActive = true}
        
        
        self.buttonToReserve.attach(to: self)
    }
}

extension ReserveView {
    func setupWhatTimeTitleLabel() {
        self.addSubview(self.whatTimeTitleLabel)
        self.whatTimeTitleLabel.text = "На какое время?"
        //self.whatTimeTitleLabel.numberOfLines = 2
        self.whatTimeTitleLabel.textColor = .white
        self.whatTimeTitleLabel.font = Font.system(ofSize: 30, weight: .bold)
    }
    
    func setupDatePickerToReserve(){
        self.addSubview(self.datePickerToReserve)
        if #available(iOS 13.4, *) {
            self.datePickerToReserve.preferredDatePickerStyle = .wheels
            self.datePickerToReserve.datePickerMode = .dateAndTime
            self.datePickerToReserve.locale = Locale(identifier: "ru_RU")
            self.datePickerToReserve.tintColor = .white
            self.datePickerToReserve.backgroundColor = .darkGray
            self.datePickerToReserve.setValue(UIColor.white, forKeyPath: "textColor")
            self.datePickerToReserve.layer.cornerRadius = 8.0
            self.datePickerToReserve.layer.masksToBounds = true
            //  self.datePickerToReserve.addTarget(self, action: #selector(getDataAndTime), for: .valueChanged)
        } else {
            // Fallback on earlier versions
        }
    }
    
    //    @objc
    //    private func getDataAndTime() {
    //        print(self.datePickerToReserve.date)
    //    }
    
    func setupHowManyGuestTitleLabel() {
        self.addSubview(self.howManyGuestTitleLabel)
        self.howManyGuestTitleLabel.text = "Сколько гостей?"
        self.howManyGuestTitleLabel.textColor = .white
        self.howManyGuestTitleLabel.font = Font.system(ofSize: 30, weight: .bold)
    }
    
    func setupMinusGuestButton() {
        self.addSubview(self.minusGuestButton)
        self.minusGuestButton.backgroundColor = .darkGray
        self.minusGuestButton.layer.cornerRadius = 8.0
        self.minusGuestButton.setTitle("-", for: .normal)
        
        self.minusGuestButton.addTarget(self, action: #selector(onTapMinus), for: .touchUpInside)
    }
    
    @objc
    private func onTapMinus(){
        guard numGuest > 1 else {
            return
        }
        numGuest -= 1
        
        self.numberOfGuestsLabel.text = "\(numGuest)"
    }
    
    
    func setupPlusGuestButton() {
        self.addSubview(self.plusGuestButton)
        self.plusGuestButton.backgroundColor = .darkGray
        self.plusGuestButton.layer.cornerRadius = 8.0
        self.plusGuestButton.setTitle("+", for: .normal)
        self.plusGuestButton.addTarget(self, action: #selector(onTapPlus), for: .touchUpInside)
    }
    
    @objc
    private func onTapPlus(){
        guard numGuest < 9 else {
            return
        }
        numGuest += 1
        self.numberOfGuestsLabel.text = "\(numGuest)"
    }
    
    func setupNumberOfGuestsLabel() {
        self.addSubview(self.numberOfGuestsLabel)
        self.numberOfGuestsLabel.text = "\(numGuest)"
        self.numberOfGuestsLabel.textColor = .white
        self.howManyGuestTitleLabel.font = Font.system(ofSize: 30, weight: .bold)
    }
    
    func setupButtonToReserve() {
        self.addSubview(self.buttonToReserve)
        self.buttonToReserve.setTitle("Запросить бронирование", for: .normal)
        self.buttonToReserve.addTarget(self, action: #selector(onTapButtonToReserveFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapButtonToReserveFunc(){
        self.onTapButtonToReserve?()
    }
}
