//
//  UIFont+AppFont.m
//  phigo-ios
//
//  Created by CaiMing on 2018/6/27.
//  Copyright © 2018年 CaiMing. All rights reserved.
//

#import "UIFont+AppFont.h"

@implementation UIFont (AppFont)

+ (UIFont*)mediumFontOfSize:(CGFloat)size
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}

+ (UIFont*)lightFontOfSize:(CGFloat)size
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}

+ (UIFont*)thinFontOfSize:(CGFloat)size
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}

+ (UIFont*)ultraLightFontOfSize:(CGFloat)size
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightUltraLight];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}
+ (UIFont*)regularFontOfSize:(CGFloat)size
{
    if (@available(iOS 8.2, *)) {
        
        return  [UIFont fontWithName:@"PingFangSC-Regular"size:size];
        
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}
@end
