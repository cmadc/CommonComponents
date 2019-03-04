//
//  NSString+URLEncode.m
//  phigo-ios
//
//  Created by CaiMing on 2018/4/28.
//  Copyright © 2018年 CaiMing. All rights reserved.
//
//'CFURLCreateStringByAddingPercentEscapes' is deprecated: first deprecated in iOS 9.0 - Use [NSString stringByAddingPercentEncodingWithAllowedCharacters:] instead, which always uses the recommended UTF-8 encoding, and which encodes for a specific URL component or subcomponent (since each URL component or subcomponent has different rules for what characters are valid).
#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)URLEncode
{
    NSCharacterSet *encode_set= [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *urlString_encode = [self stringByAddingPercentEncodingWithAllowedCharacters:encode_set];
    return urlString_encode;
}

@end
