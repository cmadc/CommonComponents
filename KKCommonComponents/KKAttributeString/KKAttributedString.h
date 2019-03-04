//
//  AttributedString.h
//  PalmDoctorPT
//
//  Created by caiming on 16/1/8.
//  Copyright © 2016年 kangmeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKAttributedString : NSObject

+ (NSAttributedString *)attributeWithLinkTextViewItems:(NSArray *)linkTextViewItems;

@end

@class UIColor,UIFont;

@interface CMLinkTextViewItem : NSObject

@property(nonatomic, strong)NSString *textContent;
@property(nonatomic, strong)UIColor *textColor;
@property(nonatomic, strong)UIFont *textFont;
@property(nonatomic, assign)CGFloat lineSpacing;
@property(nonatomic, assign)NSTextAlignment textAlignment;
@property(nonatomic, assign)BOOL isUnderline;
@property(nonatomic, assign)NSRange textRange;

- (NSAttributedString *)attributeStringNormal;

+ (NSAttributedString*)attributeStringWithText:(NSString*)text textFont:(UIFont*)textFont textColor:(UIColor*)textColor;

+ (NSAttributedString*)attributeStringWithText:(NSString*)text textFont:(UIFont*)textFont textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
