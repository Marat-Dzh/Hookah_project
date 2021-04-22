//
//  FullDescriptionView.swift
//  HookahProject
//
//  Created by Олег Филатов on 10.01.2021.
//

//
// Created by Dmitrii Chikovinskii on 25.10.2020.
//

import UIKit

final class FullDescriptionView: AutoLayoutView {
    private let label = UILabel()
    private let showMoreButton = UIButton(type: .custom)

    private var expanded = false

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(text: String) {
        self.label.text = text
        self.label.textColor = .white
    }

    override func setupConstraints() {
        super.setupConstraints()

        self.label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        self.showMoreButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.showMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.showMoreButton.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 4.0).isActive = true
        self.showMoreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func setup() {
        self.addSubview(self.label)
        self.addSubview(self.showMoreButton)

        self.setupButton()
        self.showMoreButton.addTarget(self, action: #selector(onTapShowMore), for: .touchUpInside)
    }

    @objc
    private func onTapShowMore() {
        self.expanded.toggle()
        self.setupButton()
        UIView.transition(with: self.label, duration: 1, options: UIView.AnimationOptions.transitionFlipFromBottom, animations: {
            self.label.numberOfLines = self.expanded ? 0 : 1
            self.layoutIfNeeded()
        })
    }

    private func setupButton() {
        let buttonTitle = self.expanded ? "Скрыть" : "Показать еще"
        self.showMoreButton.setTitle(buttonTitle, for: .normal)
    }
}
