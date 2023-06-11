//
//  CollectionViewCell.swift
//  mandiri-movie
//
//  Created by Isaac on 6/11/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewWrapper: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewWrapper.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0.21322909, blue: 0.5749545693, alpha: 1), alpha: 0.1, x: -2, y: 2, blur: 6, spread: 0)
    }

}
