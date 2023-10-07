//
//  DownloadsViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 110, y: 248, width: 194, height: 194)
        image.image = UIImage(systemName: "arrow.down.to.line.circle.fill")
        image.tintColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        return image
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(white: 0.65, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 19)
        label.textAlignment = .center
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.numberOfLines = 2
        
        return label
    }()
    
    let button:UIButton = {
        let button = UIButton()
        button.setTitle("Find Something to Download", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(button)
        view.backgroundColor = .systemBackground
        setUpcomponent()
    }
    
    private func setUpcomponent(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:248),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 194),
            imageView.heightAnchor.constraint(equalToConstant: 194)
            
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),//iphone 14 pro 로 했을때, 1296으로 값을 주면 넘쳐서 이 값으로 줌
            button.widthAnchor.constraint(equalToConstant: 280),
            button.heightAnchor.constraint(equalToConstant: 42)
        ])
        
    }
    
    
    

}
