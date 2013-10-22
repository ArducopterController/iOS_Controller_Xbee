//
//  RoundRectButton.m
//  Arducopter_Controller
//
//  Created by Taiki Suzuki on 2013/10/21.
//  Copyright (c) 2013年 Taiki Suzuki. All rights reserved.
//

#import "RoundRectButton.h"

@implementation RoundRectButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.backgroundColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 20.0f;
    }
    return self;
}

-(id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
	
    if (self) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.backgroundColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 20.0f;
    }
	
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
