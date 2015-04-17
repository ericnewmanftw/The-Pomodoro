//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Eric Newman on 4/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *SecondTickNotification = @"secondTickNotification";
static NSString *RoundsCompleteNotification = @"roundCompleteNotification";
static NSString *NewRoundNotification = @"newRoundNotification";


@interface Timer : NSObject

@property (assign, nonatomic) NSInteger minutes;
@property (assign, nonatomic) NSInteger seconds;

+ (Timer *)sharedInstance;

-(void)startTimer;
-(void)cancelTimer;



@end
