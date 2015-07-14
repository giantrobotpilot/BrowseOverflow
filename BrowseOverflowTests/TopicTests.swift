//
//  TopicTests.swift
//  BrowseOverflow
//
//  Created by Drew Christensen on 7/13/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import XCTest

class TopicTests: XCTestCase {
    
    var topic: Topic = Topic(name: "iPhone", tag: "iphone")
    
    // MARK: lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatTopicExists() {
        XCTAssertNotNil(topic)
    }
    
    // MARK: Topic properties
    
    func testThatTopicCanBeNamed() {
        let newTopic = Topic(name: "iPhone", tag: "iphone")
        XCTAssertEqual(newTopic.name, "iPhone")
        assert(newTopic.name == "iPhone")
    }
    
    func testThatTopicHasATag() {
        let newTopic = Topic(name: "iPhone", tag: "iphone")
        XCTAssertEqual(newTopic.tag, "iphone")
    }
    
    // MARK: Topic questions
    
    func testForInitiallyEmptyQuestionList() {
        XCTAssertEqual(topic.recentQuestions().count, 0)
    }
    
    func testAddingAQuestionToTheList() {
        let question = Question()
        topic.addQuestion(question)
        XCTAssertEqual(topic.recentQuestions().count, 1)
    }
    
    func testQuestionsAreListedChronologically() {
        let q1 = Question()
        q1.date = NSDate.distantPast()
        
        let q2 = Question()
        q2.date = NSDate.distantFuture()
        
        topic.addQuestion(q1)
        topic.addQuestion(q2)
        
        let questions = topic.recentQuestions()
        let listedFirst = questions[0]
        let listedSecond = questions[1]
        
        XCTAssertEqual(listedFirst.date.laterDate(listedSecond.date), listedFirst.date)
    }
    
    func testLimitOfTwentyQuestions() {
        let q1 = Question()
        for _ in 1...25 {
            topic.addQuestion(q1)
        }
        XCTAssertTrue(topic.recentQuestions().count < 21)
    }
}