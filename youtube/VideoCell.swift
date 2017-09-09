//
//  VideoCell.swift
//  youtube
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

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
        //imageview.backgroundColor = UIColor.blue
        imageview.image = UIImage(named: "bala_small")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let seperatorView : UIView = {
        let uiview = UIView()
        uiview.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        uiview.translatesAutoresizingMaskIntoConstraints = false
        //uiview.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return uiview
    }()
    
    
    let profileView : UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "bala_ss")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    
    let titleLable : UILabel = {
        let uilabel = UILabel()
        //uilabel.backgroundColor = UIColor.purple
        uilabel.text = "Taylor Swift - Blank Space"
        uilabel.translatesAutoresizingMaskIntoConstraints=false
        return uilabel
    }()
    
    let descLable : UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = UIColor.red
        textView.text = "TaylorswiftVEVO * 1,898,890,870 Views * two years ago"
        textView.textColor = UIColor.lightGray
        textView.contentInset = UIEdgeInsetsMake(-8, -4, 0, 0)
        textView.translatesAutoresizingMaskIntoConstraints=false
        return textView
    }()
    
    
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(profileView)
        addSubview(titleLable)
        addSubview(descLable)
        addSubview(seperatorView)
        
        
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        //Horizontal Constrains
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: profileView)
        
        // Vertical Constrains
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileView, seperatorView)
        
        addConstrainsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
        
        // Top Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        //Left Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .left, relatedBy: .equal, toItem: profileView, attribute: .right, multiplier: 1, constant: 8 ))
        
        //Right Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //addConstrainsWithFormat(format: "V:[v0(20)]", views: titleLable)
        //addConstrainsWithFormat(format: "H:|[v0]|", views: titleLable)
        
        
        //Left Constrains
        addConstraint(NSLayoutConstraint(item: descLable, attribute: .left, relatedBy: .equal, toItem: profileView, attribute: .right, multiplier: 1, constant: 8))
        
        //Right Constrains
        addConstraint(NSLayoutConstraint(item: descLable, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //Top Constrains
        addConstraint(NSLayoutConstraint(item: descLable, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1, constant: 4))
        
        //Bottom Constrains
        //addConstraint(NSLayoutConstraint(item: descLable, attribute: .bottom, relatedBy: .equal, toItem: seperatorView , attribute: .top, multiplier: 1, constant: 0))
        
        // Height Constrains
        addConstraint(NSLayoutConstraint(item: descLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        //addConstrainsWithFormat(format: "V:[v0(20)]", views: descLable)
        //addConstrainsWithFormat(format: "H:|-20-[v0]|", views: descLable)
        //backgroundColor = UIColor.brown
    }
    
    
}
