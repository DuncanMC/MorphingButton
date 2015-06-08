//
//  ObjectiveCViewController.m
//  MorphingButton
//
//  Created by Duncan Champney on 6/8/15.
//  Copyright (c) 2015 Duncan Champney. All rights reserved.
//

#import "ObjectiveCViewController.h"

@implementation ObjectiveCViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
  oldHeight = buttonHeightConstraint.constant;
  buttonIsRound = FALSE;
  [super viewDidLoad];
  animationDuration = 0.5;
}

- (IBAction)handleButton:(id)sender
{
  CGFloat newHeight;
  CGFloat newCornerRadius;
  NSLog(@"Entering %s", __PRETTY_FUNCTION__);
  
  if (buttonIsRound)
  {
    //If the button is currently round,
    //go back to the old height/corner radius
    newHeight = oldHeight;
    newCornerRadius = 10;
  }
  else
  {
    //It isn't round now,
    //so make it's height and widht the same
    //and set the corner radius to 1/2 the width
    newHeight = buttonWidthConstraint.constant;
    newCornerRadius = buttonWidthConstraint.constant/2;
  }
  
  [UIView animateWithDuration:  animationDuration
                   animations:^
   {
     buttonHeightConstraint.constant = newHeight;
     [button layoutIfNeeded];
   }];
  CABasicAnimation *cornerAnimation = [[CABasicAnimation alloc] init];
  cornerAnimation.keyPath = @"cornerRadius";
  cornerAnimation.fromValue = @(button.layer.cornerRadius);
  cornerAnimation.toValue = @(newCornerRadius);
  cornerAnimation.duration = animationDuration;
  [button.layer addAnimation: cornerAnimation forKey: @"woof"];
  button.layer.cornerRadius = newCornerRadius;
  buttonIsRound = !buttonIsRound;
}

@end
