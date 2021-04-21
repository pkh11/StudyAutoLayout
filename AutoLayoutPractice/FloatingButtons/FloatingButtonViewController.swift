//
//  FloatingButtonViewController.swift
//  AutoLayoutPractice
//
//  Created by 박균호 on 2021/04/21.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuButton = MenuButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuButton)
        
        menuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }

}
