//
//  NotifiCenter.m
//  SimpleNotifiCeneter
//
//  Created by LPanda on 14-9-28.
//  Copyright (c) 2014年 LPanda. All rights reserved.
//

#import "NotifiCenter.h"

#import <objc/message.h>

@implementation NotifiCenter

-(id)init{
    if (self= [super init]) {
        observers = [[NSMutableDictionary alloc]init];
    }
    return self;
}

+(NotifiCenter *)getInstance{
    static NotifiCenter *notifiCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!notifiCenter) {
            notifiCenter = [[NotifiCenter alloc]init];
        }
    });
    
    return notifiCenter;
}

-(void)postNotifiWithName:(NSString *)name{
    [self postNotifiWithName:name Argument:nil];
}

-(void)postNotifiWithName:(NSString *)name Argument:(id)argu{
    NSMutableArray *curObservers = [observers objectForKey:name];
    NotifiObject *notifiObj = [[NotifiObject alloc]init];
    notifiObj.object = argu;
    
    for (NSDictionary *observerInfo in curObservers) {
        SEL func = NSSelectorFromString([[observerInfo allKeys]firstObject]);
        id observer = [[observerInfo allValues]firstObject];
        objc_msgSend(observer, func,notifiObj);
    }
}

-(void)registerObserver:(id)aObserver Name:(NSString *)name Selector:(SEL)selector{
    NSMutableArray *curObservers = [observers objectForKey:name];
    
    if (!curObservers) {
        curObservers = [[NSMutableArray alloc]init];
    }
    
    NSString *selName = NSStringFromSelector(selector);
    
    for (int i = 0; i != [curObservers count]; ++ i) {
        NSDictionary *observerInfo = curObservers[i];
        if ([[observerInfo allValues]firstObject] == aObserver) {
            return;
        }
    }
    
    NSDictionary *observerInfo = @{selName: aObserver};
    
    [curObservers addObject:observerInfo];
    [observers setObject:curObservers forKey:name];
}

@end
