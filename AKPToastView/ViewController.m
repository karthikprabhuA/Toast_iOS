/*
 The MIT License (MIT)
 
 Copyright (c) 2014 Karthik Prabhu A
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  ViewController.m
//  AKPToastView
//
//  Created by Karthik Prabhu on 12/29/13.
//  Copyright (c) 2013 Karthik Prabhu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
BOOL enableToast;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    enableToast = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ButtonClicked:(id)sender
{
    //center toast
    if(enableToast)
    {
    AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:CENTER duration:SHORT];
    toast.delegate = self; //toastCompletionDelegate will get called once toast completed
    [toast show];
    enableToast = NO;
    }
    
    //bottom position toast
   /*  if(enableToast)
     {
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:BOTTOM duration:SHORT];
     toast.delegate = self;
     [toast show];
     enableToast = NO;
     }
    */
    //top position toast
    /* if(enableToast)
     {
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:TOP duration:SHORT];
     toast.delegate = self;
     [toast show];
     enableToast = NO;
     }*/
    
    //Custom position toast
    /* if(enableToast)
     {
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.. Please wait.. Please wait.. Please wait.. Please wait.." toastView:self.view position:CUSTOM duration:SHORT];
     toast.delegate = self;
     toast.customToastPosition = CGPointMake(30, 100);
     [toast show];
     }*/
    
    //duration LONG and two lines message
   /* if(enableToast)
    {
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.. Please wait.. Please wait.. Please wait.. Please wait.." toastView:self.view position:CENTER duration:LONG];
     toast.delegate = self;
     [toast show];
    }
    */
    
   
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)toastCompletionDelegate
{
    enableToast = YES;
}
@end
