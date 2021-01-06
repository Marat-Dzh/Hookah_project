//
//  LoginViewController_v.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 15.12.2020.
//

import UIKit

class LoginViewController_v: UIViewController {
    private let presenter: LoginViewOutput
    
    private let segmentView: SegmentView = {
        let sView = SegmentView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        return sView
    }()
    
    let templateColor = UIColor.white
    
    let bgImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "black.jpg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 1
        imageView.image = UIImage(named: "logo.jpg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bgView : UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        //        bgView.backgroundColor = UIColor(displayP3Red: 9.0/255.0, green: 33.0/255.0, blue: 47.0/255.0, alpha: 1.0).withAlphaComponent(0.7)
                bgView.backgroundColor = .black
        return bgView
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let forgotPassword : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(output: LoginViewOutput) {
        self.presenter = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.checkSession()
        setupSubViews()
        self.hideKeyboard()
    }
    
    func setupSubViews(){
        let padding: CGFloat = 40.0
        let signInButtonHeight: CGFloat = 50.0
        
        // Background imageview
        self.view.addSubview(bgImageView)
        bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        bgImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        
        // Background layer view
        view.insertSubview(bgView, aboveSubview: bgImageView)
        bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        bgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        
        // Logo at top
        view.insertSubview(logoImageView, aboveSubview: bgView)
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, constant: 0.0).isActive = true
        
        view.insertSubview(segmentView, aboveSubview: bgView)
        segmentView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10.0).isActive = true
        segmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        segmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        segmentView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        segmentView.parentController = self
        
        view.insertSubview(signInButton, aboveSubview: bgView)
        signInButton.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 10.0).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 0.0).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: segmentView.trailingAnchor, constant: -0.0).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: signInButtonHeight).isActive = true
        
       let buttonAttributesDictionary = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0),
                                         NSAttributedString.Key.foregroundColor: templateColor]
       signInButton.alpha = 0.4
       signInButton.isEnabled = false
        signInButton.backgroundColor = UIColor.gray
        signInButton.setAttributedTitle(NSAttributedString(string: "ВОЙТИ", attributes: buttonAttributesDictionary), for: .normal)
        signInButton.isEnabled = true
        signInButton.addTarget(self, action: #selector(onSubmitTap), for: .touchUpInside)
        
        // Forgot Password Button
        view.insertSubview(forgotPassword, aboveSubview: bgView)
        forgotPassword.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 0.0).isActive = true
        forgotPassword.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 0.0).isActive = true
        forgotPassword.trailingAnchor.constraint(equalTo: segmentView.trailingAnchor, constant: 0.0).isActive = true
        
        forgotPassword.setTitle("Забыли пароль?", for: .normal)
        forgotPassword.setTitleColor(templateColor, for: .normal)
        forgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        forgotPassword.addTarget(self, action: #selector(onForgorPassTap), for: .touchUpInside)
        
        view.insertSubview(signUpButton, aboveSubview: bgView)
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 0.0).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: segmentView.trailingAnchor, constant: 0.0).isActive = true
        signUpButton.addTarget(self, action: #selector(onRegisterTap), for: .touchUpInside)
        
        let text = "Ещё нет аккаунта? Зарегистрируйтесь"
        let attributedString = NSMutableAttributedString.init(string: text)
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        
       let detailAttributes = [ NSAttributedString.Key.foregroundColor : templateColor,
                                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0) ,NSAttributedString.Key.paragraphStyle : style]
        
        attributedString.addAttributes(detailAttributes, range: NSMakeRange(0, attributedString.length))
        
        
        let sampleLinkRange1 = text.range(of: "Зарегистрируйтесь")!
        let startPos1 = text.distance(from: text.startIndex, to: sampleLinkRange1.lowerBound)
        let endPos1 = text.distance(from: text.startIndex, to: sampleLinkRange1.upperBound)
        let linkRange1 = NSMakeRange(startPos1, endPos1 - startPos1)
       let linkAttributes1 = [ NSAttributedString.Key.foregroundColor : templateColor,
                               NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16.0)]
        
        attributedString.addAttributes(linkAttributes1, range: linkRange1)
        
        signUpButton.setAttributedTitle(attributedString, for: .normal)
        
    }
}

extension LoginViewController_v: LoginViewInput{
    func showError(message: String) {
        let ac = UIAlertController(title: "ВНИМАНИЕ", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        ac.view.backgroundColor = .gray
        ac.view.tintColor = .black
        self.present(ac, animated: true, completion: nil)
    }
}

private extension LoginViewController_v{
    @objc
    func onSubmitTap(){
        let data = segmentView.extractData()
        presenter.login(data: data)
    }
    @objc
    func onRegisterTap(){
        presenter.register()
    }
    @objc
    func onForgorPassTap(){
        //do something...
    }
}

protocol ViewToController: class{
    func updateButtonsStatus()
}

extension LoginViewController_v: ViewToController{
    func updateButtonsStatus() {
        if segmentView.checkValidation(){
            signInButton.alpha = 1
            signInButton.isEnabled = true
        }
        else{
            signInButton.alpha = 0.4
            signInButton.isEnabled = false
        }
    }
}
