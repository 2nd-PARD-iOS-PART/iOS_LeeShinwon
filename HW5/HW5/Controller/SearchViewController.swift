//
//  SearchViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class SearchViewController: UIViewController{

    
    let searchBar = UISearchBar() // searchBar 선언
    private let tableView = UITableView() //tableView 선언

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
    
    //searchBar를 포함한 nav
    func makeSearchBar(){
        //class 내부 상단에 searchBar 선언
        
        //searchBar
        searchBar.placeholder = "Search for a show, movie, genre, etc"
        searchBar.searchTextField.backgroundColor = UIColor.clear
        
        //mic icon button
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic.fill", withConfiguration: imageConfig), style: .plain, target: self, action: nil)
        mic.tintColor = .white
        
        //navigationItem으로 searchBar, mic 할당
        navigationItem.rightBarButtonItem = mic
        navigationItem.titleView = searchBar
      
        //navigationItem 감싸서 하나처럼 보이게 하기
        navigationController?.navigationBar.layer.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1).cgColor
        navigationController?.navigationBar.layer.cornerRadius = 5
    
        //navigationController?.navigationBar.layer.borderWidth = 10
        //navigationController?.navigationBar.layer.borderColor = UIColor.white.cgColor
    }
    
    //tableView의 header 설정
    func setHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let headerlabel = UILabel(frame: header.bounds)
        headerlabel.text = "Poplular Searches"
        headerlabel.textAlignment = .left
        headerlabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        header.addSubview(headerlabel)
        
        tableView.tableHeaderView = header
    }
    
    //tableView 위치 및 cell 연결설정
    func setTableView(){
        //위치 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            
                //view.safeAreaLayoutGuide.leftAnchor 적용해서 어떤건지 알아보기
        ])
        
        //tableView cell 연결설정
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewcell")
        
    }
}


//필수: tableView 양식 설정
extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    
    //필수: 각 세션 당, row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Search.SearchData.count
    }
    
    //필수: 각 cell에 내용 가져옴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Views>searchView>SearchTableViewcell.swift 에 만든 cell 디자인 그대로 적용
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewcell", for: indexPath) as? SearchTableViewCell
        else{
            print("fail to searView/TableViewCell")
            return UITableViewCell()
        }
        cell.backgroundColor = UIColor(red: 0.125, green: 0.125, blue: 0.125, alpha: 1)
        
        //각 cell에 데이터 할당
        //Views>searchView>SearchTableViewcell.swift 에서 config 함수로 가져올 데이터 설정
        //실제 데이터는 Model>Search에 위치
        let target = Search.SearchData[indexPath.item]
        let image = UIImage(named:"\(target.image).png")
        cell.leftImageView.image = image
        cell.label.text = target.label
        
        
        //let data
        
        return cell
    }
    
    
    //각 row의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
    
}

//hot reloading을 위한 코드
extension SearchViewController {
    @objc func injected() {
        viewDidLoad()
    }
}


