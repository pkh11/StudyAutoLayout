//
//  MenuButton.swift
//  AutoLayoutPractice
//
//  Created by 박균호 on 2021/04/21.
//

import UIKit

class MenuButton: UIView {
    
    private var menuButton: UIButton!
    private var menuStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addMenuButton()
        addMenuStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuButton {
    private func addMenuButton() {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "tray", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        
        let buttonTopConstraint = button.topAnchor.constraint(equalTo: topAnchor)
        buttonTopConstraint.priority = .defaultLow
        buttonTopConstraint.isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.addTarget(self, action: #selector(tapMenuButton), for: .touchUpInside)
        
        menuButton = button
    }
    
    @objc private func tapMenuButton() {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: {
                        
                        self.menuStack.arrangedSubviews.forEach { (button) in
                            button.isHidden = !button.isHidden
                        }
                        
                        self.menuStack.layoutIfNeeded()
                       }, completion: nil)
        
        
    }
    
    private func addMenuStack() {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonImagesNames = ["pencil", "person.fill", "photo", "bubble.left.and.bubble.right"]
        
        buttonImagesNames.forEach { (imageName) in
            let button = UIButton(type: .system)
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
            button.setImage(image, for: .normal)
            stack.addArrangedSubview(button)
            button.isHidden = true
            button.tintColor = .brown
        }
        
        addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: menuButton.topAnchor, constant: -8).isActive = true
        let stackTopConstraint = stack.topAnchor.constraint(equalTo: topAnchor)
        stackTopConstraint.priority = .defaultHigh
        stackTopConstraint.isActive = true
        menuStack = stack
    }
}
