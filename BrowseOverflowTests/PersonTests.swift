//
//  PersonTests.swift
//  BrowseOverflow
//
//  Created by Andrew Christensen on 7/14/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

import XCTest

class PersonTests: XCTestCase {
    
    let person = Person(name: "Graham Lee", avatarLocation: "http://example.com/avatar.png")
    
    // MARK: lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Person properties
    
    func testThatPersonHasRightName() {
        XCTAssertEqual(person.name, "Graham Lee")
    }
    
    func testThatPersonHasAvatarURL() {
        if let url: NSURL = person.avatarURL {
            XCTAssertEqual(url.absoluteString, "http://example.com/avatar.png")
        }
        else {
            XCTFail("url should not ben nil")
        }
    }
    
}
