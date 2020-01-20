//
//  CityListPresenter.swift
//  WeatherApp
//
//  Created by Apple on 18/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CityListPresenter:CityListViewToPresenterProtocol,CityListInteractorToPresenterProtocol  {
    
    
    
    var view: CityListPresenterToViewProtocol?
    var interactor: CityListPresenterToInteractorProtocol?
    var router: CityListPresenterToRouterProtocol?
    
    func startFetchingLocation() {
        interactor?.startFetchingLoacation()
    }
    
    func didRecievedLocation(currentLocation: Location) {
        self.view?.didRecievedLocation(currentLocation: currentLocation)
    }
    
    func stopFetchingLocation() {
       
    }
}
