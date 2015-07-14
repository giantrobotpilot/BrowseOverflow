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
    var questions: [Question]
    
    init(name: String, tag: String) {
        self.name = name;
        self.tag = tag
        questions = [Question]()
    }
    
    func addQuestion(question: Question) {
        questions.append(question)
        if questions.count > 20 {
            questions = [Question](questions[0..<20])
        }
    }
    
    func sortQuestionsLatestFirst(questionList: [Question]) -> [Question] {
        let sortedQuestions = (questionList as NSArray).sortedArrayUsingComparator {
            (obj1, obj2) -> NSComparisonResult in
            
            let q1 = obj1 as! Question
            let q2 = obj2 as! Question
            let result = q2.date.compare(q1.date)
            return result
        }
        return sortedQuestions as! [Question]
    }
    
    func recentQuestions() -> [Question] {
        return sortQuestionsLatestFirst(questions)
    }
}