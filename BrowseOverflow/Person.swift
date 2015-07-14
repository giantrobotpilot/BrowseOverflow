//
//  Person.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var avatarURL: NSURL?
    
    init(name: String, avatarLocation: String) {
        self.name = name
        self.avatarURL = NSURL(string: avatarLocation)
        super.init()
    }

}
