//
//  Observer.m
//  PandaNotifi
//
//  Created by LPanda on 14-9-28.
//  Copyright (c) 2014年 LPanda. All rights reserved.
//

#import "Observer.h"
#import "NotifiCenter.h"

@implementation Observer

-(id)init{
    
    if (self = [super init]) {
        [[NotifiCenter getInstance] registerObserver:self Name:@"12" Selector:@selector(notifiComing)];
        [[NotifiCenter getInstance] registerObserver:self Name:@"123" Selector:@selector(anotherNotifi:)];
    }
    
    return self;
}

-(void)notifiComing{
    NSLog(@"hahaha i get a notificenter");
}

- (void)anotherNotifi:(NotifiObject*)notifi{
    NSLog(@"%@",notifi.object);
}

@end
