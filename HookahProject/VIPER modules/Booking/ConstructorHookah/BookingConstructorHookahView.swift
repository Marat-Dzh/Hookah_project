//
//  BookingConstructorHookahView.swift
//  HookahProject
//
//  Created by Олег Филатов on 06.11.2020.
//

import UIKit

class BookingConstructorHookahView : AutoLayoutView, UITextFieldDelegate {
    
    private let chooseItemFirst = ["Ягоды", "Цитрусы", "Фрукты", "Десертное"]
    private let chooseItemSecond = ["Легкая (1-5)", "Средняя (6-7)", "Тяжелая (8-10)"]
    private let chooseItemThird = ["Tangiers", "Darkside", "Duft", "Must Have", "Black Burn", "WTO", "Северный"]
    private let chooseItemFourth = ["Классическая (булькает)", "Легкая (как воздух вдохнуть)"]
    private let chooseItemFifth = ["Глиняная", "Силиконовая", "Грейпфрут + 200 руб.", "Гранат + 300 руб.", "Ананас один калауд + 300 руб.", "Ананас два калауда + 500 руб."]
    private let chooseItemSixth = ["Вода", "Молоко + 100 руб.", "Горячий чай + 100 руб.", "Сироп + 100 руб."]
    
    
    var selectedElements: String?
    
    private let stackView = ScrollableStackView(config: .defaultVertical)
    private let firstStepLabel = UILabel()
    private let secondStepLabel = UILabel()
    private let thirdStepLabel = UILabel()
    private let fourthStepLabel = UILabel()
    private let fifthStepLabel = UILabel()
    private let sixthStepLabel = UILabel()
    private let seventhStepLabel = UILabel()
    
    private let firstStepTF = UITextField()
    private let secondStepTF = UITextField()
    private let thirdStepTF = UITextField()
    private let fourthStepTF = UITextField()
    private let fifthStepTF = UITextField()
    private let sixthStepTF = UITextField()
    private let seventhStepTF = UITextField()
    
    private let buttonToBasket  = ButtonToBasket()
    var onTapButtonToBasketHookah: (() -> Void)?
    
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
        self.seventhStepLabel.text = "Уточнение вкуса"
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)

    }
    
    private func setup(){
        settingFirstLabelTF()
        settingSecondLabelTF()
        settingThirdLabelTF()
        settingFourthLabelTF()
        settingFifthLabelTF()
        settingSixthLabelTF()
        settingSeventhLabelTF()
        setButtonToBasket()
        self.stackView.setCustomSpacing(40.0, after: seventhStepTF)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.addSubview(self.stackView)
        self.stackView.pins(UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
    }
    

    func isEmptyTF() -> Bool {
        if firstStepTF.text!.isEmpty ||  secondStepTF.text!.isEmpty || thirdStepTF.text!.isEmpty || fourthStepTF.text!.isEmpty || fifthStepTF.text!.isEmpty || sixthStepTF.text!.isEmpty || seventhStepTF.text!.isEmpty {
            return false
        } else {
            return true
        }
    }
}

extension BookingConstructorHookahView{
    
    func settingFirstLabelTF(){
        self.stackView.addArrangedSubview(self.firstStepLabel)
        self.stackView.addArrangedSubview(self.firstStepTF)
        self.firstStepLabel.font = UIFont(name: "Arial", size: 30)
        self.firstStepTF.backgroundColor = .white
        self.firstStepTF.placeholder = self.chooseItemFirst.randomElement()
        self.firstStepTF.borderStyle = .roundedRect
        self.firstStepTF.clearButtonMode = .always
        
        let elemPickerfirst = UIPickerView()
        elemPickerfirst.delegate = self
        self.firstStepTF.inputView = elemPickerfirst
        elemPickerfirst.tag = 1
        
        self.createToolBar(self.firstStepTF)
    }
    
    func settingSecondLabelTF(){
        self.stackView.addArrangedSubview(self.secondStepLabel)
        self.stackView.addArrangedSubview(self.secondStepTF)
        self.secondStepLabel.font = UIFont(name: "Arial", size: 30)
        self.secondStepTF.backgroundColor = .white
        self.secondStepTF.placeholder = self.chooseItemSecond.randomElement()
        self.secondStepTF.borderStyle = .roundedRect
        self.secondStepTF.clearButtonMode = .always
        
        let elemPickerSecond = UIPickerView()
        elemPickerSecond.delegate = self
        secondStepTF.inputView = elemPickerSecond
        elemPickerSecond.tag = 2
        
        self.createToolBar(self.secondStepTF)
        
    }
    
    func settingThirdLabelTF(){
        self.stackView.addArrangedSubview(self.thirdStepLabel)
        self.stackView.addArrangedSubview(self.thirdStepTF)
        self.thirdStepLabel.font = UIFont(name: "Arial", size: 30)
        self.thirdStepTF.backgroundColor = .white
        self.thirdStepTF.placeholder = self.chooseItemThird.randomElement()
        self.thirdStepTF.borderStyle = .roundedRect
        self.thirdStepTF.clearButtonMode = .always
        
        let elemPickerThird = UIPickerView()
        elemPickerThird.delegate = self
        thirdStepTF.inputView = elemPickerThird
        elemPickerThird.tag = 3
        
        self.createToolBar(thirdStepTF)
    }
    
    func settingFourthLabelTF(){
        self.stackView.addArrangedSubview(self.fourthStepLabel)
        self.stackView.addArrangedSubview(self.fourthStepTF)
        self.fourthStepLabel.font = UIFont(name: "Arial", size: 30)
        self.fourthStepTF.backgroundColor = .white
        self.fourthStepTF.placeholder = self.chooseItemFourth.randomElement()
        self.fourthStepTF.borderStyle = .roundedRect
        self.fourthStepTF.clearButtonMode = .always
        
        let elemPickerFourth = UIPickerView()
        elemPickerFourth.delegate = self
        self.fourthStepTF.inputView = elemPickerFourth
        elemPickerFourth.tag = 4
        
        self.createToolBar(self.fourthStepTF)
        
    }
    func settingFifthLabelTF(){
        self.stackView.addArrangedSubview(self.fifthStepLabel)
        self.stackView.addArrangedSubview(self.fifthStepTF)
        self.fifthStepLabel.font = UIFont(name: "Arial", size: 30)
        self.fifthStepTF.backgroundColor = .white
        self.fifthStepTF.placeholder = self.chooseItemFifth.randomElement()
        self.fifthStepTF.borderStyle = .roundedRect
        self.fifthStepTF.clearButtonMode = .always
        
        let elemPickerFifth = UIPickerView()
        elemPickerFifth.delegate = self
        self.fifthStepTF.inputView = elemPickerFifth
        elemPickerFifth.tag = 5
        
        self.createToolBar(self.fifthStepTF)
    }
    
    func settingSixthLabelTF(){
        self.stackView.addArrangedSubview(self.sixthStepLabel)
        self.stackView.addArrangedSubview(self.sixthStepTF)
        self.sixthStepLabel.font = UIFont(name: "Arial", size: 30)
        self.sixthStepLabel.numberOfLines = 3
        self.sixthStepTF.backgroundColor = .white
        self.sixthStepTF.placeholder = self.chooseItemSixth.randomElement()
        self.sixthStepTF.borderStyle = .roundedRect
        self.sixthStepTF.clearButtonMode = .always
        
        let elemPickerSixth = UIPickerView()
        elemPickerSixth.delegate = self
        self.sixthStepTF.inputView = elemPickerSixth
        elemPickerSixth.tag = 6
        
        self.createToolBar(self.sixthStepTF)
    }
    
    func settingSeventhLabelTF(){
        self.stackView.addArrangedSubview(self.seventhStepLabel)
        self.stackView.addArrangedSubview(self.seventhStepTF)
        self.seventhStepLabel.font = UIFont(name: "Arial", size: 30)
        self.seventhStepLabel.numberOfLines = 2
        self.seventhStepTF.placeholder = "Уточните вкус"
        self.seventhStepTF.borderStyle = .roundedRect
        self.seventhStepTF.clearButtonMode = .always
    }
    
    func setButtonToBasket(){
        self.stackView.addArrangedSubview(self.buttonToBasket)
        self.buttonToBasket.addTarget(self, action: #selector(onTapButtonToBasketFuncHookah), for: .touchUpInside)
    }
    
    @objc
    private func onTapButtonToBasketFuncHookah() {
        self.onTapButtonToBasketHookah?()
    }
}

extension BookingConstructorHookahView : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return chooseItemFirst.count
        case 2:
            return chooseItemSecond.count
        case 3:
            return chooseItemThird.count
        case 4:
            return chooseItemFourth.count
        case 5:
            return chooseItemFifth.count
        case 6:
            return chooseItemSixth.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return chooseItemFirst[row]
        case 2:
            return chooseItemSecond[row]
        case 3:
            return chooseItemThird[row]
        case 4:
            return chooseItemFourth[row]
        case 5:
            return chooseItemFifth[row]
        case 6:
            return chooseItemSixth[row]
        default:
            return "0"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1:
            selectedElements = chooseItemFirst[row]
            self.firstStepTF.text = selectedElements
        case 2:
            selectedElements = chooseItemSecond[row]
            self.secondStepTF.text = selectedElements
        case 3:
            selectedElements = chooseItemThird[row]
            self.thirdStepTF.text = selectedElements
        case 4:
            selectedElements = chooseItemFourth[row]
            self.fourthStepTF.text = selectedElements
        case 5:
            selectedElements = chooseItemFifth[row]
            self.fifthStepTF.text = selectedElements
        case 6:
            selectedElements = chooseItemSixth[row]
            self.sixthStepTF.text = selectedElements
        default:
            return
        }
    }
}

extension BookingConstructorHookahView {
    func createToolBar(_ textField : UITextField){
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(BookingConstructorHookahView.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let nextButton = UIBarButtonItem(title: "next", style: .plain, target: nil, action: #selector(BookingConstructorHookahView.nextClick))
        toolBar.setItems([nextButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc
    func doneClick() {
        firstStepTF.resignFirstResponder()
        secondStepTF.resignFirstResponder()
        thirdStepTF.resignFirstResponder()
        fourthStepTF.resignFirstResponder()
        fifthStepTF.resignFirstResponder()
        sixthStepTF.resignFirstResponder()
        seventhStepTF.resignFirstResponder()
        
    }
    @objc
    func nextClick() {
        firstStepTF.resignFirstResponder()
        secondStepTF.resignFirstResponder()
        thirdStepTF.resignFirstResponder()
        fourthStepTF.resignFirstResponder()
        fifthStepTF.resignFirstResponder()
        sixthStepTF.resignFirstResponder()
        seventhStepTF.resignFirstResponder()
    }
}

extension BookingConstructorHookahView {
    func kbShowHide(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    @objc func kbDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else {return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //        (self.stackView.scrollView).contentSize = CGSize(width: self.stackView.contentView.bounds.size.width, height: self.stackView.contentView.bounds.size.height + kbFrameSize.height)
        (self.stackView.scrollView).contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0.0)
        
        (self.stackView.scrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
    }
    
    @objc func kbDidHide(){
        //        (self.stackView.scrollView).contentSize = CGSize(width: self.stackView.bounds.size.width, height: self.stackView.bounds.size.height)
        (self.stackView.scrollView).contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
