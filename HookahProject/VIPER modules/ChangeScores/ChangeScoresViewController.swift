//
//  ChangeScoresViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresViewController: UIViewController {
    private var output: ChangeScoresViewOutput
    
    private var changeScoresView: ChangeScoresView {
        self.view as! ChangeScoresView
    }
    
    init(output: ChangeScoresViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ChangeScoresView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Изменить баллы"
        self.view.backgroundColor = UIColor.black
        self.changeScoresView.onTapMinusScoresButton = {[weak self] in
            guard let self = self else {return}
            guard let card = self.changeScoresView.cardNumberTF.text else {return}
            guard let scores = self.changeScoresView.numScoresTF.text else {return}
            self.output.changeScores(card: card, scores: scores)
            //self.acChangeScores()
        }
        
        self.hideKeyboard()
    }
    
    deinit {
        print("DEINIT: ", ChangeScoresViewController.self)
    }
}

extension ChangeScoresViewController: ChangeScoresViewInput {
    
}

extension ChangeScoresViewController {

}

class ChangeScoresView: AutoLayoutView {
    private let cardNumberLabel = UILabel()
    fileprivate let cardNumberTF = UITextField()
    private let numScoresLabel = UILabel()
    fileprivate let numScoresTF = UITextField()
    private let minusScoresButton = UIButton()
    
    var onTapMinusScoresButton: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupCardNumberLabel()
        setupCardNumberTF()
        setupNumScoresLabel()
        setupNumScoresTF()
        setupMinusScoresButton()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        [
            self.cardNumberLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            self.cardNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.cardNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.cardNumberTF.topAnchor.constraint(equalTo: self.cardNumberLabel.bottomAnchor, constant: 15.0),
            self.cardNumberTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.cardNumberTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.numScoresLabel.topAnchor.constraint(equalTo: self.cardNumberTF.bottomAnchor, constant: 15.0),
            self.numScoresLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.numScoresLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.numScoresTF.topAnchor.constraint(equalTo: self.numScoresLabel.bottomAnchor, constant: 15.0),
            self.numScoresTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.numScoresTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            
            self.minusScoresButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16.0),
            self.minusScoresButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            self.minusScoresButton.widthAnchor.constraint(equalToConstant: self.frame.width/2),
            
            
        ].forEach{$0.isActive = true}
    }
}

extension ChangeScoresView {
    func setupCardNumberLabel() {
        self.addSubview(self.cardNumberLabel)
        //self.cardNumberLabel.font = UIFont(name: "Arial", size: 25)
        self.cardNumberLabel.font = Font.system(ofSize: 25, weight: .medium)
        self.cardNumberLabel.textColor = .white
        self.cardNumberLabel.text = "Номер карты"
    }
    
    func setupCardNumberTF() {
        self.addSubview(self.cardNumberTF)
        self.cardNumberTF.backgroundColor = .white
        self.cardNumberTF.textColor = .black
        self.cardNumberTF.borderStyle = .roundedRect
        self.cardNumberTF.keyboardType = .asciiCapableNumberPad
        self.cardNumberTF.placeholder = "Номер карты"
        self.cardNumberTF.clearButtonMode = .always
        self.cardNumberTF.delegate = self
        self.cardNumberTF.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    func setupNumScoresLabel() {
        self.addSubview(self.numScoresLabel)
        //self.numScoresLabel.font = UIFont(name: "Arial", size: 25)
        self.numScoresLabel.font = Font.system(ofSize: 25, weight: .medium)
        self.numScoresLabel.textColor = .white
        self.numScoresLabel.text = "Количество баллов"
    }
    
    func setupNumScoresTF() {
        self.addSubview(self.numScoresTF)
        self.numScoresTF.backgroundColor = .white
        self.numScoresTF.textColor = .black
        self.numScoresTF.borderStyle = .roundedRect
        self.numScoresTF.keyboardType = .asciiCapableNumberPad
        self.numScoresTF.clearButtonMode = .always
        self.numScoresTF.placeholder = "Количество баллов"
        
    }
    
    
    func setupMinusScoresButton() {
        self.addSubview(self.minusScoresButton)
        self.minusScoresButton.setTitle("Обновить баллы", for: .normal)
        self.minusScoresButton.backgroundColor = .darkGray
        self.minusScoresButton.layer.cornerRadius = 8.0
        self.minusScoresButton.addTarget(self, action: #selector(onTapMinusScoresButtonFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapMinusScoresButtonFunc() {
        self.onTapMinusScoresButton?()
    }
}

extension ChangeScoresView: UITextFieldDelegate {
    @objc
    func textFieldDidChange(textField: UITextField) {

        if textField == self.cardNumberTF {

            if textField.text!.count == 4 {

                self.cardNumberTF.resignFirstResponder()
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.cardNumberTF {

            //if (textField.text?.characters.count)! > 3 {
            if textField.text!.count > 3 {
                self.cardNumberTF.resignFirstResponder()
                return false
            } else {

                return true
            }
        } else {

            return true
        }
    }
}
