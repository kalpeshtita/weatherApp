//
//  LocationService.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: NSObject{
    
    // MARK: properies
    private static var sharedLocationService: LocationService = {
        let locationService = LocationService()

        return locationService
    }()

    
    var locationServiceDelegate: LocationServiceDelegate?
    
    var locationManager: CLLocationManager?
    var lastLocation: Location?
    var delegate: LocationServiceDelegate?

    override init() {
        super.init()

        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 200 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
        locationManager.delegate = self
    }

    // MARK: Public function to intract with class
    class func sharedInstance() -> LocationService {
        return sharedLocationService
    }

    func startUpdatingLocation() {
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager?.stopUpdatingLocation()
    }
    
    // MARK: Private function
    private func updateLocation(currentLocation: Location){

        guard let delegate = self.delegate else {
            return
        }
        
        
        
        delegate.didRecievedLocation(currentLocation: currentLocation)
    }
    
    private func updateLocationDidFailWithError(error: NSError) {
        
        guard let delegate = self.delegate else {
            return
        }
        
        delegate.didFailWithErrorToRecieveLocation(error: error)
    }


}

extension LocationService: CLLocationManagerDelegate{
    // MARK: CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else {
            return
        }
        
        // singleton for get last location
        self.lastLocation = Location(location.coordinate)
        
        
        // use for real time update location
        self.updateLocation(currentLocation: Location(location.coordinate))
    }
    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        // do on error
        self.updateLocationDidFailWithError(error: error)
    }

}
