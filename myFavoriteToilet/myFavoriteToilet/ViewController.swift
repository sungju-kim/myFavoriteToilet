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
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelOneView: UIView!
    @IBOutlet weak var labelTwoView: UIView!
    
    @IBOutlet weak var goForIt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelOne.alpha = 0
        self.labelTwo.alpha = 0
        self.goForIt.alpha = 0
        
        
        // Do any additional setup after loading the view.
    }
    func fadeInOutA() {
        labelOne.textColor = .darkGray
        labelTwo.textColor = .darkGray
        goForIt.tintColor = .darkGray
        UIView.animate(withDuration: 1.0, animations: {
            self.labelOne.alpha = 1.0
        })
        UIView.animate(withDuration: 1.0,delay: 1, animations: {
            self.labelTwo.alpha = 1.0
        })
        UIView.animate(withDuration: 0.5,delay: 2, animations: {
            self.goForIt.alpha = 1.0
        })

    }
    
    var count = 0
    @IBAction func tapped(_ sender: Any) {
        count += 1
        if count == 1 {
            fadeInOutA()
        }
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
