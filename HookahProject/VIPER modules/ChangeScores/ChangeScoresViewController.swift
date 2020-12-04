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
        
        self.hideKeyboard()
    }
}

extension ChangeScoresViewController: ChangeScoresViewInput {
    
}

class ChangeScoresView: AutoLayoutView {
    private let cardNumberLabel = UILabel()
    private let cardNumberTF = UITextField()
    private let numScoresLabel = UILabel()
    private let numScoresTF = UITextField()
    private let plusScoresButton = UIButton()
    private let minusScoresButton = UIButton()
    
    var onTapPlusScoresButton: (() -> Void)?
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
        setupPlusScoresButton()
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
            
            self.minusScoresButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10.0),
            self.minusScoresButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.minusScoresButton.widthAnchor.constraint(equalToConstant: self.frame.width/2 - 32),
            
            self.plusScoresButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10.0),
            self.plusScoresButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            self.plusScoresButton.widthAnchor.constraint(equalToConstant: self.frame.width/2 - 32)
            
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
        self.cardNumberTF.borderStyle = .roundedRect
        self.cardNumberTF.clearButtonMode = .always
        self.cardNumberTF.keyboardType = .asciiCapableNumberPad
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
        self.numScoresTF.borderStyle = .roundedRect
        self.numScoresTF.clearButtonMode = .always
        self.numScoresTF.keyboardType = .asciiCapableNumberPad
        
    }
    
    func setupPlusScoresButton() {
        self.addSubview(self.plusScoresButton)
        self.plusScoresButton.setTitle("Добавить", for: .normal)
        self.plusScoresButton.backgroundColor = .systemOrange
        self.plusScoresButton.layer.cornerRadius = 8.0
        self.plusScoresButton.addTarget(self, action: #selector(onTapPlusScoresButtonFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapPlusScoresButtonFunc() {
        self.onTapPlusScoresButton?()
    }
    
    func setupMinusScoresButton() {
        self.addSubview(self.minusScoresButton)
        self.minusScoresButton.setTitle("Снять", for: .normal)
        self.minusScoresButton.backgroundColor = .systemOrange
        self.minusScoresButton.layer.cornerRadius = 8.0
        self.minusScoresButton.addTarget(self, action: #selector(onTapMinusScoresButtonFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapMinusScoresButtonFunc() {
        self.onTapMinusScoresButton?()
    }
}
