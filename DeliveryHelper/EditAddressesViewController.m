//
//  EditAddressesViewController.m
//  DeliveryHelper
//
//  Created by Pavlo Bilous on 11/14/14.
//  Copyright (c) 2014 EWU. All rights reserved.
//

#import "EditAddressesViewController.h"
#import "DeliveryStop.h"
#import "RouteData.h"

@interface EditAddressesViewController ()

@end

@implementation EditAddressesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _saveButton.hidden = YES;
	[self setUpKeyboardNotificationHandlers];
    
}

- (void)setUpKeyboardNotificationHandlers {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillShow:)
                   name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:)
                   name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    /*
     Reduce the size of the text view so
     that it's not obscured by the keyboard.
     Animate the resize so that it's in sync
     with the appearance of the keyboard.
     */
    
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    // Get the top of the keyboard as the y
    // coordinate of its origin in self's view's
    // coordinate system. The bottom of the text
    // view's frame should align with the top
    // of the keyboard's final position.
    //
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    // Text area size
    _oldTextViewSize = _addressesTextView.frame;
    CGFloat keyboardTop = keyboardRect.origin.y;
    CGRect newTextViewFrame = self.view.bounds;
    newTextViewFrame.size.height = keyboardTop - self.view.bounds.origin.y - 40;
    newTextViewFrame.origin.y = 20;
    _addressesTextView.frame = newTextViewFrame;
    
    // Save button
    CGRect newSaveButtonRect = _saveButton.frame;
    newSaveButtonRect.size.height = 20;
    newSaveButtonRect.size.width = 40;
    newSaveButtonRect.origin.y = newTextViewFrame.size.height + 20;
    newSaveButtonRect.origin.x = self.view.bounds.size.width/2 - _saveButton.frame.size.width/2;
    _saveButton.frame = newSaveButtonRect;
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:
                                       UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    // Animate the resize of the text view's
    // frame in sync with the keyboard's appearance.
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView commitAnimations];
    
    _saveButton.hidden = NO;
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    /*
     Restore the size of the text view.
     Animate the resize so that it's in sync with the
     disappearance of the keyboard.
     */
    
    self.addressesTextView.frame = _oldTextViewSize;
    
    NSDictionary *userInfo = [notification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:
                                       UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView commitAnimations];
    
    _saveButton.hidden = YES;
}

-(IBAction)dismissKeyboard:(id)sender
{
    NSLog(@"Dismiss keyboard called");
    [self.addressesTextView resignFirstResponder];
}

- (IBAction)calculateRoute:(id)sender {
    NSString* routeText = _addressesTextView.text;
    
    NSArray* routeStops = [routeText componentsSeparatedByString:@"\n"];
    NSMutableArray* arrayOfDeliveryStopsObjects = [[NSMutableArray alloc] init];
    RouteData* data = [RouteData getSingelton];
    
    for (int i = 0; i < routeStops.count; i++)
    {
        NSArray* stopDetails = [routeStops[i] componentsSeparatedByString:@"~"];
        
        NSNumber* routeNumber = stopDetails[9];
        NSNumber* numberOfPackages = stopDetails[0];
        NSNumber* weight = stopDetails[1];
        BOOL sigReq = NO;
        if ([stopDetails[2] isEqualToString:@"S"])
            sigReq = YES;
        NSString* name = stopDetails[3];
        NSString* streetNum = stopDetails[4];
        NSString* streetName = stopDetails[5];
        NSString* streetAdditional = stopDetails[6];
        NSString* city = stopDetails[7];
        NSString* zip = stopDetails[8];
        
        DeliveryStop* ds = [[DeliveryStop alloc] init];
        [ds initWithRouteNumber:routeNumber numberOfPackages:numberOfPackages weight:weight signatureRequired:sigReq recipientName:name streetNumber:streetNum streetName:streetName additionalAddressInfo:streetAdditional city:city zipCode:zip];
        
        [arrayOfDeliveryStopsObjects addObject:ds];
    }
    
    data.stopsList = arrayOfDeliveryStopsObjects;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
