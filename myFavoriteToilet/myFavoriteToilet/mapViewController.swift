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

class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
//        mapView.addAnnotation(firstPosition)
        spawnMarker()
//        detectMarkerLocation()
        
        // Do any additional setup after loading the view.
    }
    let labelString = "123"
    override func prepare(for segue : UIStoryboardSegue, sender: Any?) {
        guard let pinTouchViewController = segue.destination as? pinTouchViewController,
        let labelString = sender as? String else {return}
//    https://stackoverflow.com/questions/33053832/swift-perform-segue-from-map-annotation
    }
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        self.performSegue(withIdentifier: "pinTouchViewController", sender: nil)
//        print("touched")
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
        guard let lonitude = Double(markerInform[3]) else {return}
        let newMarker = Marker(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: lonitude))
            mapView.addAnnotation(newMarker)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01)
    }
    
    func detectMarkerLocation(){
        let currentPosition = CLLocationCoordinate2DMake(37.49090614360296, 127.03343847684948)
        let range = 100.0

        let currentRange = CLCircularRegion(center: CLLocationCoordinate2D(latitude: currentPosition.latitude,longitude: currentPosition.longitude), radius: range, identifier: "코드스쿼드")
        let circle = MKCircle(center: currentPosition, radius: range)
        mapView.addOverlay(circle)
    }
    
//    for marker in mapView.annotations{
//        if currentRange.contains
//    }
    
    
    
    
    
}
