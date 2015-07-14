//
//  Topic.swift
//  BrowseOverflow
//
//  Created by Drew Christensen on 7/13/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import UIKit

class Topic: NSObject {
    var name: String
    var tag: String
    
    init(name: String, tag: String) {
        self.name = name;
        self.tag = tag
    }
}
