//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Andrew Christensen on 11/5/15.
//  Copyright © 2015 Giant Robot Pilot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StackOverflowCommunicator;
@class Topic;

@protocol StackOverflowManagerDelegate <NSObject>

@end

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong, nonatomic) StackOverflowCommunicator *communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;

@end
