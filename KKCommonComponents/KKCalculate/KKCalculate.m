//
//  KKCalculate.m
//  Shopkeeper
//
//  Created by CaiMing on 2017/12/15.
//  Copyright © 2017年 dongyin. All rights reserved.
//

#import "KKCalculate.h"

@implementation KKCalculate


+ (NSString*)amountDisplayCalculate:(NSNumber*)a multiplyingBy:(NSNumber*)b
{
    if (a == nil || b == nil) {
        
        return @"0";
    }
    if ([a isKindOfClass:[NSNumber class]]||[b isKindOfClass:[NSNumber class]]||[a isKindOfClass:[NSString class]]||[b isKindOfClass:[NSString class]])
    {
        
        NSString *aStr = [NSString stringWithFormat:@"%@",a];
        NSString *bStr = [NSString stringWithFormat:@"%@",b];
        NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:aStr];
        NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithString:bStr];
        NSDecimalNumberHandler*roundUp = [NSDecimalNumberHandler
                                          decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                          scale:2
                                          raiseOnExactness:NO
                                          raiseOnOverflow:NO
                                          raiseOnUnderflow:NO
                                          raiseOnDivideByZero:YES];
        NSDecimalNumber *total = [price decimalNumberByMultiplyingBy:count withBehavior:roundUp];
        NSString *amountStr = total.description;
//        amountStr = [self amountDisplayCalculateTwoFloat:amountStr];
        return amountStr;
    }
    return @"0";
}

+ (NSString*)amountDisplayCalculate:(id)a addBy:(id)b
{
    if (a == nil || b == nil) {
        
        return @"0";
    }
    if ([a isKindOfClass:[NSNumber class]]||[b isKindOfClass:[NSNumber class]]||[a isKindOfClass:[NSString class]]||[b isKindOfClass:[NSString class]])
    {
        NSString *aStr = [NSString stringWithFormat:@"%@",a];
        NSString *bStr = [NSString stringWithFormat:@"%@",b];
        NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:aStr];
        NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithString:bStr];
        NSDecimalNumber *total = [price decimalNumberByAdding:count];
        NSString *amountStr = total.description;
        amountStr = [self amountDisplayCalculateTwoFloat:amountStr];
        return amountStr;
    }
    return @"0";
}

+ (NSString*)amountDisplayCalculate:(id)a subtracting:(id)b
{
    if (a == nil || b == nil) {
        
        return @"0";
    }
    if ([a isKindOfClass:[NSNumber class]]||[b isKindOfClass:[NSNumber class]]||[a isKindOfClass:[NSString class]]||[b isKindOfClass:[NSString class]])
    {
        NSString *aStr = [NSString stringWithFormat:@"%@",a];
        NSString *bStr = [NSString stringWithFormat:@"%@",b];
        NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:aStr];
        NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithString:bStr];
        NSDecimalNumber *total = [price decimalNumberBySubtracting:count];
        NSString *amountStr = total.description;
        amountStr = [self amountDisplayCalculateTwoFloat:amountStr];
        return amountStr;
    }
    return @"0";
}


+ (NSString*)amountDisplayCalculateTwoFloat:(id)a
{
    if ([a isKindOfClass:[NSNumber class]] || [a isKindOfClass:[NSString class]])
    {
        return [self amountDisplayCalculate:a multiplyingBy:@1];
    }
    return @"0";
}

@end
