//
//  DeliveryStop.h
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/17/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeliveryStop : NSObject

@property (nonatomic, strong) NSNumber* numberOfPackages;
@property (nonatomic, strong) NSNumber* weight;
@property (nonatomic) BOOL signatureRequired;
@property (nonatomic, strong) NSString* recipientName;
@property (nonatomic, strong) NSNumber* buildingNumber;
@property (nonatomic, strong) NSString* streetName;
@property (nonatomic, strong) NSString* additionalAddressInfo;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSNumber* zipCode;
@property (nonatomic, strong) NSNumber* zipSpecificLocation;
@property (nonatomic, strong) NSNumber* routeNumber;

@property (nonatomic, strong) NSString* completeAddress;


@end
