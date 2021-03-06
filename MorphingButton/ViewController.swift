//
//  ViewController.swift
//  MorphingButton
//
//  Created by Duncan Champney on 6/6/15.
//  Copyright (c) 2015 Duncan Champney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //Outlets
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var buttonWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak var buttonPressedLabel: UILabel!
  
  //
  var animationDuration = 0.5

  var oldHeight: CGFloat!
  var buttonIsRound = false
  
  //-------------------------------------------------------------------------------------------------------
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    oldHeight = buttonHeightConstraint.constant
  }
  
  //-------------------------------------------------------------------------------------------------------
  // MARK: - IBAction Methods
  //-------------------------------------------------------------------------------------------------------
  
  @IBAction func handleButton(sender: AnyObject)
  {
    if !buttonIsRound
    {
      UIView.animateWithDuration(animationDuration)
        {
          self.buttonHeightConstraint.constant = self.buttonWidthConstraint.constant
          self.button.layoutIfNeeded()
          self.buttonIsRound = true
      }
      let cornerAnimation = CABasicAnimation(keyPath: "cornerRadius")
      cornerAnimation.fromValue = button.layer.cornerRadius
      cornerAnimation.toValue = self.buttonWidthConstraint.constant / 2.0
      cornerAnimation.duration = animationDuration
      button.layer.addAnimation(cornerAnimation, forKey: "woof")
      button.layer.cornerRadius = self.buttonWidthConstraint.constant / 2.0
      button.frame.size.height += 10
    }
    else
    {
      UIView.animateWithDuration(animationDuration)
        {
          self.buttonHeightConstraint.constant = self.oldHeight
          self.button.layoutIfNeeded()
          self.buttonIsRound = false
      }
      let cornerAnimation = CABasicAnimation(keyPath: "cornerRadius")
      cornerAnimation.fromValue = self.buttonWidthConstraint.constant / 2.0
      cornerAnimation.toValue = 10
      cornerAnimation.duration = animationDuration
      button.layer.addAnimation(cornerAnimation, forKey: "woof")
      button.layer.cornerRadius = 10
    }
  }
  //-------------------------------------------------------------------------------------------------------
  
  @IBAction func showLabel(sender: AnyObject)
  {
    buttonPressedLabel.hidden = false
  }
  
  @IBAction func hideLabel(sender: AnyObject)
  {
    buttonPressedLabel.hidden = true
  }
  
}

