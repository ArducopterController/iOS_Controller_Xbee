//
//  ViewController.h
//  Arducopter_Controller
//
//  Created by Taiki Suzuki on 2013/10/21.
//  Copyright (c) 2013年 Taiki Suzuki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "RoundRectButton.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UILabel *pitchLabel;
@property (weak, nonatomic) IBOutlet UILabel *throttleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yawLabel;
@property (weak, nonatomic) IBOutlet UILabel *rollLabel;
@property (weak, nonatomic) IBOutlet UIView *rightSquare;
@property (weak, nonatomic) IBOutlet UIView *leftSquare;

@property (weak, nonatomic) IBOutlet RoundRectButton *acceBtn;

@end
