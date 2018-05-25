//
//  YXCommonUtil.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/25.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "YXCommonUtil.h"

@implementation YXCommonUtil
+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
    
}

/**
 获取ARGB颜色值
 
 @param hex 32位(unsigned int 32)
 @return 颜色
 */
+ (UIColor *)colorWithARGBHex:(UInt32)hex {
    int b = hex & 0x000000FF;
    int g = ((hex & 0x0000FF00) >> 8);
    int r = ((hex & 0x00FF0000) >> 16);
    int a = ((hex & 0xFF000000) >> 24);
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.f];
}

/**
 颜色转图片
 
 @param color 色值
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
}

+ (NSString *)getNowTimeTimestamp {
    return [NSString stringWithFormat:@"%.f",[[NSDate date] timeIntervalSince1970]*1000];
}

+ (NSString *)getCurrentTime {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentTime = [formatter stringFromDate:date];
    return currentTime;
}


@end
