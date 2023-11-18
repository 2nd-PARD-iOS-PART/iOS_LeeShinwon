//
//  HomeViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

enum Sections: Int {
    case MyList = 0
    case EuropeMovie = 1
    case RomanceDrama = 2
    case ActionThriller = 3
}


class HomeViewController: UIViewController {
    
    let sectionTitles : [String] = ["My List", "Europe movie", "Romance/Drama", "Action/Thriller"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func configureNavbar(){
        var image = UIImage(named: "Logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        //navigationItem.leftBarButtonItem =
        let logo = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        let item1 = UIBarButtonItem(title: "TV Shows", style: .plain, target: self, action: #selector(barButtonPressed))
        
        let item2 = UIBarButtonItem(title: "Movie", style: .plain, target: self, action: #selector(barButtonPressed))

        let item3 = UIBarButtonItem(title: "My List", style: .plain, target: self, action: #selector(barButtonPressed))
        
                
        
        item1.tintColor = UIColor.white
        item2.tintColor = UIColor.white
        item3.tintColor = UIColor.white

//        navigationItem.leftBarButtonItem = logo
        navigationItem.leftBarButtonItems = [logo,item1, item2, item3]

    }
    
    @objc private func barButtonPressed(){
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {//to stick the navigationbar to the top
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        //navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
    }
}

//hot reloading을 위한 코드
extension HomeViewController {
    @objc func injected() {
        viewDidLoad()
    }
}
