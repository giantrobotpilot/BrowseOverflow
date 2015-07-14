//
//  QuestionTests.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import XCTest

class QuestionTests: XCTestCase {
    
    let question = Question()
    
    override func setUp() {
        super.setUp()
        question.date = NSDate.distantPast()
        question.title = "Do iPhones also dream of electric sheep?"
        question.score = 42
    }
    
    func testQuestionHasADate() {
        let testDate = NSDate.distantPast()
        question.date = testDate
        XCTAssertEqual(question.date, testDate)
    }
    
    func testQuestionsKeepScore() {
        if let qScore = question.score {
            XCTAssertEqual(qScore, 42)
        }
        else {
            XCTFail("score should not be nil")
        }
    }
    
    func testQuestionHasATitle() {
        if let qTitle = question.title {
            XCTAssertEqual(qTitle, "Do iPhones also dream of electric sheep?")
        }
        else {
            XCTFail("title should not be nil")
        }
    }
}