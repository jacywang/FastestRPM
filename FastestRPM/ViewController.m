//
//  ViewController.m
//  FastestRPM
//
//  Created by JIAN WANG on 5/14/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(degrees) (M_PI * degrees / 180.0)

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *needle;


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
    

//    myImage.transform = CGAffineTransformRotate(myImage.transform, degreesToRadians(90));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)move:(UIPanGestureRecognizer *)sender {
    
}

@end
