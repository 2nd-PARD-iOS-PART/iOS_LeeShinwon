//
//  ViewController.swift
//  HW7
//
//  Created by 이신원 on 2023/11/18.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var pardData: PardData?
    let urlLink = "http://3.35.236.83/pard/all"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.register(UrlCollectionViewCell.self, forCellWithReuseIdentifier: "UrlCollectionViewCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUi()
        getData()
        setupCollectionView()
        // notificationCenter에 observer 추가하기
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: .addNotification, object: nil)
    }
    
    @objc func reloadCollectionView() {
        DispatchQueue.main.async {
            self.getData()
            self.collectionView.reloadData()
        }
    }
    
    // notification 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setUi(){
        let title: UILabel = {
            let label = UILabel()
            label.text = "UrlSession"
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            return label
        }()
        let addButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("추가", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
            return button
        }()
        view.addSubview(title)
        view.addSubview(addButton)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 100 ),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // add버튼 추가 시, 추가하기 위한 모달창이 뜬다.
    @objc func addButtonTapped(){
        let addDataVC = CreateViewController()
        print("button tapped")
        self.present(addDataVC, animated: true, completion: nil)
    }
    
    // collectionView 설정을 위한 함수
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // 서버에 저장 돼 있는 데이터를 불러온다.
    func getData(){
        if let url = URL(string: urlLink) {
            let session = URLSession(configuration: .default)
            // 지정된 URL의 내용을 검색하는 작업을 만든(creat)다음, 완료시 handler(클로저)를 호출
            // 클로저 앞에 @escaping이 있으면 함수의 작업이 완료된 후에 클로저가 호출된다.
                // data: 서버에서 반환된 데이터
                // response: HTTP 헤더 및 상태 코드와 같은 응답 메타 데이터를 제공하는 객체
                // error: 요청이 실패한 이유
            // 작업 후에는 반드시 resume()를 호출해야 한다.
                // 작업이 일시중단된 경우 다시 시작하는 것
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                // JSON data를 가져온다. optional 풀어줘야 함
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8) //얘도 확인을 위한 코드임
                    print(dataString!)
                    // JSONDecoder 사용하기
                    let decoder = JSONDecoder() // initialize

                    // .self를 붙이는 것 = static metatype을 .self 라고 한다. 꼭 넣어줘야 한다.
                    // 자료형이 아닌 변수 값을 써줘야 하므로 .self를 붙여준다.
                    // try catch문을 사용해야 함
                    do { //json형식으로 디코딩 한다.
                        let decodeData = try decoder.decode(PardData.self, from: JSONdata)
                        self.pardData = decodeData
                        // 데이터를 가져온 후 collectionView를 메인 스레드에서 리로드_반드시 해야 화면에서 보임.
                        DispatchQueue.main.async {
                            // reloadData를 써주면 된다. 다시 로드하기 위함.
                            self.collectionView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨", error)
                    }
                }
            }
            // task가 준비만 하고 멈춰있기 때문.
            task.resume()
        }
    }
    
    // MARK: - 여기부터는 collectionView를 위한 설정들
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  pardData?.data.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UrlCollectionViewCell", for: indexPath) as! UrlCollectionViewCell
        let nameData = pardData?.data[indexPath.row]
        cell.nameLabel.text = nameData?.name
        
        if let urlString = nameData?.imgURL, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.images.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedData = pardData?.data[indexPath.row] {
            let detailVC = DetailViewController(data: selectedData)
            present(detailVC, animated: true, completion: nil)
        }
    }
}


