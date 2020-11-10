//
//  BookingConstructorHookahView.swift
//  HookahProject
//
//  Created by Олег Филатов on 06.11.2020.
//

import UIKit

class BookingConstructorHookahView : AutoLayoutView {
    
    private let chooseItemFirst = ["Ягоды", "Цитрусы", "Фрукты", "Десертное"]
    private let chooseItemSecond = ["Легкая (3-5)", "Средняя (6-7)", "Тяжелая (8-10)"]
    private let chooseItemThird = ["Tangiers", "Darkside", "Duft", "Must Have", "Black Burn", "WTO", "Северный"]
    private let chooseItemFourth = ["Классическая", "Легкая"]
    private let chooseItemFifth = ["Классическая", "Фруктовая"]
    private let chooseItemSixth = ["Вода", "Молоко", "Горячий чай", "Сироп"]
    
    
    var selectedElements: String?
    
    private let stackView = ScrollableStackView(config: .defaultVertical)
    private let firstStepLabel = UILabel()
    private let secondStepLabel = UILabel()
    private let thirdStepLabel = UILabel()
    private let fourthStepLabel = UILabel()
    private let fifthStepLabel = UILabel()
    private let sixthStepLabel = UILabel()
    
    private let firstStepTF = UITextField()
    private let secondStepTF = UITextField()
    private let thirdStepTF = UITextField()
    private let fourthStepTF = UITextField()
    private let fifthStepTF = UITextField()
    private let sixthStepTF = UITextField()
    
    private let buttonToBasket  = ButtonToBasket()
    var onTapButtonToBasketHookah: (() -> Void)?
    
    var picker : UIDatePicker!
    
    init() {
        super.init(frame: .zero)
        self.setup()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(){
        self.firstStepLabel.text = "Выберите вкус"
        self.secondStepLabel.text = "Выберите крепость"
        self.thirdStepLabel.text = "Выберите табак"
        self.fourthStepLabel.text = "Выберите тягу"
        self.fifthStepLabel.text = "Выберите чашу"
        self.sixthStepLabel.text = "Выберите наполнитель для колбы"
    }
    
    private func setup(){
        settingFirstLabelTF()
        settingSecondLabelTF()
        settingThirdLabelTF()
        settingFourthLabelTF()
        settingFifthLabelTF()
        settingSixthLabelTF()
        self.stackView.addArrangedSubview(self.buttonToBasket)
        
        
        self.buttonToBasket.addTarget(self, action: #selector(onTapButtonToBasketFuncHookah), for: .touchUpInside)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.addSubview(self.stackView)
        self.stackView.pins(UIEdgeInsets(top: 120.0, left: 16.0, bottom: -32.0, right: -16.0))
        //self.buttonToBasket.attach(to: self)
    }
    
    @objc
    private func onTapButtonToBasketFuncHookah() {
        self.onTapButtonToBasketHookah?()
    }
}

private extension BookingConstructorHookahView {
    func settingFirstLabelTF(){
        self.stackView.addArrangedSubview(self.firstStepLabel)
        self.stackView.addArrangedSubview(self.firstStepTF)
        self.firstStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.firstStepTF.backgroundColor = .white
        self.firstStepTF.placeholder = "ягоды, цитрусы, фрукты, десертное"
        self.firstStepTF.borderStyle = .roundedRect
        self.firstStepTF.clearButtonMode = .always
        
//        let elemPickerfirst = UIPickerView()
//        elemPickerfirst.delegate = self
//        firstStepTF.inputView = elemPickerfirst
//
    }
    func settingSecondLabelTF(){
        self.stackView.addArrangedSubview(self.secondStepLabel)
        self.stackView.addArrangedSubview(self.secondStepTF)
        self.secondStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.secondStepTF.backgroundColor = .white
        self.secondStepTF.placeholder = "легкая, средняя, тяжелая"
        self.secondStepTF.borderStyle = .roundedRect
        self.secondStepTF.clearButtonMode = .always
        
//        let elemPickerSecond = UIPickerView()
//        elemPickerSecond.delegate = self
//        secondStepTF.inputView = elemPickerSecond
    }
    func settingThirdLabelTF(){
        self.stackView.addArrangedSubview(self.thirdStepLabel)
        self.stackView.addArrangedSubview(self.thirdStepTF)
        self.thirdStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.thirdStepTF.backgroundColor = .white
        self.thirdStepTF.placeholder = "Tangiers, Duft, Must Have"
        self.thirdStepTF.borderStyle = .roundedRect
        self.thirdStepTF.clearButtonMode = .always
        
//        let elemPickerThird = UIPickerView()
//        elemPickerThird.delegate = self
//        thirdStepTF.inputView = elemPickerThird


    }
    func settingFourthLabelTF(){
        self.stackView.addArrangedSubview(self.fourthStepLabel)
        self.stackView.addArrangedSubview(self.fourthStepTF)
        self.fourthStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.fourthStepTF.backgroundColor = .white
        self.fourthStepTF.placeholder = "классическая, легкая"
        self.fourthStepTF.borderStyle = .roundedRect
        self.fourthStepTF.clearButtonMode = .always
        

    }
    func settingFifthLabelTF(){
        self.stackView.addArrangedSubview(self.fifthStepLabel)
        self.stackView.addArrangedSubview(self.fifthStepTF)
        self.fifthStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.fifthStepTF.backgroundColor = .white
        self.fifthStepTF.placeholder = "классическая, фруктовая"
        self.fifthStepTF.borderStyle = .roundedRect
        self.fifthStepTF.clearButtonMode = .always

    }
    
    func settingSixthLabelTF(){
        self.stackView.addArrangedSubview(self.sixthStepLabel)
        self.stackView.addArrangedSubview(self.sixthStepTF)
        self.sixthStepLabel.font = UIFont(name: "Snell Roundhand Bold", size: 30)
        self.sixthStepLabel.numberOfLines = 2
        self.sixthStepTF.backgroundColor = .white
        self.sixthStepTF.placeholder = "вода, молоко, сироп"
        self.sixthStepTF.borderStyle = .roundedRect
        self.sixthStepTF.clearButtonMode = .always
        

    }
}

//extension BookingConstructorHookahView : UIPickerViewDataSource, UIPickerViewDelegate{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 0
//
//
//        switch  {
//        case firstStepTF:
//            return chooseItemFirst.count
//        case secondStepTF:
//            return chooseItemSecond.count
//        case thirdStepTF:
//            return chooseItemThird.count
//        case fourthStepTF:
//            return chooseItemFourth.count
//        case fifthStepTF:
//            return chooseItemFifth.count
//        case sixthStepTF:
//            return chooseItemSixth.count
//        default:
//            return 0
//        }
//
//        if firstStepTF {
//            return self.chooseItemFirst.count
//        } else if secondStepTF.isEnabled {
//            return self.chooseItemSecond.count
//        } else if thirdStepTF.isEnabled {
//            return self.chooseItemThird.count
//        } else {
//            return 0
//        }
//
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch UITextField() {
//        case firstStepTF:
//            return chooseItemFirst[row]
//        case secondStepTF:
//            return chooseItemSecond[row]
//        case thirdStepTF:
//            return chooseItemThird[row]
//        case fourthStepTF:
//            return chooseItemFourth[row]
//        case fifthStepTF:
//            return chooseItemFifth[row]
//        case sixthStepTF:
//            return chooseItemSixth[row]
//        default:
//            return "0"
//        }
//        if firstStepTF.isEnabled == false{
//            return self.chooseItemFirst[row]
//        } else if secondStepTF.isEnabled{
//            return self.chooseItemSecond[row]
//        } else if secondStepTF.isEnabled {
//            return self.chooseItemThird[row]
//        } else {
//            return "0"
//        }
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedElements = chooseItemFirst[row]
//        self.firstStepTF.text = selectedElements
//    }
//
//
//}
