//
//  CityListIntrector.swift
//  WeatherApp
//
//  Created by Apple on 18/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CityListIntrector: CityListPresenterToInteractorProtocol,LocationServiceDelegate {
    
    
    
    var presenter: CityListInteractorToPresenterProtocol?
    
    func startFetchingLoacation() {
        
        LocationService.sharedInstance().startUpdatingLocation()
        LocationService.sharedInstance().delegate = self
    }
    
    func stopFetchingLoacation() {
        LocationService.sharedInstance().stopUpdatingLocation()
    }
    
    func didRecievedLocation(currentLocation: Location) {
        self.presenter?.didRecievedLocation(currentLocation: currentLocation)
    }
    
    func didFailWithErrorToRecieveLocation(error: NSError) {
        
    }
    

    
}
