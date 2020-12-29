//
//  RegisterViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.12.2020.
//

import UIKit

final class RegisterViewController: UIViewController {
    let presenter: RegisterViewOutput
    
    let templateColor = UIColor.white
    
    let bgImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundLogin.png")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.8
        imageView.image = UIImage(named: "logo.jpg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bgView : UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = UIColor(displayP3Red: 9.0/255.0, green: 33.0/255.0, blue: 47.0/255.0, alpha: 1.0).withAlphaComponent(0.7)
        return bgView
    }()
    
    let fioView : RegisterFieldView = {
        let textFieldView = RegisterFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.setLabelText(text: "ФИО")
        textFieldView.setInputAttrs(imageName: "account", placeholderText: "Например: Иванов Иван Иванович")
        return textFieldView
    }()
    let phoneView : RegisterFieldView = {
        let textFieldView = RegisterFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.setLabelText(text: "Телефон")
        textFieldView.setInputAttrs(imageName: "phone", placeholderText: "Например: +79998887766")
        return textFieldView
    }()
    let emailView : RegisterFieldView = {
        let textFieldView = RegisterFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.setLabelText(text: "Электронная почта")
        textFieldView.setInputAttrs(imageName: "mail", placeholderText: "Например: alibaba@gay.com")
        return textFieldView
    }()
    
    let passwordView : RegisterFieldView = {
        let textFieldView = RegisterFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.setLabelText(text: "Пароль")
        textFieldView.setInputAttrs(imageName: "lock", placeholderText: "Например: qwerty")
        return textFieldView
    }()
    
    let finishButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(output: RegisterViewOutput) {
        self.presenter = output
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    func setupAppearance(){
        let padding: CGFloat = 40.0
        let signInButtonHeight: CGFloat = 50.0
        
        self.view.addSubview(bgImageView)
        bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        bgImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        
        view.insertSubview(bgView, aboveSubview: bgImageView)
        bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        bgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        
        view.insertSubview(logoImageView, aboveSubview: bgView)
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, constant: 0.0).isActive = true
        
        view.insertSubview(fioView, aboveSubview: bgView)
        fioView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20.0).isActive = true
        fioView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        fioView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        fioView.heightAnchor.constraint(greaterThanOrEqualToConstant: fioView.minHeight).isActive = true
        
        view.insertSubview(emailView, aboveSubview: bgView)
        emailView.topAnchor.constraint(equalTo: fioView.bottomAnchor, constant: 20.0).isActive = true
        emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        emailView.heightAnchor.constraint(greaterThanOrEqualToConstant: emailView.minHeight).isActive = true
        
        view.insertSubview(phoneView, aboveSubview: bgView)
        phoneView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 20.0).isActive = true
        phoneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        phoneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        phoneView.heightAnchor.constraint(greaterThanOrEqualToConstant: phoneView.minHeight).isActive = true
        
        view.insertSubview(passwordView, aboveSubview: bgView)
        passwordView.topAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 20.0).isActive = true
        passwordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        passwordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        passwordView.heightAnchor.constraint(greaterThanOrEqualToConstant: passwordView.minHeight).isActive = true

        
        view.insertSubview(finishButton, aboveSubview: bgView)
        finishButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 20.0).isActive = true
        finishButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 0.0).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -0.0).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: signInButtonHeight).isActive = true
        
       let buttonAttributesDictionary = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0),
                                         NSAttributedString.Key.foregroundColor: templateColor]
        finishButton.backgroundColor = UIColor.gray
        finishButton.setAttributedTitle(NSAttributedString(string: "ЗАРЕГИСТРИРОВАТЬСЯ", attributes: buttonAttributesDictionary), for: .normal)
        finishButton.isEnabled = true
        finishButton.addTarget(self, action: #selector(onSubmitTap), for: .touchUpInside)
    }
}

private extension RegisterViewController{
    @objc
    func onSubmitTap(){
        presenter.onRegisterTapped(data: [fioView, emailView, phoneView, passwordView])
    }
}

extension RegisterViewController: RegisterViewInput{
    func showError(errorResults: [FailureResult]) {
        for item in errorResults{
            item.source?.displayError(message: item.errorMessage)
        }
    }
    
    func getDataFromView() -> RegisterData {
        return RegisterData(fio: fioView.getContent(), email: emailView.getContent(), phoneNumber: phoneView.getContent(), pass: "qwerty")
    }
}
