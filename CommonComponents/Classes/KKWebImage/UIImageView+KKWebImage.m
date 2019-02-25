//
//  UIImageView+KKWebImage.m
//  kakatrip
//
//  Created by CaiMing on 2016/11/8.
//  Copyright © 2016年 kakatrip. All rights reserved.
//

#import "UIImageView+KKWebImage.h"
#import "NSString+URLEncode.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation UIImageView (KKWebImage)

- (void)kk_setImageWithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setImageWithURL:url placeholderImage:nil];
    [self setImageWithURL:url placeholderImage:nil];

}
- (void)kk_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder
{
    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setImageWithURL:url placeholderImage:placeholder];
    [self setImageWithURL:url placeholderImage:placeholder];
}

//- (void)kk_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
//{
//    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    
//    [self sd_setImageWithURL:url
//            placeholderImage:placeholder
//                   completed:completedBlock];
//}
//
//
//- (void)kk_setImageWithURLString:(NSString *)urlString
//                placeholderImage:(UIImage *)placeholder
//                         options:(SDWebImageOptions)options
//                       completed:(SDWebImageCompletionBlock)completedBlock
//{
//    NSURL *url = [NSURL URLWithString:[urlString URLEncode]];
//    [self sd_setImageWithURL:url placeholderImage:placeholder options:options completed:completedBlock];
//}


@end
