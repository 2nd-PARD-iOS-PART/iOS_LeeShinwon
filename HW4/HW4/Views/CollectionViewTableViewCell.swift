//
//  CollectionViewTableViewCell.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit


class CollectionViewTableViewCell: UITableViewCell{
    static let identifier = "CollectionViewTableViewCell"
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collectionView.register(UICollectionViewCell.self,  forCellWithReuseIdentifier: "cell")
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(TitleCollectionViewCell.self,  forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Load the image corresponding to the current index from the array
        if indexPath.section < MovieData.count && indexPath.item < MovieData[indexPath.section].count {
            if let image = UIImage(named: MovieData[indexPath.section][indexPath.item]) {
                // Set the background of the cell to the loaded image
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFill
                imageView.frame = cell.contentView.bounds
                
                // Remove any existing subviews from the cell
                cell.contentView.subviews.forEach { $0.removeFromSuperview() }
                print(MovieData[indexPath.section][indexPath.item])
                cell.contentView.addSubview(imageView)
            }
        }
        
        return cell
    }
}
