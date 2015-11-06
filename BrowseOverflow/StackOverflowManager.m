//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import "StackOverflowManager.h"

#import "StackOverflowCommunicator.h"
#import "BrowseOverflow-Swift.h"

@implementation StackOverflowManager

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate
{
    if (newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException
                                 reason:@"Delegate object does not conform to the delegate protocol"
                               userInfo:nil]
         raise];
    }
    _delegate = newDelegate;
}

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    [self.communicator searchForQuestionsWithTag:[topic tag]];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    NSDictionary *errorInfo = @{ NSUnderlyingErrorKey : error };
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    [self.delegate fetchingQuestionsOnTopic:nil
                            failedWithError:reportableError];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";