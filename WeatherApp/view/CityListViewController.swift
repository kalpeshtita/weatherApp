//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Kalpesh on 18/01/20.
//  Copyright © 2020 Kalpesh. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    var presentor: CityListViewToPresenterProtocol?
    
    private let reuseIdentifier = "CityCollectionViewCell"
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var itemsPerRow: CGFloat = 3
    private var currentLocation : Location?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateItemPerRow()
        presentor?.startFetchingLocation()
        
    }
    
    func updateItemPerRow(){
        if UIDevice.current.userInterfaceIdiom == .pad{
            itemsPerRow = 7
        }
    }
    


}

extension CityListViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARk :- override method from UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

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
    func didRecievedLocation(currentLocation: Location) {
        if self.currentLocation == nil{
            self.currentLocation = currentLocation
            self.presentor?.stopFetchingLocation()
        }
    }
    
    
}

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cloudImage: UIImageView!
    
}
