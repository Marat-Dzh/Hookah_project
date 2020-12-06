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
    var tableReserveModelArray:  [TableReserveModel] = [TableReserveModel(numberGuest: "3", timeReserve: "2020.03.10", phoneNumber: "89031850856"), TableReserveModel(numberGuest: "2", timeReserve: "1010.03.50", phoneNumber: "89990035907")]

    
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Обновить", style: .done, target: self, action: nil)
        
    }
    //Функция добавление в массив элементов и обновление tableview
    func addTableReserveCell(item: TableReserveModel){
        //пока просто принт
        print(item)
    }
}


extension TableReserveViewController: TableReserveViewInput{
    
}

extension TableReserveViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableReserveModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableReserveModel = self.tableReserveModelArray[indexPath.row]
        let cell = tableView.dequeueCell(cellType: TableReserveCell<TableReserveCellView>.self, for: indexPath)
        cell.backgroundColor = .systemGray
        cell.containerView.updateCellTableReserve(with: tableReserveModel)
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
            tableReserveModelArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)//удаление элементов
        }
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
