//
//  ViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 18.10.2020.
//

import UIKit
import Firebase

class FeedViewController: UIViewController {
    private let output: FeedViewOutput
    
    //    fileprivate var newsList = [News]()
    //    // изображения для историй
    //    fileprivate var storiesList: [UIImage] = [UIImage(named: "add")!]
    
    var expandedIndexSet: IndexSet = []
    
    init(output: FeedViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var newsList = [
        News(newsTitle: "Новый год продолжается", newsImage: UIImage(named: "sale")!, newsDescription: "Задаете крепость, а вкус будет для вас приятным сюрпризом! Акция будет действовать до конца января."),
        News(newsTitle: "Чай в подарок", newsImage: UIImage(named: "berrytea")!, newsDescription: "При получении карты лояльности заведения - чай в подарок.")
    ] {
        didSet {
            tableView.reloadData()
        }
    }
    // изображения для историй
    var storiesList: [UIImage] = [UIImage(named: "add")!, UIImage(named: "Menu_02")!, UIImage(named: "Menu_15")!]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupUI()
    }
    
    private func setupUI() {
        //navigationItem.title = "News"
        //view.backgroundColor = .white
        if (Auth.auth().currentUser?.uid == "1w5vI62f4Kg0WfLnHFqcW9FuRbv2") {
            setupAddButton()
            setupLongGestureRecognizerOnCollectionView()
        }
        setupStoriesCollectionView()
        setupTableView()
    }
    
    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    @objc private func handleAdd() {
        let addNewsVC = AddNewsViewController()
        addNewsVC.delegate = self
        navigationController?.pushViewController(addNewsVC, animated: true)
    }
    
    private func setupLongGestureRecognizerOnCollectionView() {
        let lpgr = UILongPressGestureRecognizer(target: self,
                                                action: #selector(handleLongPress(gestureRecognizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        collectionView.addGestureRecognizer(lpgr)
    }
    
    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            let point = gestureRecognizer.location(in: collectionView)
            
            if let indexPath = collectionView.indexPathForItem(at: point), indexPath.item != 0 {
                let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
                    self.storiesList.remove(at: indexPath.item)
                    self.collectionView.deleteItems(at: [indexPath])
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
        default:
            break
        }
    }
    
    private func setupStoriesCollectionView() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 4).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (Auth.auth().currentUser?.uid == "1w5vI62f4Kg0WfLnHFqcW9FuRbv2") {
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newsList.remove(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedIndexSet.contains(indexPath.row) {
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier) as? FeedTableViewCell else { return UITableViewCell() }
        
        let currentNews = newsList[indexPath.row]
        
        cell.title.text = currentNews.newsTitle
        cell.newsImage.image = currentNews.newsImage
        cell.descriptionLabel.text = currentNews.newsDescription
        
        if expandedIndexSet.contains(indexPath.row) {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (Auth.auth().currentUser?.uid == "1w5vI62f4Kg0WfLnHFqcW9FuRbv2") {
            if indexPath.item == 0 {
                handleImagePicker()
            } else {
                let vc = ViewStoryViewController()
                vc.setImage(storiesList[indexPath.item])
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        } else {
            let vc = ViewStoryViewController()
            vc.setImage(storiesList[indexPath.item])
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }

    }
    
    private func handleImagePicker() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        
        present(imagePickerController, animated: true)
    }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        storiesList.insert(image, at: 1)
        collectionView.reloadData()
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (Auth.auth().currentUser?.uid == "1w5vI62f4Kg0WfLnHFqcW9FuRbv2") {
            return self.storiesList.count
        } else {
            self.storiesList.remove(at: 0)
            return self.storiesList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.reuseIdentifier, for: indexPath) as? CircleCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureWith(image: storiesList[indexPath.item])
        return cell
    }
}

extension FeedViewController: AddNewsDelegate {
    
    func didAddNews(_ news: News) {
        newsList.insert(news, at: 0)
    }
}



extension FeedViewController: FeedViewInput{
    func setStories(storiesList: [UIImage]){
        //        self.storiesList = storiesList
        //        self.collectionView.reloadData()
    }
    
    func setNews(newsList: [News]) {
        //        self.newsList = newsList
        //        self.tableView.reloadData()
    }
}

