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
    
    func compare(answer: Answer) -> NSComparisonResult {
        if self.accepted && !answer.accepted {
            return .OrderedAscending
        }
        else if !self.accepted && answer.accepted {
            return .OrderedDescending
        }
        if score > answer.score {
            return .OrderedAscending
        }
        else if score < answer.score {
            return .OrderedDescending
        }
        else {
            return .OrderedSame
        }
    }
}

func <=(lhs: Answer, rhs: Answer) -> Bool {
    if lhs.accepted && !rhs.accepted {
        return false
    }
    else if !lhs.accepted && rhs.accepted {
        return true
    }
    else {
        return lhs.score <= rhs.score
    }
}

// MARK: - Comparable

func >(lhs: Answer, rhs: Answer) -> Bool {
    if lhs.accepted && !rhs.accepted {
        return true
    }
    else if !lhs.accepted && rhs.accepted {
        return false
    }
    else {
        return lhs.score > rhs.score
    }
}

func >=(lhs: Answer, rhs: Answer) -> Bool {
    if lhs.accepted && !rhs.accepted {
        return true
    }
    else if !lhs.accepted && rhs.accepted {
        return false
    }
    else {
        return lhs.score >= rhs.score
    }
}

func <(lhs: Answer, rhs: Answer) -> Bool {
    if lhs.accepted && !rhs.accepted {
        return false
    }
    else if !lhs.accepted && rhs.accepted {
        return true
    }
    else {
        return lhs.score < rhs.score
    }
}
