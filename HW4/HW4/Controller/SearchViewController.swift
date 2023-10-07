//
//  SearchViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class SearchViewController: UIViewController{

    
    let searchBar = UISearchBar()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        makeSearchBar()
        print("make\n")
        
        //tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        print("make\n")
        
        setTableView()
        

    }
    
    func makeSearchBar(){
        searchBar.placeholder = "Search for a show, movie, genre, etc"
               
        //todo:how can i add the mic.fill button?
        
        navigationItem.titleView = searchBar
    }
    
    func setTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            
                //view.safeAreaLayoutGuide.leftAnchor 적용해서 어떤건지 알아보기
        ])
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewcell")
        
    }
    
    


}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Search.SearchData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewcell", for: indexPath) as? SearchTableViewCell
        else{
            print("fail to searView/TableViewCell")
            return UITableViewCell()
        }
        cell.backgroundColor = .black
        
        let target = Search.SearchData[indexPath.item]
        let image = UIImage(named:"\(target.image).png")
        cell.leftImageView.image = image
        cell.label.text = target.label
        
        
        //let data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
