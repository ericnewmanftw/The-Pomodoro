//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Eric Newman on 4/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"

@interface Timer()

@property (assign, nonatomic) BOOL isOn;

@end


@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
        
        //code for testing Timer
        // sharedInstance.minutes = 5;
        // sharedInstance.seconds = 10;
        
    });
    
    return sharedInstance;
}

-(void)startTimer {
    self.isOn = YES;
    [self checkActive];
}

-(void)endTimer {
    self.isOn = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:RoundsCompleteNotification object:nil];
}

-(void)decreaseSecond
{
    if (self.seconds > 0)
    {
        self.seconds--;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    }
    else if (self.seconds == 0 && self.minutes > 0)
    {
        self.minutes--;
        self.seconds = 59;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    }
    else
    {
        [self endTimer];
    }
}

-(void)checkActive {
    if (self.isOn) {
        [self decreaseSecond];
        [self performSelector:@selector(checkActive) withObject:nil afterDelay:1.0];
    }
}

-(void)cancelTimer {
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

@end
