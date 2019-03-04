//
//  KKLabel.h
//  phigo-ios
//
//  Created by CaiMing on 2018/5/8.
//  Copyright © 2018年 CaiMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame edgeInsets:(UIEdgeInsets)edgeInsets;
+ (CGSize)autoSizeLabNoLineSpacing:(CGSize)size  withFont:(UIFont*)font withSting:(NSString*)string;
+ (CGSize)autoSizeLabNoLineSpacing:(CGSize)size  attString:(NSAttributedString*)string;

@end
