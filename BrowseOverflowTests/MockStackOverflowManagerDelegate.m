//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@interface MockStackOverflowManagerDelegate ()

@end

@implementation MockStackOverflowManagerDelegate

- (void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error
{
    self.fetchError = error;
}

@end
