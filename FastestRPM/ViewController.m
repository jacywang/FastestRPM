//
//  ViewController.m
//  FastestRPM
//
//  Created by JIAN WANG on 5/14/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(degrees) (M_PI * degrees / 180.0)

@interface ViewController () {
    CGPoint startLocation;
}

@property (nonatomic, weak) IBOutlet UIImageView *needle;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.needle.transform = CGAffineTransformIdentity;
    self.needle.transform = CGAffineTransformMakeRotation(degreesToRadians(135));
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    panGesture.maximumNumberOfTouches = 1;
    
    [self.view addGestureRecognizer:panGesture];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)move:(UIPanGestureRecognizer *)sender {
    CGFloat distance =0.0;
    CGFloat velocity = 0.0;
    CGFloat velocityX = 0.0;
    
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveBack) userInfo:nil repeats:NO];

    if (sender.state == UIGestureRecognizerStateBegan) {
        startLocation = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        if (startLocation.x != 0.0){
            CGPoint currentLocation = [sender locationInView:self.view];
            CGFloat dx = currentLocation.x - startLocation.x;
            CGFloat dy = currentLocation.y - startLocation.y;
            distance = sqrt(dx*dx + dy*dy );
            velocityX = [sender velocityInView:self.view].x;
            NSTimeInterval duration = dx / velocityX;
            velocity = distance / duration;
            self.needle.transform = CGAffineTransformMakeRotation(degreesToRadians(135 + velocity));
        }
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        self.needle.transform = CGAffineTransformMakeRotation(degreesToRadians(135));
    }
}

-(void)moveBack {
    NSLog(@"Fired!!!");
//    [UIView animateWithDuration:0.8 animations:^{
//        self.needle.transform = CGAffineTransformMakeRotation(degreesToRadians(135));
//    }];

    [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:0 animations:^{
        self.needle.transform = CGAffineTransformMakeRotation(degreesToRadians(135));
    } completion:^(BOOL finished) {
        NSLog(@"Animation done!");
    }];
}

@end
