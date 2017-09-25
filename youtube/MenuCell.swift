//
//  MenuCell.swift
//  bufy
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let menuIconsImageView : UIImageView  = {
        let imageview = UIImageView()
        //imageview.backgroundColor = UIColor.blue
        //imageview.image = UIImage(named: "bala_ss")
        //imageview.contentMode = .scaleAspectFit
        //imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override var isHighlighted: Bool {
        didSet {
            menuIconsImageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuIconsImageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(menuIconsImageView)
        
        addConstrainsWithFormat(format: "H:[v0(28)]", views: menuIconsImageView)
        addConstrainsWithFormat(format: "V:[v0(28)]", views: menuIconsImageView)
        
        // CENTER X
        addConstraint(NSLayoutConstraint(item: menuIconsImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        // CENTER Y
        addConstraint(NSLayoutConstraint(item: menuIconsImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
}
