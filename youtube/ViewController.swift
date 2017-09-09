//
//  HomeController.swift
//  youtube
//
//  Created by std-user01 on 9/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.white

        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
        //cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}


class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let thumbnailImageView : UIImageView  = {
       let imageview = UIImageView()
        imageview.backgroundColor = UIColor.blue
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let seperatorView : UIView = {
       let uiview = UIView()
        uiview.backgroundColor = UIColor.black
        uiview.translatesAutoresizingMaskIntoConstraints = false
        //uiview.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return uiview
    }()
    
    
    let profileView : UIView = {
       let uiview = UIView()
        uiview.backgroundColor = UIColor.green
        uiview.translatesAutoresizingMaskIntoConstraints=false
        return uiview
    }()
    
    
    func setupViews() {
        addSubview(thumbnailImageView)
        //addSubview(profileView)
        addSubview(seperatorView)
        
        
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstrainsWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, seperatorView)
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView, "v1": seperatorView]))
        
        //thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        addConstrainsWithFormat(format: "H:|-16-[v0]|", views: seperatorView)
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": seperatorView]))
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": seperatorView]))
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileView]))
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileView]))
        //NSLayoutConstraint(item: profileView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: thumbnailImageView, attribute: NSLayoutAttribute, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
        //backgroundColor = UIColor.brown
    }
    
    
}

extension UIView {
    func addConstrainsWithFormat(format: String, views: UIView...) {
        
        var viewDictionary = [String:UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}



