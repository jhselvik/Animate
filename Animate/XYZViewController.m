//
//  XYZViewController.m
//  Animate
//
//  Created by Joe Selvik on 1/16/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()
@property (weak, nonatomic) IBOutlet UIView *stripe1;
@property (weak, nonatomic) IBOutlet UIView *stripe2;
@property CGFloat translateDistance;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _translateDistance = 280;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    while (1) {
//        [self animateBar];
//    }
    
    [self animateBar1];
}

-(void)animateBar1 {
    CGRect newFrame = self.stripe2.frame;
    newFrame.origin.x = 0;
    self.stripe2.frame = newFrame;
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _stripe1.transform = CGAffineTransformMakeTranslation(self.translateDistance, 0.0);
                     } completion:^(BOOL finished) {
                         [self animateBar2];
                     }
     ];
}

-(void)animateBar2 {
    CGRect newFrame = self.stripe1.frame;
    newFrame.origin.x = 0;
    self.stripe1.frame = newFrame;
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _stripe2.transform = CGAffineTransformMakeTranslation(self.translateDistance, 0.0);
                     } completion:^(BOOL finished) {
                         [self animateBar1];
                     }
     ];
}



//-(void)animateWin {
//    CGRect temp  = CGRectMake(0,(self.view.frame.size.height/2 -_winImageView.frame.size.height/2), _winImageView.frame.size.width, _winImageView.frame.size.height);
//    _winImageView.frame = temp;
//    [UIView animateWithDuration:0.5
//                          delay:0.0
//                        options:UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         _winImageView.frame = CGRectMake((self.view.frame.size.width - _winImageView.frame.size.width), _winImageView.frame.origin.y, _winImageView.frame.size.width , _winImageView.frame.size.height);
//                     }
//                     completion:^(BOOL finished) {
//                         [UIView animateWithDuration:0.5
//                                               delay:0.0
//                                             options:UIViewAnimationOptionBeginFromCurrentState
//                                          animations:^{
//                                              _winImageView.frame = CGRectMake(0, _winImageView.frame.origin.y, _winImageView.frame.size.width , _winImageView.frame.size.height);
//                                          }
//                                          completion:^(BOOL finished) {
//                                              [self animateWin];
//                                          }
//                          ];
//                         //temp.origin.x = 0;
//                     }
//     ];
//}

@end
