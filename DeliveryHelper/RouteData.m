//
//  RouteData.m
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/17/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import "RouteData.h"

@implementation RouteData

+(RouteData*) getSingelton
{
    // static is a keyword here
    // static variables will only be created one time during program execution
    static RouteData *theClass = nil;
    
    if (!theClass) {
        theClass = [[super allocWithZone:nil] init];
    }
    
    return theClass;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [self getSingelton];
}

-(id)initWithStopsList:(NSArray*)sl
{
    NSLog(@"Initializes new singelton class");
    self = [super init];
    if (self) {
        // set ivars
        _stopsList = sl;
    }
    
    return self;
}

@end
