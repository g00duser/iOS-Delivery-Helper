//
//  RouteData.h
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/17/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouteData : NSObject

//Global variables
@property (nonatomic, strong) NSArray* stopsList;

+(RouteData*) getSingelton;

@end
