//
//  WeatherAppProtocols.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationServiceDelegate : class {
    func didRecievedLocation(currentLocation: Location)
    func didFailWithErrorToRecieveLocation(error: NSError)
}


protocol CityListViewToPresenterProtocol: class{
    
    var view: CityListPresenterToViewProtocol? {get set}
    var interactor: CityListPresenterToInteractorProtocol? {get set}
    var router: CityListPresenterToRouterProtocol? {get set}
    func getWeatherHighlightsForCurrentLocation()

}

protocol CityListPresenterToViewProtocol: class{
    
    func didRecieved(weatherHighlights: WeatherHighlights)
}

protocol CityListPresenterToRouterProtocol: class {
    
}

protocol CityListPresenterToInteractorProtocol: class {
    var presenter:CityListInteractorToPresenterProtocol? {get set}
    func getWeatherHighlightsForCurrentLocation()
}

protocol CityListInteractorToPresenterProtocol: class {
    func didRecieved(weatherHighlights: WeatherHighlights)
    
}
