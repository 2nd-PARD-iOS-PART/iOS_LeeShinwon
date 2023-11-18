# Netflix clone coding

### 개발 일자
2023.10.07 ~ 2023.10.21


<br><br>

### 개발 내용
**Search, Downloads 페이지 구현** 

<img src="https://github.com/2nd-PARD-iOS-PART/iOS_LeeShinwon/assets/82192923/14f66ff2-8240-488d-a1d7-2b29f92b636e" width="250" height="500">

<img src="https://github.com/2nd-PARD-iOS-PART/iOS_LeeShinwon/assets/82192923/1ffa8414-7b44-4cd7-99c6-5b54eaaff4e6" width="250" height="500">


<br><br>
> **1. Search 페이지 구현** <br>
> 드라마, 영화 항목을 검색할 수 있는 페이지. 인기 서칭 목록이 기본으로 뜸.
* 코드 상, 구현 파일 위치 <br>
Controller>SearchViewController, Views>SearchTableViewCell, Model>Search

* 핵심 구현 내용
    * **nav 부분** <br>
      <img width="341" alt="image" src="https://github.com/2nd-PARD-iOS-PART/iOS_LeeShinwon/assets/82192923/4fe5d942-10aa-4d7f-8b23-3df1ee5267af"> <br>
      navigationController 의 navigationBar를 사용.<br>
      navigationItem의 title에 searchBar 할당.<br>
      navigationItem의 right에 mic UIImage 를 담은 UIBarButtonItem 할당.<br>
      title 과 right을 한 부분처럼 보이게 감싸기 위해, 기존 searchBar의 background를 죽이고, nav의 layer에 background와 cornerRadius를 줌.<br>
      
      ```swift:Controller> SearchViewController.swift
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
      ```


    * **tableview 부분** <br>
      [tableView 헤더 설정]
      
      <img width="341" alt="image" src="https://github.com/2nd-PARD-iOS-PART/iOS_LeeShinwon/assets/82192923/e02923b4-8046-497d-8124-68fff14a09de"> <br>

      ```
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
      ```
      <br><br>

      <br>
      <img width="342" alt="image" src="https://github.com/2nd-PARD-iOS-PART/iOS_LeeShinwon/assets/82192923/2d7c30f2-14ea-4b24-9781-f924fe14b7d0"> <br><br><br>

      **tableView 의 모든 것(헤더 제외)** <br><br>
      [tableView 위치 및 cell 연결 설정] <br>

      ```
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

      ```

      [tableView 양식 설정]
      ```
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

      ```

      **tableView cell 설정의 모든 것**<br>
      각 셀은 왼쪽부터 UIImageView, UIButton, UILabel 순서로 구성됨.<br>
      사진의 경우, 크기 설정이 되어 있어야 하고, 3가지 UIView 들 또한 각각의 위치가 정해져 있음.<br>
      configuration 함수로 각 cell이 받을 데이터 항목을 설정해두어야 함.<br>

      [cell 의 UIView 선언]
      ```
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

      ```
 
      [cell 에 넣어줄 데이터 선언]
      ```
      func configuration(with image: UIImage, name: String){
        leftImageView.image = image
        label.text = name
        print(image, name)
      }
      ```

      [cell 3개 UIView 위치 설정]
      ```
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
      ```




<br><br><br>

> **2. Downloads 페이지 구현**<br>
> 사용자가 다운로드한 항목이 뜸. 다운로드한 항목이 없다면, 기본 화면을 보여줌.


<br><br>

### 회고
개발을 마무리 하지 못하고, 중간고사 기간을 가지는 바람에 개발이 길어졌다. 호흡이 길어지니 의욕이 떨어지는 듯하다. 아직 UIKit 을 거의 모르는 상태여서, 거의 대부분을 공홈 doc 이나 chatGPT, 구글링으로 찾아가면서 구현했다. 이렇게 찾아볼수록 나만의 비법노트가 절실히 필요함을 느꼈다. (정말이지 맨날 똑같은거 몰라서 찾아보는거 짜증난다고...😬) <br>
또한 과제가 업그레이드 되어서 readMe 를 이제 필수로 써야하게 되었지만, 이렇게 구현 내용을 정리하니 뭔가 한게 있는 듯 해서 뿌듯하다. <br>
여전히 개발 시간이 굉장히 많이 걸리고, 구현 하면서도 이해하지 못하는 내용이 많았다. 좀 더 공부가 필요하다. <br>
정신을 바짝 차리고 유능한 UIKit 개발자가 되고싶다... 나도 뭔갈 만들어보고 싶다고... <br>
파트장님이 과제조차 내지 않는 우리에게 하신 말씀이 있었는데... 그 말을 듣고 정신이 확 들었다. <br>
"여러분! 이 상태라면 숏커톤과 롱커톤 때 아무도 우리 iOS 파트를 선택하지 않을거에요!😤 그리고 선택한다고 하더라도 우리는 아무것도 구현할 수 없을거에요!🥹" <br>
진짜 이게 부정할 수 없는 fact여서... 진짜 위급함을 확 느꼈다. 그리고 너무 속상해하는 파트장님과 부파트장님께 죄송하고, 또 죄송한... 🙏🏻
이제라도 열심히 해보겠다... 💪🏻💪🏻💪🏻 <br>
(그리고 이 글을 끝까지 읽은 당신🫵, 고마워...👊🏻)
