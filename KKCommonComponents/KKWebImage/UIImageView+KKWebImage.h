//
//  UIImageView+KKWebImage.h
//  kakatrip
//
//  Created by CaiMing on 2016/11/8.
//  Copyright © 2016年 kakatrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (KKWebImage)

- (void)kk_setImageWithURLString:(NSString *)urlString;

- (void)kk_setImageWithURLString:(NSString *)urlString
                placeholderImage:(UIImage *)placeholder;

@end
