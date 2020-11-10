//
//  ViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 18.10.2020.
//

import UIKit

class FeedViewController: UIViewController {
    private let output: FeedViewOutput
    var expandedIndexSet: IndexSet = []
    
    var news = [
        News(title: "title", description: "description description description description description description description description description description", image: UIImage(named:"logo.jpg")!),
        News(title: "title", description: "description", image: UIImage(named:"logo.jpg")!),
        News(title: "title", description: "description", image: UIImage(named:"logo.jpg")!),
        News(title: "title", description: "description", image: UIImage(named:"logo.jpg")!),
        News(title: "title", description: "description", image: UIImage(named:"logo.jpg")!),
    ]
    init(_ output:FeedViewOutput){
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedIndexSet.contains(indexPath.row) {
            expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier) as? FeedTableViewCell else { return UITableViewCell() }
        
        let currentNews = news[indexPath.row]
        
        cell.title.text = currentNews.title
        cell.newsImage.image = currentNews.image
        cell.descriptionLabel.text = currentNews.description
        
        if expandedIndexSet.contains(indexPath.row) {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        return cell
    }
}


extension FeedViewController: FeedViewInput{
    func displayNews() {
        //
    }
    
    func displayStocks() {
        //
    }
    
    
}

