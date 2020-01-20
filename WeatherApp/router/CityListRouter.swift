//
//  CityListRouter.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit

class CityListRouter : CityListPresenterToRouterProtocol{
    
    static func createCityListView() -> CityListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
        
        let presenter: CityListViewToPresenterProtocol & CityListInteractorToPresenterProtocol = CityListPresenter()
        let interactor: CityListPresenterToInteractorProtocol = CityListIntrector()
        let router: CityListPresenterToRouterProtocol = CityListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }


}
