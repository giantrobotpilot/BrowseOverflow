//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@interface MockStackOverflowCommunicator ()

@property (assign, nonatomic) BOOL wasAskedToFetchQuestions;

@end

@implementation MockStackOverflowCommunicator

- (void)searchForQuestionsWithTag:(NSString *)tag {
    self.wasAskedToFetchQuestions = YES;
}

@end
