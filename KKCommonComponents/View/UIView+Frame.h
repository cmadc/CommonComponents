//
//  UIView+Frame.h
//  Children
//
//  Created by caiming on 15/5/14.
//  Copyright (c) 2015年 caiming. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KKPHONE_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define KKPHONE_HEIGHT    [[UIScreen mainScreen] bounds].size.height

#define KKIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define KKStatusBarHeight           (KKIPHONE_X ? 44.0 : 20.0)


@interface UIView (Frame)

- (CGFloat)frame_x;
- (void)setFrame_X:(CGFloat)x;

- (CGFloat)frame_y;
- (void)setFrame_Y:(CGFloat)y;

- (CGFloat)frame_width;
- (void)setFrame_Width:(CGFloat)width;

- (CGFloat)frame_height;
- (void)setFrame_Height:(CGFloat)height;

- (CGFloat)frame_maxY;
- (CGFloat)frame_maxX;

- (CGPoint)boundsCenter;

@end
