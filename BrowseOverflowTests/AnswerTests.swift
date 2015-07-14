//
//  AnswerTests.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import XCTest

class AnswerTests: XCTestCase {
    
    var answer = Answer()
    
    // MARK: lifecycle
    
    override func setUp() {
        answer.text = "The answer is 42."
        answer.person = Person(name: "Graham Lee", avatarLocation: "http://example.com/avatar.png")
        answer.score = 42
    }
    
    // MARK: properties
    
    func testAnswerHasSomeText() {
        XCTAssertEqual(answer.text, "The answer is 42.")
    }
    
    func testSomeProvidedTheAnswer() {
        XCTAssertTrue(answer.person.isKindOfClass(Person))
    }
    
    func testAnswersNotAcceptedByDefault() {
        XCTAssertFalse(answer.accepted)
    }
    
    func testAnswersCanBeAccepted() {
        answer.accepted = true
        XCTAssertTrue(answer.accepted)
    }
    
    func testAnswerHasAScore() {
        XCTAssertEqual(answer.score, 42)
    }
}
