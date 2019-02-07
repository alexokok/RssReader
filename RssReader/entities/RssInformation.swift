//
//  RssInformation.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

class RssInformation {
    var title: String?
    
    var rssUrl: String?
    
    var imageUrl: String?
    
    init(title: String?, rssUrl: String? ) {
        self.title = title
        self.rssUrl = rssUrl
    }
}
