//
//  upcomingTableViewCell.swift
//  HW5
//
//  Created by 이신원 on 2023/11/08.
//

import UIKit

import UIKit

class UpComingTableViewCell: UITableViewCell{
    
    let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    let button:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        button.tintColor = .white
        return button
    }()
    
    let leftImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SearchTableViewcell")
        contentView.addSubview(leftImageView)
        contentView.addSubview(label)
        contentView.addSubview(button)
        setUpcomponent()

    }
    
    func configuration(with image: UIImage, name: String){
        leftImageView.image = image
        label.text = name
        print(image, name)
    }
    
    private func setUpcomponent(){
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            leftImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 128),
            leftImageView.heightAnchor.constraint(equalToConstant: 83)
            
        ])
        
        NSLayoutConstraint.activate([
            //label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leftAnchor.constraint(equalTo: leftImageView.rightAnchor, constant: 20),
        ])

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
        ])
        
    }
    
}
