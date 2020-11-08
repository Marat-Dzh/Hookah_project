//
//  BasketViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import UIKit

class BasketViewController: UIViewController {
    private let output: BasketViewOutput
    
    init(_ output:BasketViewOutput){
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

extension BasketViewController: BasketViewInput{
    func displayOrders() {
        //
    }
}
