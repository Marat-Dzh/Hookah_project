//
//  ConfirmViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import UIKit

final class ConfirmViewController: UIViewController {
    let presenter: ConfirmViewOutput
    
    private var confirmView: ConfirmView {
        self.view as! ConfirmView
    }
    
    init(output: ConfirmViewOutput) {
        self.presenter = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ConfirmView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        presenter.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}

extension ConfirmViewController: ConfirmViewInput{
    func showInfo(info: String) {
        
    }
    
    func showError(message: String) {
        
    }
}

class ConfirmView: AutoLayoutView {
    private let entryLabel = UILabel()
    private let smsCodeTF = UITextField()
//    private let buttonEntry = UIButton()
    
//    var onTapButtonEntry: (()->Void)?
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setupEntryLabel()
        self.setupSmsCodeTF()
//        self.setupButtonEntry()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.entryLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55.0),
            self.entryLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            self.smsCodeTF.topAnchor.constraint(equalTo: self.entryLabel.bottomAnchor, constant: 16.0),
            self.smsCodeTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.smsCodeTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            self.smsCodeTF.heightAnchor.constraint(equalToConstant: 30.0),
//            self.buttonEntry.topAnchor.constraint(equalTo: self.smsCodeTF.bottomAnchor, constant: 16.0),
//            self.buttonEntry.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
//            self.buttonEntry.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
//            self.buttonEntry.heightAnchor.constraint(equalToConstant: 30.0)
            
        ].forEach{$0.isActive = true}
    }
    
}

extension ConfirmView {
    func setupEntryLabel() {
        self.addSubview(self.entryLabel)
        self.entryLabel.text = "Введите код"
        self.entryLabel.textColor = .white
        self.entryLabel.font = Font.system(ofSize: 30, weight: .bold)
    }
    
    func setupSmsCodeTF() {
        self.addSubview(self.smsCodeTF)
        self.smsCodeTF.backgroundColor = UIColor.white
        self.smsCodeTF.textColor = .black
        self.smsCodeTF.clearButtonMode = .always
        self.smsCodeTF.keyboardType = .asciiCapableNumberPad
        self.smsCodeTF.placeholder = "Код из смс"
        self.smsCodeTF.textContentType = .oneTimeCode //код из смс автоматически
    }
    
//    func setupButtonEntry() {
//        self.addSubview(self.buttonEntry)
//        self.buttonEntry.setTitle("Войти", for: .normal)
//        self.buttonEntry.backgroundColor = UIColor.gray
//        self.buttonEntry.tintColor = UIColor.white
//        self.buttonEntry.addTarget(self, action: #selector(onTapButtonEntryFunc), for: .touchUpInside)
//    }
//
//    @objc
//    func onTapButtonEntryFunc() {
//        self.onTapButtonEntry?()
//    }
}
