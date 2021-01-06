//
//  RegisterViews.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 29.12.2020.
//

import Foundation
import UIKit

class RegisterFieldView: UIView{
    let minHeight: CGFloat = 50.0
    
    let textFieldView : InputFieldView = {
        let textFieldView = InputFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = UIColor.clear
        textFieldView.textField.textColor = .white
        textFieldView.textField.font?.withSize(16)
        return textFieldView
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addingSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addingSubviews(){
        self.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight-30.0).isActive = true
        
        self.addSubview(textFieldView)
        textFieldView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10.0).isActive = true
        textFieldView.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor).isActive = true
        textFieldView.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor).isActive = true
        textFieldView.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight-20.0).isActive = true
    }
    
    func setLabelText(text: String){
        let attributesDictionary : [NSAttributedString.Key :Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
        ]
        textLabel.attributedText = NSAttributedString(string: text, attributes: attributesDictionary)
    }
    func setInputAttrs(imageName: String, placeholderText: String){
        let attributesDictionary = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        textFieldView.imgView.image = UIImage(named: imageName)
        textFieldView.imgView.tintColor = UIColor.white
        textFieldView.textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributesDictionary)
    }
}

extension RegisterFieldView: InputSource{
    func displayError(message: String) {
        textFieldView.textField.attributedText = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.textFieldView.textField.textColor = .white
        }
    }
    
    func getContent() -> String {
        return textFieldView.textField.text ?? ""
    }
}
