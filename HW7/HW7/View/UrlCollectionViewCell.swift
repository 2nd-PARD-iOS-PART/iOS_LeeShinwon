//
//  UrlCollectionVIewCell.swift
//  HW7
//
//  Created by 이신원 on 2023/11/18.
//

import UIKit

class UrlCollectionViewCell: UICollectionViewCell {

    var nameLabel: UILabel!
    var images: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUi() {
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .blue
        images = UIImageView()
        images.contentMode = .scaleAspectFit
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(images)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        images.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            images.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 30),
            images.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            images.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            images.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
    }
}
