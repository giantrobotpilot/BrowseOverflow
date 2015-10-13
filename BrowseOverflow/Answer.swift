//
//  Answer.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import UIKit

class Answer: NSObject, Comparable {
    var text: String = ""
    var score = 0
    var person = Person(name: "", avatarLocation: "")
    var accepted = false
}

func <=(lhs: Answer, rhs: Answer) -> Bool {
    return lhs.score <= rhs.score
}

func >(lhs: Answer, rhs: Answer) -> Bool {
    return lhs.score > rhs.score
}

func >=(lhs: Answer, rhs: Answer) -> Bool {
    return lhs.score >= rhs.score
}

func <(lhs: Answer, rhs: Answer) -> Bool {
    return lhs.score < rhs.score
}