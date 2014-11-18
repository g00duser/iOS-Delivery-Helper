//
//  EditAddressesViewController.h
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/14/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditAddressesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextView *addressesTextView;
@property (nonatomic) CGRect oldTextViewSize;

- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)calculateRoute:(id)sender;

@end
