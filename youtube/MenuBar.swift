//
//  MenuBar.swift
//  youtube
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 30, blue: 31)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let menuItemsImageNames = ["home", "trending", "subscriptions",  "account"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        //cell.backgroundColor = UIColor.white
        
        cell.menuIconsImageView.image = UIImage(named: menuItemsImageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.menuIconsImageView.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/4, height: 50)
    }
    
    
    let cellId = "cellid"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.blue
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrainsWithFormat(format: "V:|[v0]|", views: collectionView)
    
        //[ Didnt Work. So doing this after ViewDidAppear ]
        //let indexPath = self.collectionView.indexPathsForSelectedItems?.last ?? IndexPath(item: 0, section: 0)
        //self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
