//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var cityCollectoinView : UICollectionView!
    var presentor: CityListViewToPresenterProtocol?
    
    private let reuseIdentifier = "CityCollectionViewCell"
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var itemsPerRow: CGFloat = 3
    private var currentLocation : Location?
    private var cityList = [WeatherHighlights]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateItemPerRow()
        presentor?.getWeatherHighlightsForCurrentLocation()
        
    }
    
    func updateItemPerRow(){
        if UIDevice.current.userInterfaceIdiom == .pad{
            itemsPerRow = 7
        }
    }
    
    func updateCityList(){
        cityCollectoinView.reloadData()
    }

}

extension CityListViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARk :- override method from UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CityCollectionViewCell
        cell.weatherHighlights =  cityList[indexPath.row]
        cell.loadData()
        return cell
        
    }
    // MARk :- override method from UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }

    
    
}

extension CityListViewController: CityListPresenterToViewProtocol{
    func didRecieved(weatherHighlights: WeatherHighlights) {
        
        if !self.cityList.contains(where: {
            $0.name == weatherHighlights.name
        })
        {
            self.cityList.append(weatherHighlights)
        }
        self.updateCityList()
    }
    
}

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cloudImage: UIImageView!
    
    var weatherHighlights : WeatherHighlights?
    
    func loadData(){
        
        if let mainData = weatherHighlights?.main{
            if let temprature = mainData["temp"] as? Double{
                self.temprature.text = "\(temprature)"
            }
        }
        
        
        if let cityName = weatherHighlights?.name{
            self.cityName.text = cityName
            
        }
        
//        if let cityName = weatherHighlights?.name{
//            self.cityName.text = cityName
//
//        }
    }
}
