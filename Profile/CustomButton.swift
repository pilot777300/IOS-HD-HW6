//
//  CustomButton.swift
//  NavigTest
//
//  Created by Mac on 04.11.2022.
//

import UIKit

class CustomButton: UIButton {
 
    var buttonTitle: String
    var buttonColor: UIColor
    var titleColor: UIColor
    typealias Action = () -> Void
    var buttonAction: Action
    
    init(buttonTitle: String , buttonColor: UIColor, titleColor: UIColor = .white, action: @escaping Action) {
        buttonAction = action
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
        self.titleColor = titleColor
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = buttonColor
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 10
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func buttonTapped() {
            buttonAction()
        }

    }
