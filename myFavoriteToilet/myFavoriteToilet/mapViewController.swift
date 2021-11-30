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
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle : String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
}
class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        spawnMarker()

     }
    
    var selectedAnnotation: Marker?

    func mapView(_ mapView: MKMapView, didSelect view : MKAnnotationView) {
        let destiationVC = pinTouchViewController()
        self.selectedAnnotation = view.annotation as? Marker
        self.performSegue(withIdentifier: "showPinTouchView", sender: nil)
        destiationVC.receivedMarker = selectedAnnotation!
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPintTouchView" {
//                   print("1")
//                   guard let destiationVC = segue.destination as? pinTouchViewController else{
//                       return
//                   }
//                   print("2")
//            destiationVC.receivedMarker = MKAnnotationView.annotation as? Marker?
//                   print(destiationVC.receivedMarker)
//                   print("3")
//               }
//    }
    func myLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta : Double) {
        let coordinateLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let locationRegion = MKCoordinateRegion(center: coordinateLocation, span: spanValue)
        mapView.setRegion(locationRegion, animated: true)
    }
    
    func spawnMarker() {
        toiletArray.forEach{createMarker($0)}
    }

    
    func createMarker(_ markerInform : [String]) {
        let title = markerInform[1]
        let subtitle = markerInform[2]
        guard let latitude = Double(markerInform[4]) else {return}
        guard let longitude = Double(markerInform[3]) else {return}
        let newMarker = Marker(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            mapView.addAnnotation(newMarker)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01)
    }
    
    
    
    
}

