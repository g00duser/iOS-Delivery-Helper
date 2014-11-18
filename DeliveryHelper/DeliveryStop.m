//
//  DeliveryStop.m
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/17/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import "DeliveryStop.h"

@implementation DeliveryStop

- (void)initWithData:(NSNumber*)routeN
    numberOfPackages:(NSNumber*)np
              weight:(NSNumber*)w
   signatureRequired:(BOOL)sr
       recipientName:(NSString*)rn
      buildingNumber:(NSNumber*)bn
          streetName:(NSString*)sn
additionalAddressInfo:(NSString*)aai
                city:(NSString*)c
             zipCode:(NSNumber*)z
 zipSpecificLocation:(NSNumber*)zsp
{
    _routeNumber = routeN;
    _numberOfPackages = np;
    _weight = w;
    _signatureRequired = sr;
    _recipientName = rn;
    _buildingNumber = bn;
    _streetName = sn;
    _additionalAddressInfo = aai;
    _city = c;
    _zipCode = z;
    _zipSpecificLocation = zsp;
    
    _completeAddress = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                        _buildingNumber,
                        _streetName,
                        _additionalAddressInfo,
                        _city,
                        _zipCode];
}

@end
