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
//  AKPToast.h
//  AKPToastView
//
//  Created by Karthik Prabhu on 12/29/13.
//  Copyright (c) 2013 Karthik Prabhu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AKPToastDelegate
-(void)toastCompletionDelegate;
@end

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
@property(weak) id<AKPToastDelegate> delegate;
- (id)initWithText:(NSString*)text toastView:(UIView*)toastView position:(TOAST_POSITION)position duration:(TOAST_DURATION)duration;
-(void)show;
@end
