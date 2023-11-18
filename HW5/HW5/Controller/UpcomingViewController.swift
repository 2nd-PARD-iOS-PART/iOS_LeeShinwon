//
//  UpcomingViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class UpcomingViewController: UIViewController {

    private let tableView = UITableView() //tableView 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureNavbar()
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        setTableView()
        
    }
    
    
    private func configureNavbar(){
        let title = "Notifications"
        let image = UIImage(named: "notification_logo")
        
        let containerView = UIView()
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        let customNavigationItem = UIBarButtonItem(customView: containerView)
        self.navigationItem.leftBarButtonItem = customNavigationItem
        
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
        return 65
    }
    
}


//hot reloading을 위한 코드
extension UpcomingViewController {
    @objc func injected() {
        viewDidLoad()
    }
}
