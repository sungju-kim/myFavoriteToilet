//
//  ViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        toilet
        // Do any additional setup after loading the view.
    }


}
    

    
//구분 화장실명 소재지도로명주소 소재지지번주소 개방시간 위도 경도
class Toilet {
    init(){
        let myPublicToilet = try!String(contentsOfFile: "/Users/KSJ/Desktop/swift/publicToilet/myPublicToilet/koreaToilet/seoulPublicToilet.csv")
        let toiletInformation = myPublicToilet.components(separatedBy: "\n").map{$0.replacingOccurrences(of: ", ", with: " ").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")}
        toiletInformation.forEach{print($0)}
//        let openedToilets = toiletInformation.filter{$0[0] == "개방화장실"}
//        let publicToilets = toiletInformation.filter{$0[0] == "공중화장실"}
        
    }
    
}

let toilet = Toilet()
