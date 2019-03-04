//
//  UIImageView+KKWebImage.m
//  kakatrip
//
//  Created by CaiMing on 2016/11/8.
//  Copyright © 2016年 kakatrip. All rights reserved.
//

#import "UIImageView+KKWebImage.h"
#import "NSString+URLEncode.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation UIImageView (KKWebImage)

- (void)kk_setImageWithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
    [self setImageWithURL:url placeholderImage:nil];

}
- (void)kk_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
    [self setImageWithURL:url placeholderImage:placeholder];
}


@end
