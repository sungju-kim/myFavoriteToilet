//
//  mapViewController.swift
//  myFavoriteToilet
//
//  Created by 성주 on 2021/11/29.
//

import UIKit
import MapKit

class Marker: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?
    
    init(
        title: String?,
        subtitle : String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
}

let firstPosition = Marker(title: "코드스쿼드", subtitle: "?", coordinate: CLLocationCoordinate2D(latitude: 37.49090614360296, longitude: 127.03343847684948))

class mapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.addAnnotation(firstPosition)

        // Do any additional setup after loading the view.
    }

}
