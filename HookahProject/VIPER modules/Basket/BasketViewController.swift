//
//  BasketViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit

class BasketViewController: UIViewController {
    
    private let output: BasketViewOutput
    private let tableView : UITableView
    var basketViewModels = [BasketCardViewModel]()
    
    init(_ output:BasketViewOutput){
        self.output = output
        self.tableView = UITableView(frame: .zero, style: .grouped)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.addSubview(self.tableView)
        self.setupTableView()
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "История заказов", style: .done, target: self, action: #selector(self.action(sender:)))
        //self.output.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @objc func action(sender: UIBarButtonItem) {
        // Function body goes here
    }
    


}


extension BasketViewController: BasketViewInput{
    func displayOrders(basketViewModels: [BasketCardViewModel]) {
        self.basketViewModels = basketViewModels
        self.tableView.reloadData()
    }
}

extension BasketViewController : UITableViewDataSource {
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
        return 60.0
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
    
}


private extension BasketViewController {
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(BasketViewCell<BasketCardView>.self)
        self.tableView.backgroundColor = .black
    }
}
