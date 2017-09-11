//
//  HomeController.swift
//  youtube
//
//  Created by std-user01 on 9/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var videos : [Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "BalaIsCoolWithPython"
        kanyeChannel.profileImageName = "bala_ss"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.thumbnailImage = "bala_small"
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.channel = kanyeChannel
        
        blankSpaceVideo.numberOfViews = 2345678900
        
        var badBloodVideo = Video()
        badBloodVideo.thumbnailImage = "bala_small"
        badBloodVideo.title = "Taylor Swift - Bad blood Extra Extra Extra Extra"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 2345678900
        return [blankSpaceVideo, badBloodVideo]
    }()
    
    // This is to select the First Icon on the CollectionView inside Menubar
    override func viewDidAppear(_ animated: Bool) {
        
        let indexPath = IndexPath(item: 0, section: 0)
        
        self.menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Home"
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor.white

        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        
        //To Setup A Custom Inset for CollectionView : So that it fits nicely beloew the menubar
        let cvInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.contentInset = cvInsets
        collectionView?.scrollIndicatorInsets = cvInsets
        setupMenuBar()
        setupNavBarButtons()
        
    }
    
    func setupNavBarButtons() {
        let searchImage =  UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem =  UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage =  UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem =  UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    func handleSearch(){
        print ("Search")
    }
    
    func handleMore(){
        print ("More")
    }
    
    let menuBar : MenuBar = {
       let mb = MenuBar()
        // [PLEASE PAY ATTENTION TO THIS. SAVES TIME. ELSE AUTO CONSTRAINS WON'T WORK]
        mb.translatesAutoresizingMaskIntoConstraints=false
        mb.backgroundColor =  UIColor.rgb(red: 230, green: 30, blue: 31)
        return mb
    }()

    private func addConstrainsToMenuBarHelper() {
        //Left Constrains
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        
        //Right Constrains
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0))
        
        //Top Constrains
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0))
        
        //Height Constrains
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .height,relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 0, constant: 50))
    
        /* Simple version
         view.addConstrainsWithFormat(format: "H:|[v0]|", views: menuBar)
         view.addConstrainsWithFormat(format: "V:|[v0(50)]", views: menuBar)
         */
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        addConstrainsToMenuBarHelper()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        //cell.video?.title
        
        //cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Compute the height in 16/9 = 1.777 Ratio
        //let height = view.frame.width / 1.777
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

