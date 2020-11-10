//
//  ButtomToBasket.swift
//  HookahProject
//
//  Created by Олег Филатов on 05.11.2020.
//

import UIKit

final class ButtonToBasket: UIButton {

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func attach(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        self.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
    }

    private func setup() {
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = 8.0
        self.setTitle("Добавить в корзину", for: .normal)
    }
}
