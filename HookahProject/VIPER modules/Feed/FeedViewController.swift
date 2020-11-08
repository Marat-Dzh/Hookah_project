//
//  ViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 18.10.2020.
//

import UIKit

class FeedViewController: UIViewController {
    private let output: FeedViewOutput
    
    init(_ output:FeedViewOutput){
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

