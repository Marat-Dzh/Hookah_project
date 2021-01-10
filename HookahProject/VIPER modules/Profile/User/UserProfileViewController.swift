//
//  UserProfileViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit
import Firebase

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
        if (Auth.auth().currentUser?.uid == "Z3trLdPJxpcYSdUXNmb1DqZaSko2") {
            self.userProfileView.buttonReserves.isHidden = false
            self.userProfileView.buttonChangeScorese.isHidden = false
        }
        self.output.dowloadImageProfile()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(self.onTapSignOut(sender: )))
       // self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: nil)
        
//        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(self.onTapSignOut(sender: ))), UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(self.onTapSignOut(sender: )))]

        self.userProfileView.onTaphotoImage = {[weak self] in
            guard let self = self else {return}
            self.alertImage()
        }
        
        self.userProfileView.onTapButtonReserve = {[weak self]  in
            guard let self = self else {return}
            let tableReserveContainer = TableReserveContainer.assemble()
            self.navigationController?.pushViewController(tableReserveContainer.viewController, animated: true)
        }
        
        self.userProfileView.onTapbuttonChangeScorese = {[weak self]  in
            guard let self = self else {return}
            let changeScoresContainer = ChangeScoresContainer.assemble()
            self.navigationController?.pushViewController(changeScoresContainer.viewController, animated: true)
        }
    
        self.userProfileView.onTapButtonToConnect = { [weak self] in
            guard let self = self else {return}
            //self?.alertConnect()
            self.callNumber()
        }
    }
    @objc
    func onTapSignOut(sender: UIBarButtonItem) {
        output.onLogoutTapped()
    }
    

    
}



extension UserProfileViewController: UserProfileViewInput {
    func showUserInfo(info: UserInfo) {
        self.userProfileView.nameLabel.text = info.fio
        self.userProfileView.numberCardLabel.text = "Карта: " + String(info.cardId)
        if (info.numberOfPoints % 10 == 1) {
            self.userProfileView.scoresLabel.text = String(info.numberOfPoints) + " балл"
        } else if (info.numberOfPoints % 10 == 2 || info.numberOfPoints % 10 == 3 || info.numberOfPoints % 10 == 4) {
            self.userProfileView.scoresLabel.text = String(info.numberOfPoints) + " балла"
        } else {
            self.userProfileView.scoresLabel.text = String(info.numberOfPoints) + " баллов"
        }
        
    }
    
    func downloadImageProfile(url: URL) {
        self.userProfileView.photoImage.load(url: url)
        self.userProfileView.photoImage.contentMode = .scaleAspectFill
        self.userProfileView.photoImage.layer.cornerRadius = 65.0
        self.userProfileView.photoImage.clipsToBounds = true
    }
    
    func showNothing() {
        //
    }
    
}

extension UserProfileViewController {
    func callNumber(){
        guard let number1 = URL(string: "tel://" + "+74957064148")  else { return }
        UIApplication.shared.open(number1)
    }
    
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
        //imageIsChanged = true
        self.userProfileView.photoImage.image = info[.editedImage] as? UIImage
        self.userProfileView.photoImage.contentMode = .scaleAspectFill
        self.userProfileView.photoImage.layer.cornerRadius = self.userProfileView.photoImage.frame.height / 2
        self.userProfileView.photoImage.clipsToBounds = true
        dismiss(animated: true)
        
        self.output.uploadImage(image: info[.editedImage] as! UIImage)
    }
}

class UserProfileView: AutoLayoutView {
    var photoImage = UIImageView()
    fileprivate let nameLabel = UILabel()
    fileprivate let numberCardLabel = UILabel()
    fileprivate let scoresLabel = UILabel()
    fileprivate let buttonToConnect = ButtonToBasket()
    fileprivate let buttonReserves = UIButton()
    fileprivate let buttonChangeScorese = UIButton()
    
    
    var onTaphotoImage: (() -> Void)?
    var onTapButtonReserve: (() -> Void)?
    var onTapbuttonChangeScorese: (() -> Void)?
    var onTapButtonToConnect: (() -> Void)?
    
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
        self.setupButtonReserves()
        self.setupbuttonChangeScorese()
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
            
            self.buttonReserves.topAnchor.constraint(equalTo: self.photoImage.bottomAnchor, constant: 16.0),
            self.buttonReserves.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.buttonReserves.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            self.buttonReserves.heightAnchor.constraint(equalToConstant: 44.0),
            
            self.buttonChangeScorese.topAnchor.constraint(equalTo: self.buttonReserves.bottomAnchor, constant: 16.0),
            self.buttonChangeScorese.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.buttonChangeScorese.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            self.buttonChangeScorese.heightAnchor.constraint(equalToConstant: 44.0),
            

        ].forEach{$0.isActive = true}
        
        self.buttonToConnect.attach(to: self)
    }
}

extension UserProfileView {
    func setupPhotoImage() {
        self.addSubview(self.photoImage)
        self.photoImage.image = UIImage(named: "account")
        self.photoImage.layer.cornerRadius = self.photoImage.frame.height / 2
        self.photoImage.clipsToBounds = true
        
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
        self.buttonToConnect.setTitle("Связаться с хостесом", for: .normal)
        self.buttonToConnect.addTarget(self, action: #selector(onTapButtonToConnectFunc), for: .touchUpInside)
    }
    @objc
    func onTapButtonToConnectFunc() {
        self.onTapButtonToConnect?()
    }
    
    func setupButtonReserves() {
        self.addSubview(self.buttonReserves)
        self.buttonReserves.isHidden = true
        self.buttonReserves.backgroundColor = .darkGray
        self.buttonReserves.setTitle("Таблица бронирования", for: .normal)
        self.buttonReserves.layer.cornerRadius = 8.0
        self.buttonReserves.addTarget(self, action: #selector(onTapButtonReserveFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapButtonReserveFunc() {
        self.onTapButtonReserve?()
    }
    
    func setupbuttonChangeScorese(){
        self.addSubview(self.buttonChangeScorese)
        self.buttonChangeScorese.isHidden = true
        self.buttonChangeScorese.backgroundColor = .darkGray
        self.buttonChangeScorese.setTitle("Изменить баллы", for: .normal)
        self.buttonChangeScorese.layer.cornerRadius = 8.0
        self.buttonChangeScorese.addTarget(self, action: #selector(onTapbuttonChangeScoreseFunc), for: .touchUpInside)
    }
    
    @objc
    func onTapbuttonChangeScoreseFunc() {
        self.onTapbuttonChangeScorese?()
    }
    
}

