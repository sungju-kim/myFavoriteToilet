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
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var touchedPinTitle: UILabel!
    @IBOutlet weak var touchedPinSubTitle: UILabel!
    @IBOutlet weak var starRates: UIStackView!
    
    
    @IBAction func btnOne(_ sender: Any) {
        btnOne.setTitle("★", for: .normal)
        btnTwo.setTitle("☆", for: .normal)
        btnThree.setTitle("☆", for: .normal)
        btnFour.setTitle("☆", for: .normal)
        btnFive.setTitle("☆", for: .normal)
    }
    @IBAction func btnTwo(_ sender: Any) {
        btnOne.setTitle("★", for: .normal)
        btnTwo.setTitle("★", for: .normal)
        btnThree.setTitle("☆", for: .normal)
        btnFour.setTitle("☆", for: .normal)
        btnFive.setTitle("☆", for: .normal)
    }
    @IBAction func btnThree(_ sender: Any) {
        btnOne.setTitle("★", for: .normal)
        btnTwo.setTitle("★", for: .normal)
        btnThree.setTitle("★", for: .normal)
        btnFour.setTitle("☆", for: .normal)
        btnFive.setTitle("☆", for: .normal)
        
    }
    @IBAction func btnFour(_ sender: Any) {
        btnOne.setTitle("★", for: .normal)
        btnTwo.setTitle("★", for: .normal)
        btnThree.setTitle("★", for: .normal)
        btnFour.setTitle("★", for: .normal)
        btnFive.setTitle("☆", for: .normal)
    }
    @IBAction func btnFive(_ sender: UIButton) {
        btnOne.setTitle("★", for: .normal)
        btnTwo.setTitle("★", for: .normal)
        btnThree.setTitle("★", for: .normal)
        btnFour.setTitle("★", for: .normal)
        btnFive.setTitle("★", for: .normal)
    }
    
    override func viewDidLoad() {
        touchedPinTitle.text = pinTouchViewController.pinTitle!
        touchedPinSubTitle.text = pinTouchViewController.pinSubTitle!
        self.touchedPinTitle.alpha = 0
        self.touchedPinSubTitle.alpha = 0
        self.imageView.alpha = 0
        self.starRates.alpha = 0
        insertImage()
        fadeInOutA()
        
        
    }
    
    func insertImage() {
        if touchedPinTitle.text!.contains("주유소") || touchedPinTitle.text!.contains("충전소"){
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/gasStation.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }else if touchedPinTitle.text!.contains("빌딩") {
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/building.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }else if touchedPinTitle.text!.contains("센터") {
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/center.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }else {
            let url = URL.init(fileURLWithPath: "/Users/KSJ/Desktop/swift/myFavoriteToilet/picture/office.jpeg")
            let data = NSData(contentsOf: url)!
            imageView.image = UIImage(data: data as Data)
        }
    }
    func fadeInOutA() {
        touchedPinTitle.textColor = .darkGray
        touchedPinSubTitle.textColor = .darkGray
        imageView.tintColor = .darkGray
        UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
           
            self.imageView.alpha = 1.0
        })
        UIView.animate(withDuration: 0.5,delay: 0.4, animations: {
            self.touchedPinTitle.alpha = 1.0
        })
        UIView.animate(withDuration: 0.5,delay: 0.6, animations: {
            self.touchedPinSubTitle.alpha = 1.0
        })
        UIView.animate(withDuration: 0.5,delay: 0.8, animations: {
            self.starRates.alpha = 1.0
        })

    }
    
}

