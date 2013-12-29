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
    AUTOMATIC,
    TOP,
    CENTER,
    BOTTOM,
    CUSTOM
}TOAST_POSITION;

@interface AKPToast : NSObject
@property(strong) NSString* toastText;
@property(strong) UIView* toastView;
@property(assign) TOAST_POSITION position;
@property(assign) CGRect toastPosition;

- (id)initWithText:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position;
-(void)show;
@end
