//
//  NearbyCell.swift
//  Nearby Palce
//
//  Created by Abdallah on 6/28/21.
//

import UIKit

class NearbyCell: UICollectionViewCell {

    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var namePlace: UILabel!
    override func layoutSubviews() {
          super.layoutSubviews()
//          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 5, bottom:5, right: 5))
        
      }
   
}
