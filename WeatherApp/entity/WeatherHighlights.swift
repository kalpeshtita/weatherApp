//
//  ModelAPIResponse.swift
//  WeatherApp
//
//  Created by Kalpesh on 20/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherHighlights : Mappable {
    
    var coord: [String:Any]?
    var weather: [[String:Any]]?
    var base: String?
    var main: [String:Any]?
    var visibility: Int?
    var wind: [String:Any]?
    var clouds: [String:Any]?
    var dt:Int?
    var sys: [String:Any]?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    

    required init?(map: Map) {}

    func mapping(map: Map) {
        coord       <- map["coord"]
        weather     <- map["weather"]
        base        <- map["base"]
        main        <- map["main"]
        visibility  <- map["visibility"]
        wind        <- map["wind"]
        clouds      <- map["clouds"]
        dt          <- map["dt"]
        sys         <- map["sys"]
        timezone    <- map["timezone"]
        id          <- map["id"]
        name        <- map["name"]
        cod         <- map["cod"]

    }
}

class APIError: Mappable {
    
    var cod: Int?
    var message: String?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        cod       <- map["cod"]
        message        <- map["message"]
    }
}
