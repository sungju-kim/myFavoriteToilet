//
//  pinTouchViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class pinTouchViewController: UIViewController{
    static var main : pinTouchViewController? = nil

        // 2. Your some UI element
    @IBOutlet weak var touchedPinTitle: UILabel!

    @IBOutlet weak var touchedPinSubTitle: UILabel!
    
        // 3. add this method
    func updateUI(title : String, subTitle : String ) {
            touchedPinTitle.text = title
            touchedPinSubTitle.text = subTitle
        }

        // 4. setting a var
        override func viewDidLoad() {
            if pinTouchViewController.main == nil {
                pinTouchViewController.main = self
            }
            print(touchedPinTitle.text)
        }
    
    
    
    
//    var receivedMarker : Marker = Marker(title: "good", subtitle: "nil", coordinate: CLLocationCoordinate2D(latitude: 37.49099123569794, longitude: 127.03348137068356))
//    var markerTitle: String? = ""
//    var markerSubTitle : String? = ""
//    var labelString : String? = ""
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(mapViewController().selectedAnnotation)
//        print(receivedMarker)
//
//    }


}

