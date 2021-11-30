//
//  pinTouchViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class pinTouchViewController: UIViewController{
    static var pinTitle : String?
    static var pinSubTitle : String?
    @IBOutlet weak var touchedPinTitle: UILabel!
    @IBOutlet weak var touchedPinSubTitle: UILabel!

    override func viewDidLoad() {
        touchedPinTitle.text = pinTouchViewController.pinTitle!
        touchedPinSubTitle.text = pinTouchViewController.pinSubTitle!
    }
    
    
    
}

