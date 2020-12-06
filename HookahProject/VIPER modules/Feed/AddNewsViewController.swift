//
//  AddNewsViewController.swift
//  testApp
//
//  Created by M Dzh on 06.12.2020.
//

import UIKit

protocol AddNewsDelegate: class {
    func didAddNews(_ news: News)
}

final class AddNewsViewController: UIViewController {
    
    private let containerView = UIView()
    private var containerYConstraint: NSLayoutConstraint?
    private let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
    private var didChangeImage = false

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "hole")!
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Title"
        textField.delegate = self
        return textField
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Description"
        textField.delegate = self
        return textField
    }()
    
    weak var delegate: AddNewsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpKeyboardObservers()
        setupUI()
    }
    
    private func setUpKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillBeShown(notification: NSNotification) {
        guard let info = notification.userInfo,
              let keyboardFrameEndValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let keyboardDurationValue = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        let keyboardFrame = keyboardFrameEndValue.cgRectValue
        let keyboardDuration = keyboardDurationValue.doubleValue
        
        containerYConstraint?.constant = -keyboardFrame.height / 3
        
        UIView.animate(withDuration: keyboardDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillBeHidden(notification: NSNotification) {
        guard let info = notification.userInfo, let keyboardDurationValue = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        let keyboardDuration = keyboardDurationValue.doubleValue
        
        containerYConstraint?.constant = 0
        
        UIView.animate(withDuration: keyboardDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Add news"
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerYConstraint = containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        containerYConstraint?.isActive = true
        
        containerView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        containerView.addSubview(titleTextField)
        titleTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        
        containerView.addSubview(descriptionTextField)
        descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8).isActive = true
        descriptionTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        descriptionTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        
        setupDoneButton()
        setupImageTap()
    }
    
    private func setupDoneButton() {
        doneButton.isEnabled = false
        navigationItem.setRightBarButton(doneButton, animated: true)
    }
    
    @objc private func handleDone() {
        let newsModel = News(newsTitle: titleTextField.text ?? "Empty title", newsImage: UIImage(named: "berrytea")!, newsDescription: descriptionTextField.text ?? "Empty description")
        delegate?.didAddNews(newsModel)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupImageTap() {
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        imageView.addGestureRecognizer(imageTap)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension AddNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        imageView.image = image
        didChangeImage.toggle()
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension AddNewsViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if titleTextField.hasText && descriptionTextField.hasText && didChangeImage {
            doneButton.isEnabled = true

        } else {
            doneButton.isEnabled = false
        }
    }
}

