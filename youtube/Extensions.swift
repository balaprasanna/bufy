//
//  Extensions.swift
//  bufy
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func setImageFromUrl(urlString: String) {
        self.image = nil
        
        let data = imageCache.object(forKey: NSString(string: urlString))
        if data != nil {
            self.image = data
            return
        }
        
        let url = URL(string: urlString)
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { (Data, URLResponse, Error) in
                if Error != nil {
                    print(Error!)
                    return
                }
                if let data = Data {
                    DispatchQueue.main.async {
                        let imageData = UIImage(data: data)
                        
                        imageCache.setObject(imageData!, forKey: NSString(string: urlString))
                        
                        self.image = imageData
                    }
                }
            }
            task.resume()
        }
        
    }
}

