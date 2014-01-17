//
//  XYZViewController.m
//  Animate
//
//  Created by Joe Selvik on 1/16/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()
@property (weak, nonatomic) IBOutlet UIView *sendMessageView;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         _sendMessageView.transform = CGAffineTransformMakeTranslation(0.0, -200.0);
                         

                     } completion:nil];
}


@end
