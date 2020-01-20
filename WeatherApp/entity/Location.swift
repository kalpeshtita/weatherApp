//
//  Location.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import Foundation
import CoreLocation

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
