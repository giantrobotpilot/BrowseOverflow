//
//  StackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowCommunicator : NSObject

- (void)searchForQuestionsWithTag:(NSString *)tag;

@end
