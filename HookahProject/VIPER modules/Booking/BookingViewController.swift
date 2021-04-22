
import UIKit
import Foundation

final class BookingViewController: UIViewController {
    private let output: BookingViewOutput
    private let collectionView: UICollectionView
    private var viewModels = [BookingCardViewModel]()
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        self.collectionView.frame = CGRect(x: 8, y: 0, width: self.view.bounds.width-16, height: self.view.bounds.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(activityIndicator)
        self.activityIndicator.center = self.view.center
        if self.viewModels.isEmpty {
            self.activityIndicator.startAnimating()
        }
    }
}

extension BookingViewController: BookingViewInput{
    func set(viewModels: [BookingCardViewModel]){
        self.viewModels = viewModels
        self.collectionView.reloadData()
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
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
        cell.backgroundColor = .darkGray
        cell.containerView.update(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //        if indexPath.row == 0 {
        //            self.navigationController?.pushViewController(BookingConstructorHookahVC(), animated: true)
        //        }else{
        //            self.output.showBookingDetailVC(bookingCardViewModel:  self.viewModels[indexPath.item])
        //
        //        }
        
        self.output.showBookingDetailVC(bookingCardViewModel:  self.viewModels[indexPath.item])
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

//extension BookingViewController : UIPickerViewDataSource, UIPickerViewDelegate {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return self.menuPickerItem.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return self.menuPickerItem[row]
//    }
//
////    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
////        let menuItem = menuPickerItem[row]
////        let item = NSAttributedString(string: menuItem, attributes:[NSAttributedString.Key.foregroundColor: UIColor.yellow])
////        return item
////    }
//
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 100
//    }
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return 50
//    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.text = self.menuPickerItem[row]
//        label.textColor = .white
//        view.addSubview(label)
//
//        //view rotation
//        view.transform = CGAffineTransform(rotationAngle: 90*(.pi/180))
//        return view
//    }
//}

private extension BookingViewController {
    func setupCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(BookingViewCell<BookingCardView>.self)
        self.collectionView.backgroundColor = .black
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.register(UINib(nibName: "OfferHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "OfferHeaderCell")
        self.collectionView.register(UINib(nibName: "APRHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "APRHeaderCell")
        //self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    //    func setupMenuPickerView() {
    //        self.menuPickerView.delegate = self
    //        self.menuPickerView.dataSource = self
    //        self.menuPickerView.transform = CGAffineTransform(rotationAngle: -90*(.pi/180))
    //        self.menuPickerView.backgroundColor = .darkGray
    //        self.menuPickerView.layer.cornerRadius = 10
    //        self.menuPickerView.layer.masksToBounds = true
    //    }
    
}
