//
//  BookingViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit
import Foundation

final class BookingViewController: UIViewController {
    private let output: BookingViewOutput
    private let collectionView: UICollectionView
    private var viewModels = [BookingCardViewModel]()
    
    
    
    init(_ output: BookingViewOutput){
        self.output = output
        let collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.addSubview(self.collectionView)
        self.setupCollectionView()
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds // узнать подробнее
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(BookingConstructorHookahVC(), animated: true)
        }else{
            self.navigationController?.pushViewController(BookingDetailViewController(), animated: true)
                    
        }
    }
    
}

extension BookingViewController: BookingViewInput{
    func set(viewModels: [BookingCardViewModel]){
        self.viewModels = viewModels
        self.collectionView.reloadData()
    }
}

extension BookingViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = self.viewModels[indexPath.item]
        let cell = collectionView.dequeueCell(cellType: BookingViewCell<BookingCardView>.self, for: indexPath)
        //let viewModel = BookingCardViewModel(title: "card cell \(indexPath.item)", imageName: "car3")
        cell.backgroundColor = .gray
        cell.containerView.update(with: viewModel)
        return cell
    }
    
    
}

extension BookingViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 0.25
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

private extension BookingViewController {
    func setupCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(BookingViewCell<BookingCardView>.self)
        self.collectionView.backgroundColor = .black
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    
}
