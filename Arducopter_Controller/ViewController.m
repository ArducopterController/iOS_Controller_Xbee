//
//  ViewController.m
//  Arducopter_Controller
//
//  Created by Taiki Suzuki on 2013/10/21.
//  Copyright (c) 2013年 Taiki Suzuki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.throttleLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    self.pitchLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // You have to declair CMMotionManager *motionManager; somewhere else
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1f;
    
    NSOperationQueue *currentQueue = [NSOperationQueue currentQueue];
    
    [self.motionManager startAccelerometerUpdatesToQueue:currentQueue
                                        withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                            CMAcceleration acceleration = accelerometerData.acceleration;
                                            NSLog(@"%f, %f, %f", acceleration.x, acceleration.y, acceleration.z);
                                            
                                            self.acceBtn.center = CGPointMake((acceleration.y+1)*60, (acceleration.x+1)*60);
                                        }];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.motionManager stopAccelerometerUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onTouchUpInside:(UIButton *)btn
{
    btn.center = CGPointMake(btn.superview.frame.size.width/2, btn.superview.frame.size.height/2);
}

-(IBAction)onTouchDragInside:(UIButton *)btn withEvent:(UIEvent *)event{
    UITouch *touch=[[event touchesForView:btn] anyObject];
    
    CGPoint prevPos=[touch previousLocationInView:btn];
    CGPoint pos=[touch locationInView:btn];
    
    if ([[btn superview] isEqual:self.leftSquare]) {
        float dX=pos.x-prevPos.x;
        
        float x = btn.center.x+dX;
        if (x < 20 || 180 < x) {
            x = btn.center.x;
        }
        
        NSLog(@"left x:%f y:%f", x, btn.center.y);
        
        btn.center=CGPointMake(x, btn.center.y);
    }
    else if ([[btn superview] isEqual:self.rightSquare]) {
        float dY=pos.y-prevPos.y;
        
        float y = btn.center.y+dY;
        if (y < 20 || 180 < y) {
            y = btn.center.y;
        }
        
        NSLog(@"right x:%f y:%f", btn.center.x, y);
        
        btn.center=CGPointMake(btn.center.x, y);
    }
}

@end
