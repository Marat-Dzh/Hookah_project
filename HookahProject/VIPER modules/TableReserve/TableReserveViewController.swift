//
//  TableReserveViewController.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

class TableReserveViewController: UIViewController {
    
    private var output: TableReserveViewOutput

    var tableReserveTableView: UITableView
    var tableReserveModelArray = [TableReserveModel]()
    var personInfoModelArray = [PersonInfo]()
    
    
    init(output: TableReserveViewOutput) {
        self.output = output
        self.tableReserveTableView = UITableView(frame: .zero, style: .grouped)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.addSubview(self.tableReserveTableView)
        self.setupTableReserve()
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableReserveTableView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Бронирования"
        self.output.viewDidLoad()
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Обновить", style: .done, target: self, action: #selector(onTapUpdate))
        
    }
    
    @objc
    func onTapUpdate() {
        print("Обновить таблицу")
        self.output.viewDidLoad()
    }
}


extension TableReserveViewController: TableReserveViewInput{
    func set(viewModelsReserve: [TableReserveModel], viewModelsInfo : [PersonInfo]){
        self.tableReserveModelArray = viewModelsReserve
        self.personInfoModelArray = viewModelsInfo
        self.tableReserveTableView.reloadData()
    }
}

extension TableReserveViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableReserveModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableReserveModel = self.tableReserveModelArray[indexPath.row]
        let personInfoModel = self.personInfoModelArray[indexPath.row]
        let cell = tableView.dequeueCell(cellType: TableReserveCell<TableReserveCellView>.self, for: indexPath)
        cell.backgroundColor = .systemGray
        cell.containerView.updateCellTableReserve(with: tableReserveModel, with: personInfoModel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phoneFromTableReserveModelArray = self.tableReserveModelArray[indexPath.row].phoneNumber
        guard let number1 = URL(string: "tel://" + phoneFromTableReserveModelArray)  else { return }
        UIApplication.shared.open(number1)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let uidTableReserve = self.tableReserveModelArray[indexPath.row].uid
            self.tableReserveModelArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)//удаление элементов
            self.output.deleteReserve(uid: uidTableReserve)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let confirmation = confirmationAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [confirmation])
    }
    
    func confirmationAction(at indexPath: IndexPath) -> UIContextualAction {
        var objectTableReserveModelArray = tableReserveModelArray[indexPath.row]
        let uidTableReserve = self.tableReserveModelArray[indexPath.row].uid
        let action = UIContextualAction(style: .normal, title: "Confirmation") { (action, view, completion) in
            objectTableReserveModelArray.isConfirmation = !objectTableReserveModelArray.isConfirmation
            self.tableReserveModelArray[indexPath.row] = objectTableReserveModelArray
            completion(true)
            self.output.changeConfirmation(uid: uidTableReserve, confirmation: objectTableReserveModelArray.isConfirmation)
        }
        action.backgroundColor = objectTableReserveModelArray.isConfirmation ? .systemGreen : .systemYellow
        action.title = objectTableReserveModelArray.isConfirmation ? "♥️" : "☠️"
        return action
    }
}

extension TableReserveViewController: UITableViewDelegate {
    func setupTableReserve(){
        self.tableReserveTableView.delegate = self
        self.tableReserveTableView.dataSource = self
        self.tableReserveTableView.register(TableReserveCell<TableReserveCellView>.self)
        self.tableReserveTableView.backgroundColor = .black
    }
}
