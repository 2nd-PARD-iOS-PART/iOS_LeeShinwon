//
//  SearchViewController.swift
//  HW3
//
//  Created by 이신원 on 2023/09/30.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
                
                // 이 ViewController를 searchResultsUpdater로 설정
                searchController.searchResultsUpdater = self
                
                // 검색 바를 내비게이션 바에 추가
                navigationItem.searchController = searchController
                
                // 검색 바 활성화
                searchController.isActive = true
//        view.addSubview(searchController)
        //view.backgroundColor = .systemBackground
    }
    
    func updateSearchResults(for searchController: UISearchController) {
            // 검색어 처리 및 결과 업데이트 로직을 여기에 구현
        }
    


}
