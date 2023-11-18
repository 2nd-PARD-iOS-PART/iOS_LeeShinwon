//
//  TitleCollectionViewCell.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell{
    
    static let identifier = "TitleCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with image: UIImage){
        imageView.image = image
        print(image)
    }
}
