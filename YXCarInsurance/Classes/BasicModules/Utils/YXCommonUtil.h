//
//  YXCommonUtil.h
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/25.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YXCommonUtil : NSObject

/**
 获取ARGB颜色值
 
 @param hex 32位(unsigned int 32)
 @return 颜色
 */
+ (UIColor *)colorWithARGBHex:(UInt32)hex;


/**
 16进制转颜色
 
 @param stringToConvert 16进制
 @return 颜色
 */
+(UIColor *)hexStringToColor: (NSString *) stringToConvert;


/**
 颜色转图片
 
 @param color 色值
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;

/**
 得到当前时间戳
 
 @return 得到当前时间戳
 */
+ (NSString *)getNowTimeTimestamp;


/**
 得到当前时间
 
 @return 得到当前时间
 */
+ (NSString *)getCurrentTime;


@end
