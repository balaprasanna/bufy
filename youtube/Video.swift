//
//  Video.swift
//  youtube
//
//  Created by std-user01 on 10/9/17.
//  Copyright © 2017 std-user01. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImage :String?
    var title :String?
    var numberOfViews: NSNumber?
    var uploadedDate: NSDate?
    
    var channel: Channel?
}


class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
