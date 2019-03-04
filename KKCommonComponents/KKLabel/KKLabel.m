//
//  KKLabel.m
//  phigo-ios
//
//  Created by CaiMing on 2018/5/8.
//  Copyright © 2018年 CaiMing. All rights reserved.
//

#import "KKLabel.h"

@interface KKLabel ()
// 用来决定上下左右内边距，也可以提供一个接口供外部修改，在这里就先固定写死
@property (assign, nonatomic) UIEdgeInsets edgeInsets;

@end

@implementation KKLabel

- (instancetype)initWithFrame:(CGRect)frame edgeInsets:(UIEdgeInsets)edgeInsets
{
    if(self = [super initWithFrame:frame])
    {
        self.edgeInsets = edgeInsets;
    }
    return self;
}

// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    /*
     调用父类该方法
     注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
     */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds,
                                                                 self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect
{
    //令绘制区域为原始区域，增加的内边距区域不绘制
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

+ (CGSize)autoSizeLabNoLineSpacing:(CGSize)size  withFont:(UIFont*)font withSting:(NSString*)string
{
    if (string == nil || string.length==0) {
        return CGSizeMake(0, 0);
    }
    
    NSMutableDictionary *attributes = @{}.mutableCopy;
    [attributes setObject:font forKey:NSFontAttributeName];
    NSAttributedString * attribute = [[NSAttributedString alloc]initWithString:string attributes:attributes];
    CGRect rect = [attribute boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size;
}

+ (CGSize)autoSizeLabNoLineSpacing:(CGSize)size  attString:(NSAttributedString*)attribute
{
    CGRect rect = [attribute boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size;
}


@end
