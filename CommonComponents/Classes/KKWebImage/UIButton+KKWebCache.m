//
//  UIButton+KKWebCache.m
//  kakatrip
//
//  Created by CaiMing on 2016/11/8.
//  Copyright © 2016年 kakatrip. All rights reserved.
//

#import "UIButton+KKWebCache.h"
#import "NSString+URLEncode.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <AFNetworking/UIButton+AFNetworking.h>


@implementation UIButton (KKWebCache)

- (void)kk_setImageWithURLString:(NSString *)urlString forState:(UIControlState)controlState
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setImageWithURL:url forState:controlState];
    [self setImageForState:controlState withURL:url];
}

- (void)kk_setBackgroundImageWithURL:(NSString *)urlString forState:(UIControlState)controlState
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setBackgroundImageWithURL:url forState:controlState];
    [self setBackgroundImageForState:controlState withURL:url];
}

- (void)kk_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder forState:(UIControlState)controlState
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setImageWithURL:url forState:controlState placeholderImage:placeholder];
    [self setImageForState:controlState withURL:url placeholderImage:placeholder];
}


@end
