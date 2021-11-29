//
//  ViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        toilet
        // Do any additional setup after loading the view.
    }
    
    func createMarker(_ title : String, _ subtitle: String, _ coordinate: String ) {
        let coordinate = coordinate.0
        Marker(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2D(latitude: 37.49090614360296, longitude: 127.03343847684948))
    }
    func detectMarkerLocation() {
        let 홍대입구역중앙 = CLLocationCoordinate2DMake(37.55769, 126.92450)
        let 범위 = 100.0 //100meter를 뜻함
        
        let 홍대입구역범위 = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 홍대입구역중앙.latitude,longitude: 홍대입구역중앙.longitude), radius: 범위, identifier: "홍대입구역")
        let 원모양 = MKCircle(center: 홍대입구역중앙, radius: 범위)
        mapView.addOverlay(원모양)

    }


}
    

    
//구분 화장실명 소재지도로명주소 소재지지번주소 개방시간 위도 경도
class Toilet {
    init(){
        let myPublicToilet = try!String(contentsOfFile: "/Users/KSJ/Desktop/swift/myFavoriteToilet/koreaToilet/seoulPublicToilet.csv")
        let toiletInformation = myPublicToilet.components(separatedBy: "\n").map{$0.replacingOccurrences(of: ", ", with: " ").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")}
        toiletInformation.forEach{print($0)}
//        let openedToilets = toiletInformation.filter{$0[0] == "개방화장실"}
//        let publicToilets = toiletInformation.filter{$0[0] == "공중화장실"}
        
    }
    
}

let toilet = Toilet()
