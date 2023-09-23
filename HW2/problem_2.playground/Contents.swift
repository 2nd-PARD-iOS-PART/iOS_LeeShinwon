import UIKit
import Foundation


// ---------- Mark : if문  ----------------
//문제 1: if 문
//문자열 변수 fruit이 "apple", "banana", "cherry" 중 하나일 때, 해당하는 과일을 출력하세요.
//var fruit = "apple" // 이 값을 "banana"나 "cherry"로 바꿔보세요.
var fruit = "apple"
if fruit == "apple" || fruit == "banana" || fruit == "cherry" {
    print(fruit)
}

// ---------- Mark : if문  ----------------




// ---------- Mark : guard문  ----------------
//문제 2: guard 문
//함수 printPositiveNumber를 작성하세요. 이 함수는 하나의 정수 인자를 받아, 그 값이 양수일 경우에만 그 값을 출력합니다. 만약 값이 양수가 아니라면, "The number is not positive."를 출력합니다.
//
func printPositiveNumber(_ number: Int) {
    guard number > 0 else{
        print("The number is not positive.")
        return
    }
    print(number)
}
//
printPositiveNumber(5)  // 5를 출력해야 함
printPositiveNumber(-3) // "The number is not positive." 출력해야 함



// ---------- Mark : enum 연관값  ----------------

//문제 1: 연관값 사용하기
//"책(Book)", "비디오(Video)", "음악(Music)" 등의 미디어 아이템을 나타내는 열거형을 작성하세요. 각 아이템에는 타이틀(title)이라는 연관값을 부여합니다.

// ---------- Mark : enum 연관값  ----------------
enum mediaItem{
    case Book(title: String)
    case Video(title: String)
    case Music(title: String)
}

let myMediaItem: mediaItem = .Music(title: "Love Lee")


// ---------- Mark : enum 원시값  ----------------

//문제 2: 원시값 사용하기
//열거형을 사용해 주중(sunday to saturday)을 나타내세요. 각 요일에는 1부터 7까지의 원시값을 부여합니다.
enum week: Int{
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

let day: week = .Monday
day.rawValue

let today = week(rawValue: 7)

// ---------- Mark : function overloading  ----------------

//문제 1: 함수 오버로딩 (Overloading)
//printArea라는 함수를 작성해보세요. 이 함수는 사각형의 가로와 세로 길이를 받아 면적을 출력하고, 또 다른 버전의 함수는 원의 반지름을 받아 면적을 출력합니다.

func printArea(_ width:Int, _ height:Int) -> Int {
    return width * height
}

func printArea(_ radius:Int) -> Double {
    return Double(radius * radius) * 3.14
}

printArea(3,4)
printArea(4)



// ---------- Mark : function If문사용 / guard문 사용  ----------------

//문제: 로그인 상태 확인
//함수 checkLoginStatus를 작성해보세요. 이 함수는 로그인 상태를 나타내는 Bool 변수와 사용자 이름을 나타내는 String? 변수를 받습니다. 만약 로그인 상태가 true이면 사용자 이름을 출력하고, false이면 "로그인이 필요합니다."를 출력하세요. 사용자 이름이 nil이라면 "알 수 없는 사용자"를 출력하세요.

// ---------- Mark : function If문사용   ----------------

func checkLoginStatus_if(_ status:Bool, _ name:String?){
    if status {
        let checkingStatus: String? = name
        if let check = checkingStatus{
            print(name!)
        }
        else{
            print("알 수 없는 사용자")
        }
    }
    else{
        print("로그인이 필요합니다.")
    }
}
checkLoginStatus_if(true, "Shinwon Lee")
checkLoginStatus_if(false, "Shinwon Lee")
checkLoginStatus_if(true, nil)

// ---------- Mark : function guard문 사용  ----------------
func checkLoginStatus_guard(_ status:Bool, _ name:String?){
    if status {
        let checkingStatus: String? = name
        guard let check = checkingStatus else{
            print("알 수 없는 사용자")
            return
        }
        print(name!)
    }
    else {
        print("로그인이 필요합니다.")
    }
    
}

checkLoginStatus_guard(true, "Shinwon Lee")
checkLoginStatus_guard(false, "Shinwon Lee")
checkLoginStatus_guard(true, nil)



// ---------- Mark : Optional Nil-coalescing 사용  ----------------


//문제 1: Nil-coalescing 연산자 ?? 사용하기
//문자열 배열 names에 이름이 몇 개 들어있습니다. 배열의 첫 번째 요소를 출력하세요. 만약 배열이 비어 있다면 "No name found"를 출력하세요.
var names: [String] = ["Alice", "Bob", "Charlie"]

print(names.first ?? "No name found")


// ---------- Mark : Optional if-let 사용  ----------------

//문제 2: if-let을 사용한 옵셔널 바인딩
//문자열 옵셔널 optionalString에 값이 있을 수도, 없을 수도 있습니다. 값이 있으면 "The string is:"와 함께 값을 출력하세요. 값이 없으면 "The string is nil."을 출력하세요.
var optionalString: String? = "Hello"

// 여기에 코드를 작성하세요.

// ---------- Mark : Optional if-let 사용  ----------------
if let check = optionalString {
    print("The string is: " + check)
}
else{
    print("The string is nil.")
}

// ---------- Mark : Optional guard-let 사용  ----------------
func checkOptionalString() {
    guard let check = optionalString else{
        print("The string is nil.")
        return
    }
    print("The string is: " + check)
}

checkOptionalString()
