//
//  LoginViewController.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    private let output: LoginViewOutput
    
    init(_ output:LoginViewOutput){
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
    }
    
}

extension LoginViewController: LoginViewInput{
    
}
