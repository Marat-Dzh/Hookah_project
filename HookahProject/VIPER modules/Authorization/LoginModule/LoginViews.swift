//
//  LoginViews.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 15.12.2020.
//

import UIKit

protocol ViewExtractable {
    func extractData() -> LoginData
    func checkValidation() -> Bool
}

class BaseLoginView: UIView{
    fileprivate let inputViewHeight: CGFloat = 60.0
    fileprivate let templateColor :UIColor = .white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubViews(){
        
    }
}

class EmailView : BaseLoginView, ViewExtractable{
    
    weak var parentView: ViewToController?

    func checkValidation() -> Bool {
        return emailFieldView.textField.hasText && passwordFieldView.textField.hasText
    }
    
    func extractData() -> LoginData {
        return LoginAndPasswordData(login: getEmail(), password: getPassword())
    }
    
    
    let emailFieldView : InputFieldView = {
        let textFieldView = InputFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        return textFieldView
    }()
    let passwordFieldView : InputFieldView = {
        let textFieldView = InputFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        return textFieldView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setupSubViews(){
        
        self.addSubview(emailFieldView)
        emailFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        emailFieldView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        emailFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        emailFieldView.heightAnchor.constraint(equalToConstant: inputViewHeight).isActive = true
        emailFieldView.imgView.image = UIImage(named: "mail")
        emailFieldView.imgView.tintColor = UIColor.white
        let attributesDictionary = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        emailFieldView.textField.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: attributesDictionary)
        emailFieldView.textField.textColor = templateColor
        emailFieldView.textField.addTarget(self, action: #selector(valueChange), for: .allEditingEvents)
        
        self.addSubview(passwordFieldView)
        passwordFieldView.topAnchor.constraint(equalTo: emailFieldView.bottomAnchor, constant: 0.0).isActive = true
        passwordFieldView.leadingAnchor.constraint(equalTo: emailFieldView.leadingAnchor, constant: 0.0).isActive = true
        passwordFieldView.trailingAnchor.constraint(equalTo: emailFieldView.trailingAnchor, constant: 0.0).isActive = true
        passwordFieldView.heightAnchor.constraint(equalTo: emailFieldView.heightAnchor, constant: 0.0).isActive = true
        passwordFieldView.imgView.image = UIImage(named: "lock")
        passwordFieldView.imgView.tintColor = UIColor.white
        passwordFieldView.textField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: attributesDictionary)
        passwordFieldView.textField.isSecureTextEntry = true
        passwordFieldView.textField.textColor = templateColor
        passwordFieldView.textField.addTarget(self, action: #selector(valueChange), for: .allEditingEvents)
    }
    func getEmail() -> String {
        return emailFieldView.textField.text ?? ""
    }
    func getPassword() -> String {
        return passwordFieldView.textField.text ?? ""
    }
    
    @objc
    func valueChange(){
        parentView?.updateButtonsStatus()
    }
}



class PhoneView : BaseLoginView, ViewExtractable{
    
    weak var parentView: ViewToController?
    
    func checkValidation() -> Bool {
        return phoneFieldView.textField.hasText
    }
    
    func extractData() -> LoginData {
        return PhoneData(getPhoneNumber())
    }
    
    let phoneFieldView : InputFieldView = {
        let textFieldView = InputFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.textField.keyboardType = .phonePad
        return textFieldView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getPhoneNumber() -> String {
        return phoneFieldView.textField.text ?? ""
    }
    
    override func setupSubViews() {
        self.addSubview(phoneFieldView)
        phoneFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        phoneFieldView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        phoneFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        phoneFieldView.heightAnchor.constraint(equalToConstant: inputViewHeight).isActive = true
        phoneFieldView.imgView.image = UIImage(named: "phone")
        phoneFieldView.imgView.tintColor = UIColor.white
        let attributesDictionary = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        phoneFieldView.textField.attributedPlaceholder = NSAttributedString(string: "Телефон", attributes: attributesDictionary)
        phoneFieldView.textField.textColor = templateColor
        phoneFieldView.textField.addTarget(self, action: #selector(valueChange), for: .allEditingEvents)
    }
    
    @objc
    func valueChange(){
        parentView?.updateButtonsStatus()
    }
}

class InputFieldView: UIView {
    
    let imgView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lineView : UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = UIColor.white
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addingSubviews()
    }
    
    func addingSubviews() {
        self.addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        self.addSubview(imgView)
        imgView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -15.0).isActive = true
        imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, constant: 0.0).isActive = true
        
        self.addSubview(textField)
        textField.lastBaselineAnchor.constraint(equalTo: imgView.lastBaselineAnchor, constant: -1.0).isActive = true
        textField.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8.0).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SegmentView: UIView{
    
    weak var parentController: ViewToController?
    
    private var loginDict: [String:BaseLoginView] = [
        AuthType.loginAndPassword.rawValue:EmailView(),
        AuthType.phoneNumberAndSMS.rawValue:PhoneView()
    ]
    
    private var viewToExtract: ViewExtractable
    
    private let items = [AuthType.loginAndPassword.rawValue, AuthType.phoneNumberAndSMS.rawValue]
    private let emailView :EmailView = {
        let baseView = EmailView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        return baseView
    }()
    private let phoneView: PhoneView = {
        let pView = PhoneView()
        pView.translatesAutoresizingMaskIntoConstraints = false
        return pView
    }()
    private var customSegment :UISegmentedControl = {
        let control = UISegmentedControl(items: [AuthType.loginAndPassword.rawValue, AuthType.phoneNumberAndSMS.rawValue])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .gray
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(changeView), for: .valueChanged)
        return control
    }()
    
    override init(frame: CGRect) {
        viewToExtract = emailView
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        //blockView = loginDict[AuthType.loginAndPassword.rawValue]!
        
        self.addSubview(customSegment)
        customSegment.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        customSegment.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        customSegment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        customSegment.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        self.addSubview(emailView)
        emailView.topAnchor.constraint(equalTo: customSegment.bottomAnchor, constant: 0.0).isActive = true
        emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        emailView.heightAnchor.constraint(equalToConstant: emailView.inputViewHeight*2.5).isActive = true
        emailView.parentView = self
        
        self.addSubview(phoneView)
        phoneView.topAnchor.constraint(equalTo: customSegment.bottomAnchor, constant: 0.0).isActive = true
        phoneView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        phoneView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        phoneView.heightAnchor.constraint(equalToConstant: phoneView.inputViewHeight).isActive = true
        phoneView.isHidden = true
        viewToExtract = emailView
        phoneView.parentView = self
    }
}

extension SegmentView : ViewExtractable{
    func extractData() -> LoginData {
        return viewToExtract.extractData()
    }
    
    func checkValidation() -> Bool {
        return viewToExtract.checkValidation()
    }
}

private extension SegmentView{
    @objc
    func changeView(){
        if customSegment.selectedSegmentIndex == 0 {
            emailView.isHidden = false
            phoneView.isHidden = true
            viewToExtract = emailView
            updateButtonsStatus()
        }else{
            emailView.isHidden = true
            phoneView.isHidden = false
            viewToExtract = phoneView
            updateButtonsStatus()
        }
    }
}

extension SegmentView: ViewToController{
    func updateButtonsStatus() {
        parentController?.updateButtonsStatus()
    }
}

