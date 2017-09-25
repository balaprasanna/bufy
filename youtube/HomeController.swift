//
//  HomeController.swift
//  bufy
//
//  Created by std-user01 on 9/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //var videos: [Video]?
    
    var gifys: [Video]? = {
        var vs = [Video]()
        return vs
    }()
    
    var isPullingData: Bool?
    var offset = 0
    var limit = 25
    var trending_url: String?
    
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
        loadGify()
    }
    
    func loadGify() {
        let api_key = "826030dcd9cd46cd936145fab9db2897"
        //let base_url = "https://api.giphy.com/v1/"
        //let random_url = "https://api.giphy.com/v1/gifs/random?api_key=\(api_key)&tag=&rating=G&limit=25"
        //let query = "cat"
        //let search_url = "https://api.giphy.com/v1/gifs/search?api_key=\(api_key)&q=\(query)&limit=25&offset=0&rating=G&lang=en"
        trending_url = "https://api.giphy.com/v1/gifs/trending?api_key=\(api_key)&limit=\(limit)&rating=G&offset=\(offset)"
        let url =  URL(string: trending_url!)
        
        let task = URLSession.shared.dataTask(with: url!) { (Data, URLResponse, Error) in
            if Error != nil {
                print(Error!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                //print(json)
                let data_array = json["data"] as! [[String:AnyObject]]
                //self.gifys = [Video]()
                
//                if self.gifys! == nil {
//                    self.gifys = [Video]()
//                }
                
                for item in data_array {
                        let video = Video()
                        video.title = item["source"] as! String?
                        video.thumbnailImage = ( (item["images"] as! [String:AnyObject])["fixed_height"] as! [String:AnyObject] )["url"] as! String?
                    
                        let channel = Channel()
                        channel.name = "TESTIING..."
                        channel.profileImageName = ( (item["images"] as! [String:AnyObject])["480w_still"] as! [String:AnyObject] )["url"] as! String?
                    //"bala_ss"
                        video.channel = channel
                        video.numberOfViews = NSNumber(value: 4565434)
                        print(item)
                        self.gifys?.append(video)
                    
                    }
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
            // Reload data from UI
        }
        task.resume()
        
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
        mb.backgroundColor = UIColor.rgb(red: 75, green: 173, blue: 156)
            //UIColor.rgb(red: 230, green: 30, blue: 31)
        
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
        return gifys?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        
        cell.video = gifys?[indexPath.item]
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
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // getting the scroll offset
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        
        if (bottomEdge >= scrollView.contentSize.height)
        {
            // we are at the bottom
            print("Reaching the end ...")
            if let status = isPullingData {
                if status == true {
                    print ("Downloading...")
                } else {
                    print ("Please wait...Already downloading..")
                }
            }
        }
    }

}

