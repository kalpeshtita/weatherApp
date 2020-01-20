//
//  CityListIntrector.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class CityListIntrector: CityListPresenterToInteractorProtocol,LocationServiceDelegate {
    
    
    
    var presenter: CityListInteractorToPresenterProtocol?
    
    // MARK: Class Private function
    private func startFetchingCurrentLoacation() {
        
        if LocationService.sharedInstance().lastLocation == nil{
            LocationService.sharedInstance().startUpdatingLocation()
            LocationService.sharedInstance().delegate = self
        }else{
            self.fetchWeatherConditionFor(currentLocation: LocationService.sharedInstance().lastLocation!)
        }
    }
    
    private func stopFetchingLoacation() {
        LocationService.sharedInstance().stopUpdatingLocation()
    }
    
    private func fetchWeatherConditionFor(currentLocation: Location) {
        
        WeatherHightlightRequest.init(lat: currentLocation.latitude, long: currentLocation.longitude,units: TEMPERATURE_UNIT).dispatch(onSuccess: { (weaherHighlight) in
            
            if self.presenter  != nil {
                self.presenter?.didRecieved(weatherHighlights: weaherHighlight)
            }
            
        }) { (errorResponse, error) in
            
        }
    }
    
    // MARK: delegate method from CityListPresenterToInteractorProtocol
    func getWeatherHighlightsForCurrentLocation() {
        self.startFetchingCurrentLoacation()
    }



    // MARK: delegate method from LocationServiceDelegate
    func didRecievedLocation(currentLocation: Location) {
        fetchWeatherConditionFor(currentLocation: currentLocation)
        self.stopFetchingLoacation()
    }
    
    func didFailWithErrorToRecieveLocation(error: NSError) {
        
    }
    

    
}
