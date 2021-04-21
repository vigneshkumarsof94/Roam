//
//  ViewController.swift
//  roam_interview
//
//  Created by Vignesh Kumar on 21/04/21.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var background: UIBackgroundTaskIdentifier = .invalid
    var points = [CLLocation]()
    var timer = Timer()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            //locationManager.startUpdatingLocation()
            locationManager.allowsBackgroundLocationUpdates = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        if (status == .authorizedAlways){
            print("Success")
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if let location = locations.last {
            print("location: \(location.coordinate.latitude) \(location.coordinate.longitude)")
           // print("time: \(location.timestamp)")
           // print("accuracy \(location.horizontalAccuracy)")
            points.append(location)
            //print(points)
           }
       // locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        locationManager.startUpdatingLocation()
        //locationManager.stopUpdatingLocation()
       
       /* DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.locationManager.startUpdatingLocation()
            //self.locationManager.stopUpdatingLocation()
        }*/
       // timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(scheduledTimerWithTimeInterval), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        var location = [String:Any]()
        locationManager.stopUpdatingLocation()
        print(points)
        for i in points{
            location["latitude"] = i.coordinate.latitude
            location["longitude"] = i.coordinate.longitude
            location["timestamp"] = i.timestamp
        }
       
    }
    
    func storeData(){
        func storeData(){
            let sharedPref = UserDefaults.standard
           sharedPref.setValue(points, forKey: "json")
          }
    }
   
    @objc func scheduledTimerWithTimeInterval(){
        
        //locationManager.stopUpdatingLocation()
        //timer.invalidate()
        
            
    }
   
    
}

