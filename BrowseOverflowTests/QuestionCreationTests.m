//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BrowseOverflow-Swift.h"
#import "MockStackOverflowCommunicator.h"
#import "MockStackOverflowManagerDelegate.h"
#import "StackOverflowManager.h"

@interface QuestionCreationTests : XCTestCase

@property (strong, nonatomic) StackOverflowManager *mgr;

@end

@implementation QuestionCreationTests

- (void)setUp {
    [super setUp];
    self.mgr = [[StackOverflowManager alloc] init];
}

- (void)tearDown {
    self.mgr = nil;
    [super tearDown];
}

- (void)testNonConformingObjectCannotBeDelegate {
    XCTAssertThrows(self.mgr.delegate = (id<StackOverflowManagerDelegate>)[NSNull null]);
}

- (void)testConformingObjectCanBeDelegate {
    id<StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    XCTAssertNoThrow(self.mgr.delegate = delegate);
}

- (void)testManagerAcceptsNilAsDelegate {
    XCTAssertNoThrow(self.mgr.delegate = nil);
}

- (void)testAskingForQuestionsMeansRequestingData {
    MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc] init];
    self.mgr.communicator = communicator;
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    [self.mgr fetchQuestionsOnTopic:topic];
    XCTAssertTrue([communicator wasAskedToFetchQuestions]);
}

@end