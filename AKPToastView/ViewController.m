//
//  ViewController.m
//  AKPToastView
//
//  Created by Karthik Prabhu on 12/29/13.
//  Copyright (c) 2013 Karthik Prabhu. All rights reserved.
//

#import "ViewController.h"
#import "AKPToast.h"

@interface ViewController ()

@end

@implementation ViewController

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

-(IBAction)ButtonClicked:(id)sender
{
    AKPToast* view = [[AKPToast alloc]initWithText:@"  Please wait...  " toastView:self.view position:CENTER];
    [view show];
}
@end
