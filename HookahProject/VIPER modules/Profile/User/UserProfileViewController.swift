//
//  UserProfileViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit

class UserProfileViewController: UIViewController {
    private var output: UserProfileViewOutput
    
    private var userProfileView: UserProfileView {
        self.view as! UserProfileView
    }
    
    init(output: UserProfileViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UserProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userProfileView.onTaphotoImage = {[weak self] in
            self?.alertImage()
        }
    }
}

extension UserProfileViewController: UserProfileViewInput {
    
}

extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func alertImage() {
        let acImage = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        acImage.addAction(camera)
        acImage.addAction(photo)
        acImage.addAction(cancel)
        acImage.view.backgroundColor = .gray
        acImage.view.tintColor = .black
        self.present(acImage, animated: true, completion: nil)
    }
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        userProfileView.photoImage.image = info[.editedImage] as? UIImage
        userProfileView.photoImage.contentMode = .scaleAspectFill
        userProfileView.photoImage.clipsToBounds = true
        
        //imageIsChanged = true
        
        dismiss(animated: true)
    }
}

class UserProfileView: AutoLayoutView {
    var photoImage = UIImageView()
    private let nameLabel = UILabel()
    private let numberCardLabel = UILabel()
    private let scoresLabel = UILabel()
    private let buttonToConnect = ButtonToBasket()
    
    var onTaphotoImage: (() -> Void)?
    
    init(){
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setupPhotoImage()
        self.setupNameLabel()
        self.setupNumberCardLabel()
        self.setupScoresLabel()
        self.setupButtonToConnect()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            
            self.photoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15.0),
            self.photoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            self.photoImage.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor),
            
            self.photoImage.widthAnchor.constraint(equalToConstant: 130.0),
            self.photoImage.heightAnchor.constraint(equalToConstant: 130.0),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.photoImage.trailingAnchor, constant: 15.0),
            
            self.numberCardLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10.0),
            self.numberCardLabel.leadingAnchor.constraint(equalTo: self.photoImage.trailingAnchor, constant: 15.0),
            
            self.scoresLabel.topAnchor.constraint(equalTo: self.numberCardLabel.bottomAnchor, constant: 10.0),
            self.scoresLabel.leadingAnchor.constraint(equalTo: self.photoImage.trailingAnchor, constant: 15.0),
            
            
            


        ].forEach{$0.isActive = true}
        
        self.buttonToConnect.attach(to: self)
    }
}

extension UserProfileView {
    func setupPhotoImage() {
        self.addSubview(self.photoImage)
        self.photoImage.image = UIImage(named: "Constructor")
        self.photoImage.layer.cornerRadius = 50.0
        self.photoImage.layer.masksToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapPhotoImageFunc(tapGestureRecognizer:)))
        self.photoImage.isUserInteractionEnabled = true
        self.photoImage.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc
    func onTapPhotoImageFunc(tapGestureRecognizer: UITapGestureRecognizer) {
        self.onTaphotoImage?()
//        let tappedImage = tapGestureRecognizer.view as! UIImageView

    }
    
    func setupNameLabel() {
        self.addSubview(self.nameLabel)
        self.nameLabel.text = "Имя"
        self.nameLabel.textColor = .white
        self.nameLabel.font = Font.system(ofSize: 25, weight: .medium)
    }
    
    func setupNumberCardLabel() {
        self.addSubview(self.numberCardLabel)
        self.numberCardLabel.text = "Номер карты"
        self.numberCardLabel.textColor = .white
        self.numberCardLabel.font = Font.system(ofSize: 25, weight: .medium)
    }
    
    func setupScoresLabel() {
        self.addSubview(self.scoresLabel)
        self.scoresLabel.text = "Баллы"
        self.scoresLabel.textColor = .white
        self.scoresLabel.font = Font.system(ofSize: 25, weight: .medium)
    }
    
    func setupButtonToConnect() {
        self.addSubview(self.buttonToConnect)
        self.buttonToConnect.setTitle("Связаться с Мирчиком", for: .normal)
        self.buttonToConnect.addTarget(self, action: #selector(onTapbuttonToConnect), for: .touchUpInside)
    }
    @objc
    func onTapbuttonToConnect() {
        
    }
}
