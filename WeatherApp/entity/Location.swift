//
//  Location.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class Location: Codable {

    let latitude: Double
    let longitude: Double

    
    static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      formatter.timeStyle = .medium
      return formatter
    }()
    
    var coordinates: CLLocationCoordinate2D {
      return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    init(_ location: CLLocationCoordinate2D) {
      latitude =  location.latitude
      longitude =  location.longitude
    }
    
}

// MARK:- Login API
struct WeatherHightlightRequest: Codable {
    let lat: Double
    let long: Double
    let units: String 
    
}

extension WeatherHightlightRequest: APIEndpoint {
    
    func endpoint() -> String {
        return "weather"
    }
    
    func getURLPerameters() -> String {
        
        return "&lat=\(lat)&lon=\(long)&units=\(units)"
    }
    
    func dispatch(onSuccess successHandler: @escaping ((_: WeatherHighlights) -> Void), onFailure failureHandler: @escaping ((_: APIError?, _: Error) -> Void)) {
        APIRequest.get(request: self, onSuccess: { (baseAPIResponse) in
            successHandler(baseAPIResponse)
        }) { (baseAPIError, error) in
            failureHandler(baseAPIError, error)
        }
    }
}

