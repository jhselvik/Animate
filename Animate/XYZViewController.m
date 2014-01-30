//
//  XYZViewController.m
//  Animate
//
//  Created by Joe Selvik on 1/16/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()

@property float animationToggle;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _animationToggle = 1;
    
    CGRect frameRect = CGRectMake(0, 300, 320, 0);
    _boxView = [[UIView alloc] initWithFrame:frameRect];
    _boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_boxView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.animationToggle) {
        CGRect frameRect = CGRectMake(0, 300, 320, -45);
        
        [UIView animateWithDuration:0.5
                         animations:^() {
                             [self.boxView setFrame:frameRect];
                         }];
        self.animationToggle = 0;
    } else {
        CGRect frameRect = CGRectMake(0, 300, 320, 0);
        
        [UIView animateWithDuration:0.5
                         animations:^() {
                             [self.boxView setFrame:frameRect];
                         }];
        self.animationToggle = 1;
    }
    
    
}

@end
