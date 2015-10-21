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
    let lowScore = Answer()
    let highScore = Answer()
    
    override func setUp() {
        super.setUp()
        question.date = NSDate.distantPast()
        question.title = "Do iPhones also dream of electric sheep?"
        question.score = 42
        
        let accepted = Answer()
        accepted.score = 1
        accepted.accepted = true
        question.addAnswer(accepted)
        
        lowScore.score = -4
        question.addAnswer(lowScore)
        
        highScore.score = 4
        question.addAnswer(highScore)
    }
    
    // MARK: - Question
    
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
    
    //MARK: - Adding answers
    
    func testQuestionCanHaveAnswersAdded() {
        
    }
    
    func testAcceptedAnswerIsFirst() {
        XCTAssertTrue(question.answers[0].accepted == true)
    }
    
    func testHighScoreAnswerBeforeLow() {
        let answers: NSArray = question.answers
        let highIndex = answers.indexOfObject(highScore)
        let lowIndex = answers.indexOfObject(lowScore)
        XCTAssertTrue(highIndex < lowIndex)
    }
}