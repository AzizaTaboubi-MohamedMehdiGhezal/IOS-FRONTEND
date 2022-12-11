//
//  IconCollectionViewCell.swift
//  Projet
//
//  Created by ghezal0n on 13/11/2022.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgicon: UIImageView!
    @IBOutlet weak var labelicon: UILabel!
    
    func setupCell(photo: UIImage, cat: String){
        imgicon.image = photo
        labelicon.text = "\(cat)"
    }
}
