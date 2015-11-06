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

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
    MockStackOverflowManagerDelegate *delegate = [[MockStackOverflowManagerDelegate alloc] init];
    self.mgr.delegate = delegate;
    NSError *underlyingError = [NSError errorWithDomain:@"Test domain"
                                                   code:0
                                               userInfo:nil];
    [self.mgr searchingForQuestionsFailedWithError:underlyingError];
    XCTAssertFalse(underlyingError == [delegate fetchError], @"Error should return the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError {
    MockStackOverflowManagerDelegate *delegate = [[MockStackOverflowManagerDelegate alloc] init];
    self.mgr.delegate = delegate;
    NSError *underlyingError = [NSError errorWithDomain:@"Test domain"
                                                   code:0
                                               userInfo:nil];
    [self.mgr searchingForQuestionsFailedWithError:underlyingError];
    NSError *fetchedError = [[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey
    XCTAssertEqualObjects(fetchedError, underlyingError, @"The underlying error should be available to client code");
}

@end