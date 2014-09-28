
//
//  Infomer.m
//  PandaNotifi
//
//  Created by LPanda on 14-9-28.
//  Copyright (c) 2014年 LPanda. All rights reserved.
//

#import "Infomer.h"
#import "NotifiCenter.h"

@implementation Infomer

-(void)sendNotifi{
    [[NotifiCenter getInstance] postNotifiWithName:@"12"];
    [[NotifiCenter getInstance] postNotifiWithName:@"123" Argument:@"infomer say hello"];
}

@end
