//
//  ViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class Toilet {
    let toiletArray : [[String]]
    init(){
        let myPublicToilet = try!String(contentsOfFile: "/Users/KSJ/Desktop/swift/myFavoriteToilet/koreaToilet/seoulPublicToilet.csv")
        let toiletInformation = myPublicToilet.components(separatedBy: "\n").map{$0.replacingOccurrences(of: ", ", with: " ").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")}
        toiletArray = toiletInformation
    }
    func returnToiletArray(_ arr : [[String]]) -> [[String]] {
        return arr
    }
    
}
let toiletArray = Toilet().toiletArray
