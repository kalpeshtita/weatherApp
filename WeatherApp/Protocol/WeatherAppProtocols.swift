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
    func startFetchingLocation()
    func stopFetchingLocation()

}

protocol CityListPresenterToViewProtocol: class{
    
    func didRecievedLocation(currentLocation: Location)
}

protocol CityListPresenterToRouterProtocol: class {
    
}

protocol CityListPresenterToInteractorProtocol: class {
    var presenter:CityListInteractorToPresenterProtocol? {get set}
    func startFetchingLoacation()
    func stopFetchingLoacation()
}

protocol CityListInteractorToPresenterProtocol: class {
    func didRecievedLocation(currentLocation: Location)
    
}
