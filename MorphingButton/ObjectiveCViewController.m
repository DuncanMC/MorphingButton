//
//  ObjectiveCViewController.m
//  MorphingButton
//
//  Created by Duncan Champney on 6/8/15.
//  Copyright (c) 2015 Duncan Champney. All rights reserved.
//

#import "ObjectiveCViewController.h"

@implementation ObjectiveCViewController

- (void)viewDidLoad
{
  oldHeight = buttonHeightConstraint.constant;
  buttonIsRound = FALSE;
  [super viewDidLoad];
  animationDuration = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (IBAction)handleButton:(id)sender
{
  NSLog(@"Entering %s", __PRETTY_FUNCTION__);
  if (!buttonIsRound)
  {
    [UIView animateWithDuration:  animationDuration
     animations:^
     {
       buttonHeightConstraint.constant = buttonWidthConstraint.constant;
       [button layoutIfNeeded];
       buttonIsRound = true;
       
       CABasicAnimation *cornerAnimation = [[CABasicAnimation alloc] init];
       cornerAnimation.keyPath = @"cornerRadius";
       cornerAnimation.fromValue = @(button.layer.cornerRadius);
       cornerAnimation.toValue = @(buttonWidthConstraint.constant / 2.0);
       cornerAnimation.duration = animationDuration;
       [button.layer addAnimation: cornerAnimation forKey: @"woof"];
       button.layer.cornerRadius = buttonWidthConstraint.constant / 2.0;
     }
     ];
  }
  else
  {
    [UIView animateWithDuration:  animationDuration
                     animations:^
     {
       buttonHeightConstraint.constant = oldHeight;
       [button layoutIfNeeded];
       buttonIsRound = FALSE;
       
       CABasicAnimation *cornerAnimation = [[CABasicAnimation alloc] init];
       cornerAnimation.keyPath = @"cornerRadius";
       cornerAnimation.fromValue = @(button.layer.cornerRadius);
       cornerAnimation.toValue = @(10);
       cornerAnimation.duration = animationDuration;
       [button.layer addAnimation: cornerAnimation forKey: @"woof"];
       button.layer.cornerRadius = 10;
     }
     ];

  }
}

@end
