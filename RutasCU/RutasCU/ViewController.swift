//
//  ViewController.swift
//  RutasCU
//
//  Created by 2020-1 on 11/7/19.
//  Copyright © 2019 UltaCode. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager =  CLLocationManager()
    
    var latitud: CLLocationDegrees!
    var longitud: CLLocationDegrees!
    
    @IBOutlet weak var mapa: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        locationManager.startUpdatingLocation()
        
        mapa.delegate = self
        mapa.showsUserLocation = true
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first!)
        
        if let localidad = locations.first{
            latitud = localidad.coordinate.latitude
            longitud = localidad.coordinate.longitude
            
            let localizacion = CLLocationCoordinate2DMake(latitud, longitud)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: localizacion, span: span)
            
            mapa.setRegion(region, animated: true)
            mapa.mapType = .standard
            
            
        }
        
        
    func getFirstLocation (location: String){
        let path = Bundle.main.path(forResource: "LocationData", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)
        let location = try! JSONDecoder().decode(Location.self, from: jsonData! as Data)
        }
        
    }


}

