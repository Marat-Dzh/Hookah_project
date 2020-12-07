//
//  BasketViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit

class BasketViewController: UIViewController {
    
    private let output: BasketViewOutput
    var basketTableView : UITableView
    var basketViewModels = [BasketCardViewModel]()
    
    init(_ output: BasketViewOutput){
        self.output = output
        self.basketTableView = UITableView(frame: .zero, style: .grouped)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.addSubview(self.basketTableView)
        self.setupTableView()
        self.view = view
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.basketTableView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "История заказов", style: .done, target: self, action: #selector(self.historyAction(sender:)))
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func historyAction(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(HistoryViewController(), animated: true)
    }
    
}


extension BasketViewController: BasketViewInput{
    func displayOrders(basketViewModels: [BasketCardViewModel]) {
        self.basketViewModels = basketViewModels
        self.basketTableView.reloadData()
    }
}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.basketViewModels.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basketViewModel = self.basketViewModels[indexPath.item]
        let cell = tableView.dequeueCell(cellType: BasketViewCell<BasketCardView>.self, for: indexPath)
        cell.backgroundColor = .systemGray
        cell.basketContainerView.update(with: basketViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            basketViewModels.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)//удаление элементов
        }
    }
    
}




extension BasketViewController : UITableViewDelegate {
    func setupTableView(){
        self.basketTableView.delegate = self
        self.basketTableView.dataSource = self
        self.basketTableView.register(BasketViewCell<BasketCardView>.self)
        self.basketTableView.backgroundColor = .black
    }
}
