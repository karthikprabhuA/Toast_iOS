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
    CGSize stringsize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]}];
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
    self.toastLabel.layer.cornerRadius = 2.5f;
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
        fadinDuration = 6;
    }
    else
    {
        fadeOutDuration = 2;
        fadinDuration = 12;
    }
    if(self.position == BOTTOM)
    {
        self.toastLabel.center = CGPointMake(self.toastView.frame.size.width/2,self.toastView.frame.size.height - 60.0f);
    }
    else if(self.position == TOP)
    {
        self.toastLabel.center = CGPointMake(self.toastView.frame.size.width/2, 60.0f);
    }
    else if(self.position == CUSTOM)
    {
        if(CGPointEqualToPoint(self.customToastPosition,CGPointZero))
        {
                self.toastLabel.center = self.toastView.center;
        }
        else
        {
             self.toastLabel.frame = CGRectMake(self.customToastPosition.x, self.customToastPosition.y, self.toastLabel.frame.size.width, self.toastLabel.frame.size.height);
            
        }
        
    }
    else //CENTER
     self.toastLabel.center = self.toastView.center;
    [self.toastView addSubview:self.toastLabel];
   self.toastLabel.alpha = 0;
    [UILabel animateWithDuration:fadeOutDuration animations:^{
self.toastLabel.alpha = 1;
       
    } completion:^(BOOL finished){
        [UILabel animateWithDuration:fadinDuration animations:^{
          self.toastLabel.alpha = .85;
        }completion:^(BOOL finished){[self.toastLabel removeFromSuperview];}];
         }];
}

//not using
-(void)MakeToastView:(UIView*)toastView text:(NSString*)text position:(TOAST_POSITION)position duration:(TOAST_DURATION)duration
{
    [self initializeToast:text toastView:toastView position:position duration:duration];
}
@end
