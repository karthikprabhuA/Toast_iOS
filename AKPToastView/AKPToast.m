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
- (id)initWithText:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position
{
    self = [super init];
    if (self) {
        // Initialization code
        self.toastText = text;
        self.toastView = toastView;
        self.position = position;
        self.toastLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        self.toastLabel.backgroundColor = [UIColor grayColor];
        self.toastLabel.textColor = [UIColor whiteColor];
        self.toastLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.toastLabel.layer.cornerRadius = 2.5f;
        
        self.toastLabel.layer.borderWidth = 0.5f;
        
        self.toastLabel.text = self.toastText;
        [self.toastLabel sizeToFit];
   }
    return self;
}

-(void)MakeToastView:(UIView*)toastView text:(NSString*)text position:(TOAST_POSITION)position
{
    
}
-(void)show
{
    self.toastLabel.center = self.toastView.center;
            [self.toastView addSubview:self.toastLabel];
   self.toastLabel.alpha = 0;
    [UILabel animateWithDuration:3 animations:^{
self.toastLabel.alpha = 1;
       
    } completion:^(BOOL finished){
        [UILabel animateWithDuration:6 animations:^{
          self.toastLabel.alpha = 0;
        }completion:^(BOOL finished){[self.toastLabel removeFromSuperview];}];
         }];
}

@end
