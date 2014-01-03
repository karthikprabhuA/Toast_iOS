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
//  AKPToast.m
//  AKPToastView
//
//  Created by Karthik Prabhu on 12/29/13.
//  Copyright (c) 2013 Karthik Prabhu. All rights reserved.
//

#import "AKPToast.h"

@interface AKPToast()
@property(strong)UILabel* toastLabel;
@end

@implementation AKPToast
- (id)initWithText:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position duration:(TOAST_DURATION)duration
{
    self = [super init];
    if (self) {
        // Initialization code
        [self initializeToast:text toastView:toastView position:position duration:duration];
   }
    return self;
}

-(void)initializeToast:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position duration:(TOAST_DURATION)duration
{
    self.toastText = text;
    self.toastView = toastView;
    self.position = position;
    self.duration = duration;
    int leftpadding=10,heightpadding = 10;
    self.toastLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 100)];
    CGSize stringsize ;
    if([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
    {
       stringsize = [text sizeWithFont:[UIFont systemFontOfSize:17.0f]
                                   constrainedToSize:self.toastView.frame.size
                                       lineBreakMode:self.toastLabel.lineBreakMode];
    }
    else
     stringsize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]}];
    //dynamically setting label lines ,width and height
    if(stringsize.width > toastView.frame.size.width )
    {
        int lines = (stringsize.width / toastView.frame.size.width )+1;
        self.toastLabel.numberOfLines = lines;
        stringsize.width = toastView.frame.size.width - 20;
        stringsize.height =  stringsize.height * lines;
        
    }
    self.toastLabel.frame = CGRectMake(0, 0, stringsize.width + leftpadding, stringsize.height + heightpadding);
    self.toastLabel.textAlignment = NSTextAlignmentCenter;
    self.toastLabel.backgroundColor = [UIColor darkGrayColor];
    self.toastLabel.textColor = [UIColor whiteColor];
    self.toastLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.toastLabel.layer.cornerRadius = 3.5f;
    [self.toastLabel setFont:[UIFont systemFontOfSize:17]];
    self.toastLabel.layer.borderWidth = 0.75f;
    self.toastLabel.text = self.toastText;
}

-(void)show
{
    int fadeOutDuration;
    int fadinDuration;
    if(self.duration == SHORT)
    {
        fadeOutDuration = 2;
        fadinDuration = 3;
    }
    else
    {
        fadeOutDuration = 2;
        fadinDuration = 9;
    }
    if(self.position == BOTTOM)
    {
         self.toastLabel.center = CGPointMake([self getUIMainscreenBounds].width/2,[self getUIMainscreenBounds].height- 60.0f);
    }
    else if(self.position == TOP)
    {
       self.toastLabel.center = CGPointMake([self getUIMainscreenBounds].width/2, 60.0f);
    }
    else if(self.position == CUSTOM)
    {
        if(CGPointEqualToPoint(self.customToastPosition,CGPointZero))
        {
              self.toastLabel.center = CGPointMake([self getUIMainscreenBounds].width/2,[self getUIMainscreenBounds].height/2);
        }
        else
        {
             self.toastLabel.frame = CGRectMake(self.customToastPosition.x, self.customToastPosition.y, self.toastLabel.frame.size.width - self.customToastPosition.x, self.toastLabel.frame.size.height);
            
        }
        
    }
    else //CENTER
    {
     self.toastLabel.center = CGPointMake([self getUIMainscreenBounds].width/2,[self getUIMainscreenBounds].height/2);
    }
    
   [self.toastView addSubview:self.toastLabel];
   self.toastLabel.alpha = 0;
    
   [UILabel animateWithDuration:fadeOutDuration animations:^{
   self.toastLabel.alpha = 1;
    } completion:^(BOOL finished){
        [UILabel animateWithDuration:fadinDuration animations:^{
          self.toastLabel.alpha = .85;
        }completion:^(BOOL finished){
            [self.toastLabel removeFromSuperview];
            [self.delegate toastCompletionDelegate];
        }];
         }];
}

-(CGSize)getUIMainscreenBounds
{
    CGSize orientationSize;
    
    CGRect mainBounds = [UIScreen mainScreen].bounds;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

        if (orientation == UIInterfaceOrientationLandscapeRight || orientation == UIInterfaceOrientationLandscapeLeft) {
            orientationSize.width = mainBounds.size.height;
            orientationSize.height = mainBounds.size.width;
        }
        else
        {
            orientationSize.width = mainBounds.size.width;
            orientationSize.height = mainBounds.size.height;
        }
    
    return orientationSize;
}

@end
