//
//  AKPToast.h
//  AKPToastView
//
//  Created by Karthik Prabhu on 12/29/13.
//  Copyright (c) 2013 Karthik Prabhu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    
    TOP,
    CENTER,
    BOTTOM,
    CUSTOM
}TOAST_POSITION;

typedef enum
{
   SHORT,
    LONG
}TOAST_DURATION;

@interface AKPToast : NSObject
@property(strong) NSString* toastText;
@property(strong) UIView* toastView;
@property(assign) TOAST_POSITION position;
@property(assign) TOAST_DURATION duration;
@property(assign) CGRect toastPosition;
@property(assign) CGPoint customToastPosition;

- (id)initWithText:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position duration:(TOAST_DURATION)duration;
-(void)show;
@end
