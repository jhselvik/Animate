//
//  XYZViewController.m
//  Animate
//
//  Created by Joe Selvik on 1/16/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

const CGFloat TNTPickupDetailFieldToKeyboardMargin = 13.0;


@interface XYZViewController ()

@property float animationToggle;

@property (strong, nonatomic) UIView *boxView;
@property (strong, nonatomic) UIButton *closeButtonForPopupView;

@property (assign, nonatomic) CGRect frameRectForPopupViewShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewHide;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonShow;
@property (assign, nonatomic) CGRect frameRectForPopupViewCloseButtonHide;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _animationToggle = 1;
    
    _frameRectForPopupViewShow = CGRectMake(0, 300, 320, -45);
    _frameRectForPopupViewHide = CGRectMake(0, 300, 320, 0);
    _frameRectForPopupViewCloseButtonShow = CGRectMake(0, 0, 20, 20);
    _frameRectForPopupViewCloseButtonHide = CGRectMake(0, 0, 0, 20);
    
    // boxView
    _boxView = [[UIView alloc] initWithFrame:self.frameRectForPopupViewHide];
    _boxView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:205.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    // closeButton
    _closeButtonForPopupView = [UIButton buttonWithType:UIButtonTypeSystem];
    [_closeButtonForPopupView addTarget:self
                                action:@selector(closePopupView)
                      forControlEvents:UIControlEventTouchUpInside];
    [_closeButtonForPopupView setTitle:@"X" forState:UIControlStateNormal];
    _closeButtonForPopupView.frame = self.frameRectForPopupViewCloseButtonHide;
    
    // Show PopupView
    [self.view addSubview:_boxView];
    [_boxView addSubview:_closeButtonForPopupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closePopupView {
    
    [UIView animateWithDuration:0.5
                     animations:^() {
                         [self.boxView setFrame:self.frameRectForPopupViewHide];
                         [self.closeButtonForPopupView setFrame:self.frameRectForPopupViewCloseButtonHide];
                     }];
    self.animationToggle = 1;
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.animationToggle) {
        
        [UIView animateWithDuration:0.5
                         animations:^() {
                             [self.boxView setFrame:self.frameRectForPopupViewShow];
                             [self.closeButtonForPopupView setFrame:self.frameRectForPopupViewCloseButtonShow];
                         }
         ];
        self.animationToggle = 0;
        
    } else {
        [self closePopupView];
    }
    
    
}

@end
