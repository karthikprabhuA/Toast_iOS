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


Toast_iOS
=========

iOS toast is a small popup without ok button which is similar to Android TOAST. It only fills the amount of space required for the message and the current view remains visible and interactive

How to Use

    //center position toast
    AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:CENTER duration:SHORT];
    toast.delegate = self; //you can set delegate to get the toast completion method -(void)toastCompletionDelegate
    [toast show];
    
    
    //bottom position toast
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:BOTTOM duration:SHORT];
     toast.delegate = self;
     [toast show];
     enableToast = NO;

    //top position toast
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.." toastView:self.view position:TOP duration:SHORT];
     toast.delegate = self;
     [toast show];

    //Custom position toast
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.. Please wait.. Please wait.. Please wait.. Please wait.." toastView:self.view position:CUSTOM duration:SHORT];
     toast.delegate = self;
     toast.customToastPosition = CGPointMake(30, 100);
     [toast show];
 
    
    //duration LONG and two lines message
     AKPToast* toast = [[AKPToast alloc]initWithText:@"Please wait.. Please wait.. Please wait.. Please wait.. Please wait.." toastView:self.view position:CENTER duration:LONG];
     toast.delegate = self;
     [toast show];


Following delegate will gets called when toast completed
-(void)toastCompletionDelegate
{
   
}

![iPhone screenshot](https://raw.github.com/karthikprabhuA/Toast_iOS/master/iphone_screenshot.png)

![iPad screenshot](https://raw.github.com/karthikprabhuA/Toast_iOS/master/ipad_screenshot.png)