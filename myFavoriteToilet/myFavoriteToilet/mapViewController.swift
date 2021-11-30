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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.reloadInputViews()
    }
    
    var annotationTitle = ""
    var annotationSubTitle = ""
    var selectedAnnotation: Marker?
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }

            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "") {
                annotationView.annotation = annotation
                return annotationView
            } else {
                let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:"")
                annotationView.isEnabled = true
                annotationView.canShowCallout = true

                let btn = UIButton(type: .detailDisclosure)
                annotationView.rightCalloutAccessoryView = btn
                btn.addTarget(self, action: #selector(didClickDetailDisclosure(button:)), for: .touchUpInside)
                return annotationView
            }
        }
    
    @objc func didClickDetailDisclosure(button: UIButton) {
        performSegue(withIdentifier: "showPinTouchView", sender: nil)
       }
    
    func mapView(_ mapView: MKMapView, didSelect view : MKAnnotationView) {
        annotationTitle = view.annotation!.title!!
        annotationSubTitle = view.annotation!.subtitle!!
        pinTouchViewController.pinTitle = annotationTitle
        pinTouchViewController.pinSubTitle = annotationSubTitle
        
    }

    
    
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
        let centerPosition = CLLocationCoordinate2DMake(37.49095718455182, 127.03348137068356)
        let range = 1000.0
        let myRange = CLCircularRegion(center: CLLocationCoordinate2D(latitude: centerPosition.latitude,longitude: centerPosition.longitude), radius: range, identifier: "myRange")
        let circle = MKCircle(center: centerPosition, radius: range)
        mapView.addOverlay(circle)
        let newMarker = Marker(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        if myRange.contains(newMarker.coordinate){
            mapView.addAnnotation(newMarker)
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01)
    }
    
}

