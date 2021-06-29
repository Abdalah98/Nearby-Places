//
//  NearbyPalcseCollectionView +EXT.swift
//  Nearby Palce
//
//  Created by Abdallah on 6/29/21.
//

import UIKit

extension NearbyPalcesVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayNerbyPalces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearbyCell", for: indexPath) as! NearbyCell
        cell.namePlace.text = ArrayNerbyPalces[indexPath.item].palces
        cell.placeImage.image = UIImage(named:ArrayNerbyPalces[indexPath.item].iamge)

        return cell
    }
           

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            removeAllAnnotations()
            searchRequest(places:"policies")
            image = "police"
            print(indexPath.item)
        } else if indexPath.item == 1 {
            removeAllAnnotations()
            searchRequest(places:"Cafes")
            image = "coffee-cup"

        }  else if indexPath.item == 2 {
            removeAllAnnotations()
            searchRequest(places:"Banks")
            image = "bank"

        } else if indexPath.item == 3 {
            removeAllAnnotations()
            searchRequest(places:"Airports")
            image = "Airport"

        } else if indexPath.item == 4 {
            removeAllAnnotations()
            searchRequest(places:"Hotels")
            image = "hotel"

        } else if indexPath.item == 5 {
            removeAllAnnotations()
            searchRequest(places:"Restaurants")
            image = "shop"

        } else if indexPath.item == 6 {
            removeAllAnnotations()
            searchRequest(places:"museum")
            image = "museum"

        } else if indexPath.item == 7 {
            removeAllAnnotations()
            searchRequest(places:"hospital")
        } else if indexPath.item == 8 {
            removeAllAnnotations()
            searchRequest(places:"gym")
            image = "hospital"

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
