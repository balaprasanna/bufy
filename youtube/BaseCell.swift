//
//  BaseCell.swift
//  youtube
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

// Base class for all our UICollectionViewCell
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}

