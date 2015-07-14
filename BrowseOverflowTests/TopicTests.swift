//
//  TopicTests.swift
//  BrowseOverflow
//
//  Created by Drew Christensen on 7/13/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import XCTest

class TopicTests: XCTestCase {
    
    // MARK: lifecycle
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatTopicExists() {
        let newTopic = Topic(name: "iPhone", tag: "iphone")
        XCTAssertNotNil(newTopic)
    }
    
    // MARK: Topic properties
    
    func testThatTopicCanBeNamed() {
        let newTopic = Topic(name: "iPhone", tag: "iphone")
        XCTAssertEqual(newTopic.name, "iPhone")
    }
    
    func testThatTopicHasATag() {
        let newTopic = Topic(name: "iPhone", tag: "iphone")
        XCTAssertEqual(newTopic.tag, "iphone")
    }
}
