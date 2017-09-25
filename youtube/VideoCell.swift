//
//  VideoCell.swift
//  bufy
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var video: Video? { 
        didSet {
            titleLable.text = video?.title
//            thumbnailImageView.image =  UIImage(named: (video?.thumbnailImage)!)
            
            //if let profileImageName =  video?.channel?.profileImageName {
                //profileView.image = UIImage(named: (video?.channel?.profileImageName)!)
            //}
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
            
                let nf = NumberFormatter()
                nf.numberStyle = .decimal
                
                let subtitleText = "\(channelName) * \(nf.string(from: numberOfViews)!) * 2 years ago"
                descLable.text = subtitleText
            }
            
            if let title = video?.title {
                
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let estimatedRect = NSString(string: title).boundingRect(with: size,
                                                                         options: .usesLineFragmentOrigin,
                                                                         attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)],
                                                                         context: nil)
                if estimatedRect.size.height > 20 {
                    titleLableHeightConstrain?.constant = 44
                } else {
                    titleLableHeightConstrain?.constant = 20
                }
                
            }
            
         updateImageView()
         
        }
    }
    
    func updateImageView() {
        //thumbnailImageView.image =  UIImage(named: (video?.thumbnailImage)!)
        if let thumnailImageName = video?.thumbnailImage {
            //if (thumbnailImageView.image == nil ) {
                thumbnailImageView.setImageFromUrl(urlString: thumnailImageName)
            //}
        }
        if let profileImageName =  video?.channel?.profileImageName {
//            if (profileView.image == nil ) {
                profileView.setImageFromUrl(urlString: profileImageName)
            }
//
//        }
        
    }
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 */
    
    let thumbnailImageView : UIImageView  = {
        let imageview = UIImageView()
        //imageview.backgroundColor = UIColor.blue
        //imageview.image = UIImage(named: "bala_small")
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
        //imageView.image = UIImage(named: "bala_ss")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    
    let titleLable : UILabel = {
        let uilabel = UILabel()
        //uilabel.backgroundColor = UIColor.purple
        uilabel.text = "Taylor Swift - Blank Space"
        uilabel.numberOfLines = 2
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
    
    let videoTimeView: UILabel = {
//        let vtview = UIView()
//        vtview.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//        vtview.translatesAutoresizingMaskIntoConstraints = false
//        
        let labelview = UILabel()
        labelview.text = "0:15"
        labelview.textAlignment = .center
        labelview.textColor = UIColor.white
        labelview.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        labelview.translatesAutoresizingMaskIntoConstraints = false
        //labelview.addConstrainsWithFormat(format: "H:[v0]", views: labelview)
        //labelview.addConstrainsWithFormat(format: "V:[v0]", views: labelview)
        
//        vtview.addSubview(labelview)
        
        labelview.addConstrainsWithFormat(format: "H:[v0(44)]", views: labelview)
        labelview.addConstrainsWithFormat(format: "V:[v0(24)]", views: labelview)
        
        return labelview
    }()
    
    var titleLableHeightConstrain : NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(profileView)
        addSubview(titleLable)
        addSubview(descLable)
        addSubview(seperatorView)
        addSubview(videoTimeView)
        
        
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        //Horizontal Constrains
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: profileView)
        
        // Vertical Constrains
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView, profileView, seperatorView)
        
        addConstrainsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
        
        // Top Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        //Left Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .left, relatedBy: .equal, toItem: profileView, attribute: .right, multiplier: 1, constant: 8 ))
        
        //Right Constrains
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height Constrains
        
        titleLableHeightConstrain = NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        
        addConstraint(titleLableHeightConstrain!)
        
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
        
        
        // Constrains for Video Length Text
        //Right Constrains
        addConstraint(NSLayoutConstraint(item: videoTimeView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: -8))
        //Bottom Constrains
        addConstraint(NSLayoutConstraint(item: videoTimeView, attribute: .bottom, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: -8))
        
        
    }
    
    
}
