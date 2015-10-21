//
//  Question.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import UIKit

class Question: NSObject {
    var date: NSDate
    var title: String?
    var score: Int?
    var answerSet: NSMutableArray = NSMutableArray()
    var answers: NSArray {
        get {
            self.answerSet.sortUsingSelector(Selector("compare:"))
            return answerSet
        }
    }
    
    override init() {
        date = NSDate()
        super.init()
    }
    
    func addAnswer(answer: Answer) {
        self.answerSet.addObject(answer)
    }
}
