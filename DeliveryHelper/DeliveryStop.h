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
@property (nonatomic, strong) NSString* streetNumber;
@property (nonatomic, strong) NSString* streetName;
@property (nonatomic, strong) NSString* additionalAddressInfo;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* zipCode;
@property (nonatomic, strong) NSNumber* routeNumber;

@property (nonatomic, strong) NSString* completeAddress;

- (void)initWithRouteNumber:(NSNumber*)routeN
           numberOfPackages:(NSNumber*)np
                     weight:(NSNumber*)w
          signatureRequired:(BOOL)sr
              recipientName:(NSString*)rn
               streetNumber:(NSString*)snum
                 streetName:(NSString*)sn
      additionalAddressInfo:(NSString*)aai
                       city:(NSString*)c
                    zipCode:(NSString*)z;


@end
