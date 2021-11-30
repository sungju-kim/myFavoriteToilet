//
//  pinTouchViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class pinTouchViewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    static var pinTitle : String?
    static var pinSubTitle : String?
    @IBOutlet weak var touchedPinTitle: UILabel!
    @IBOutlet weak var touchedPinSubTitle: UILabel!

    override func viewDidLoad() {
        touchedPinTitle.text = pinTouchViewController.pinTitle!
        touchedPinSubTitle.text = pinTouchViewController.pinSubTitle!
        
        if touchedPinTitle.text!.contains("주유소") || touchedPinTitle.text!.contains("충전소"){
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/gasStation.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }else if touchedPinTitle.text!.contains("빌딩") {
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/building.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }else {
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/office.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }
        
        
    }
    
}

