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
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        setTableView()
        setHeader()
        

    }
    
    func makeSearchBar(){
        searchBar.placeholder = "Search for a show, movie, genre, etc"
        searchBar.searchTextField.backgroundColor = UIColor.clear
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic.fill", withConfiguration: imageConfig), style: .plain, target: self, action: nil)
        mic.tintColor = .white
        navigationItem.rightBarButtonItem = mic
        navigationItem.titleView = searchBar
      
        navigationController?.navigationBar.layer.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1).cgColor
        navigationController?.navigationBar.layer.cornerRadius = 5
    
        //navigationController?.navigationBar.layer.borderWidth = 10
        //navigationController?.navigationBar.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func setHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let headerlabel = UILabel(frame: header.bounds)
        headerlabel.text = "Poplular Searches"
        headerlabel.textAlignment = .left
        headerlabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        header.addSubview(headerlabel)
        
        tableView.tableHeaderView = header
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
        cell.backgroundColor = UIColor(red: 0.125, green: 0.125, blue: 0.125, alpha: 1)
        
        
        
        let target = Search.SearchData[indexPath.item]
        let image = UIImage(named:"\(target.image).png")
        cell.leftImageView.image = image
        cell.label.text = target.label
        
        
        //let data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
    
    
}

extension SearchViewController {
    @objc func injected() {
        viewDidLoad()
    }
}


