//
//  ConfirmViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import UIKit

final class ConfirmViewController: UIViewController {
    let presenter: ConfirmViewOutput
    
    init(output: ConfirmViewOutput) {
        self.presenter = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func setupAppearance(){
        //setuping views...
        view.backgroundColor = .cyan
    }

}

extension ConfirmViewController: ConfirmViewInput{
    func showInfo(info: String) {
        
    }
    
    func showError(message: String) {
        
    }
}
