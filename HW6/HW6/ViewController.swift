import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 배경색 설정

        // 네비게이션 타이틀 설정
        self.title = "메인 페이지"

        makeNavigationBar()
    }
    
    func makeNavigationBar() {
        let rightButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(goToNextPage))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func goToNextPage() {
        // 다음 페이지로 이동하는 로직
    }
}
