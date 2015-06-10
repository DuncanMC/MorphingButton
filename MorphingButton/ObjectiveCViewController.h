//
//  ObjectiveCViewController.h
//  MorphingButton
//
//  Created by Duncan Champney on 6/8/15.
//  Copyright (c) 2015 Duncan Champney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectiveCViewController : UIViewController
{
  CGFloat oldHeight;
  BOOL buttonIsRound;
  
  //Outlets
  __weak IBOutlet UILabel *label;
  __weak IBOutlet NSLayoutConstraint *buttonHeightConstraint;
  __weak IBOutlet NSLayoutConstraint *buttonWidthConstraint;
  __weak IBOutlet UIButton *button;
  
  NSTimeInterval animationDuration;
}

//-------------------------------------------------------------------------------------------------------
#pragma mark - IBAction methods
//-------------------------------------------------------------------------------------------------------


- (IBAction)handleButton:(id)sender;

- (IBAction)hideLabel:(id)sender;

- (IBAction)showLabel:(id)sender;


@end
