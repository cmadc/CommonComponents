//
//  UIFont+AppFont.h
//  phigo-ios
//
//  Created by CaiMing on 2018/6/27.
//  Copyright © 2018年 CaiMing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KKAPPFONT(size)  [UIFont systemFontOfSize:size]
#define KKAPPMediumFONT(size) [UIFont mediumFontOfSize:size]
#define KKAPPBOLDFONT(size) [UIFont boldSystemFontOfSize:size]

@interface UIFont (AppFont)

+ (UIFont*)mediumFontOfSize:(CGFloat)size;
+ (UIFont*)lightFontOfSize:(CGFloat)size;
+ (UIFont*)thinFontOfSize:(CGFloat)size;
+ (UIFont*)ultraLightFontOfSize:(CGFloat)size;
+ (UIFont*)regularFontOfSize:(CGFloat)size;

@end
