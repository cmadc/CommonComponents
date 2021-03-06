//
//  UIColor+HexColor.h
//  Children
//
//  Created by caiming on 15/3/29.
//  Copyright (c) 2015年 caiming. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KKColorWithHex(hex) [UIColor colorWithHexString:hex]
#define KKColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KKColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define KKColorWithIMG(a) [UIColor colorWithPatternImage:[UIImage imageNamed:a]]

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end

