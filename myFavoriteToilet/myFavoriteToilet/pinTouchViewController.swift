//
//  pinTouchViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class pinTouchViewController: UIViewController{
    var receivedMarker : Marker = Marker(title: "nil", subtitle: "nil", coordinate: CLLocationCoordinate2D(latitude: 37.49099123569794, longitude: 127.03348137068356))
    var markerTitle: String? = ""
    var markerSubTitle : String? = ""
    var labelString : String? = ""
    @IBOutlet weak var touchedPinTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(receivedMarker.title)
        
    }


}

