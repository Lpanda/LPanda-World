//
//  NotifiCenter.h
//  SimpleNotifiCeneter
//
//  Created by LPanda on 14-9-28.
//  Copyright (c) 2014年 LPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotifiObject.h"

@interface NotifiCenter : NSObject{
    NSMutableDictionary *observers;
}

+(NotifiCenter *)getInstance;

-(void)postNotifiWithName:(NSString *)name;

-(void)postNotifiWithName:(NSString *)name Argument:(id)argu;

-(void)registerObserver:(id)aObserver Name:(NSString *)name Selector:(SEL)selector;
@end
