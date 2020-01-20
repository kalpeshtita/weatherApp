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
    
    
    // MARK: override method from CityListViewToPresenterProtocol
    func getWeatherHighlightsForCurrentLocation() {
        interactor?.getWeatherHighlightsForCurrentLocation()
    }
    
    // MARK: override method from CityListInteractorToPresenterProtocol
    func didRecieved(weatherHighlights: WeatherHighlights) {
        view?.didRecieved(weatherHighlights: weatherHighlights)
    }

}
