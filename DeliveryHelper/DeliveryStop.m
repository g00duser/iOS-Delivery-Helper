//
//  DeliveryStop.m
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/17/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import "DeliveryStop.h"

@implementation DeliveryStop

- (void)initWithRouteNumber:(NSNumber*)routeN
           numberOfPackages:(NSNumber*)np
                     weight:(NSNumber*)w
          signatureRequired:(BOOL)sr
              recipientName:(NSString*)rn
               streetNumber:(NSString*)snum
                 streetName:(NSString*)sn
      additionalAddressInfo:(NSString*)aai
                       city:(NSString*)c
                    zipCode:(NSString*)z
{
    _routeNumber = routeN;
    _numberOfPackages = np;
    _weight = w;
    _signatureRequired = sr;
    _recipientName = rn;
    _streetNumber = snum;
    _streetName = sn;
    _additionalAddressInfo = aai;
    _city = c;
    _zipCode = z;
    
    _completeAddress = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                        _streetNumber,
                        _streetName,
                        _additionalAddressInfo,
                        _city,
                        _zipCode];
}

@end
