//
//  pinTouchViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class pinTouchViewController: UIViewController, UITextFieldDelegate{
    var thredStack : [String] = []
    @IBOutlet weak var imageView: UIImageView!
    static var pinTitle : String?
    static var pinSubTitle : String?
    
    @IBOutlet weak var typeSection: UITextField!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var touchedPinTitle: UILabel!
    @IBOutlet weak var touchedPinSubTitle: UILabel!
    @IBOutlet weak var starRates: UIStackView!
    @IBOutlet weak var stack1: UILabel!
    @IBOutlet weak var stack2: UILabel!
    @IBOutlet weak var stack3: UILabel!
    @IBOutlet weak var stack4: UILabel!
    @IBOutlet weak var stack5: UILabel!
    @IBOutlet weak var stack6: UILabel!
    
    @IBAction func writeThred(_ sender : Any) {
        if typeSection.text == "" {
            return
        }
        thredStack.append(typeSection.text!)
        typeSection.text = ""
        if thredStack.count == 7 {
            thredStack.removeFirst()
        }
        loadStack()
    }
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
        self.typeSection.delegate = self
        insertImage()
        randomStar()
        loadStack()
        fadeInOutA()
        
        
    }
    func randomStar() {
        let ranNum = Int.random(in: 1...5)
        switch ranNum {
        case 1:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("☆", for: .normal)
            btnThree.setTitle("☆", for: .normal)
            btnFour.setTitle("☆", for: .normal)
            btnFive.setTitle("☆", for: .normal)
        case 2:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("★", for: .normal)
            btnThree.setTitle("☆", for: .normal)
            btnFour.setTitle("☆", for: .normal)
            btnFive.setTitle("☆", for: .normal)
        case 3:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("★", for: .normal)
            btnThree.setTitle("★", for: .normal)
            btnFour.setTitle("☆", for: .normal)
            btnFive.setTitle("☆", for: .normal)
        case 4:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("★", for: .normal)
            btnThree.setTitle("★", for: .normal)
            btnFour.setTitle("★", for: .normal)
            btnFive.setTitle("☆", for: .normal)
        case 5:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("★", for: .normal)
            btnThree.setTitle("★", for: .normal)
            btnFour.setTitle("★", for: .normal)
            btnFive.setTitle("★", for: .normal)
        default:
            btnOne.setTitle("★", for: .normal)
            btnTwo.setTitle("☆", for: .normal)
            btnThree.setTitle("☆", for: .normal)
            btnFour.setTitle("☆", for: .normal)
            btnFive.setTitle("☆", for: .normal)

        }
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == self.typeSection {
                self.writeThred(self)
            }
            return true
        }
    func loadStack() {
        let stackedCount = thredStack.count 
        switch stackedCount {
        case 1:
            stack1.text = "\(thredStack[0])"
            stack2.text = ""
            stack3.text = ""
            stack4.text = ""
            stack5.text = ""
            stack6.text = ""
        case 2:
            stack1.text = "\(thredStack[1])"
            stack2.text = "\(thredStack[0])"
            stack3.text = ""
            stack4.text = ""
            stack5.text = ""
            stack6.text = ""
        case 3:
            stack1.text = "\(thredStack[2])"
            stack2.text = "\(thredStack[1])"
            stack3.text = "\(thredStack[0])"
            stack4.text = ""
            stack5.text = ""
            stack6.text = ""
        case 4:
            stack1.text = "\(thredStack[3])"
            stack2.text = "\(thredStack[2])"
            stack3.text = "\(thredStack[1])"
            stack4.text = "\(thredStack[0])"
            stack5.text = ""
            stack6.text = ""
        case 5:
            stack1.text = "\(thredStack[4])"
            stack2.text = "\(thredStack[3])"
            stack3.text = "\(thredStack[2])"
            stack4.text = "\(thredStack[1])"
            stack5.text = "\(thredStack[0])"
            stack6.text = ""
        case 6:
            stack1.text = "\(thredStack[5])"
            stack2.text = "\(thredStack[4])"
            stack3.text = "\(thredStack[3])"
            stack4.text = "\(thredStack[2])"
            stack5.text = "\(thredStack[1])"
            stack6.text = "\(thredStack[0])"
            
        default:
            stack1.text = ""
            stack2.text = ""
            stack3.text = ""
            stack4.text = ""
            stack5.text = ""
            stack6.text = ""
        }
    }
    
}

