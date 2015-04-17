//
//  RoundsController.h
//  The-Pomodoro-iOS8
//
//  Created by Eric Newman on 4/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoundsController : NSObject

@property (nonatomic, strong, readonly) NSArray *roundTimes;
@property (nonatomic, assign) NSInteger currentRound;


+(RoundsController *)sharedInstance;


@end
