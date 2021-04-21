//
//  CustomTableViewCell.swift
//  AutoLayoutPractice
//
//  Created by 박균호 on 2021/04/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var myImageView:UIImageView!
    var titleLabel: UILabel!
    var postLabel: UILabel!
    
    private var postHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(myImageView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
        
        postLabel = UILabel()
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.font = UIFont.preferredFont(forTextStyle: .body)
        postLabel.adjustsFontForContentSizeCategory = true
        postLabel.textColor = .darkGray
        postLabel.numberOfLines = 0
        
        postHeight = postLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
        
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, postLabel])
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 8
        verticalStackView.axis = .vertical
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            myImageView.widthAnchor.constraint(equalTo: myImageView.heightAnchor),
            myImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 8),
            verticalStackView.topAnchor.constraint(equalTo: myImageView.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postHeight
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePost))
        postLabel.addGestureRecognizer(tapGesture)
        postLabel.isUserInteractionEnabled = true
        
    }
    
    @objc private func togglePost() {
        guard let height = postHeight else {
            return
        }
        
        height.isActive = !height.isActive
        
        NotificationCenter.default.post(name: NSNotification.Name("layoutCell"), object: nil)
    }
    
}
