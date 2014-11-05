//
//  main.m
//  SimpleNotifiCeneter
//
//  Created by LPanda on 14-9-28.
//  Copyright (c) 2014年 LPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Infomer.h"
#import "Observer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"-------Pro Begin-------");
        
        Observer *observer = [[Observer alloc]init];
        NSLog(@"%@",[observer description]);
        
        Infomer *infomer = [[Infomer alloc]init];
        [infomer sendNotifi];
        
    }
    return 0;
}

