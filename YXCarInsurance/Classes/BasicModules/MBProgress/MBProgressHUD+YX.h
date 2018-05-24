//
//  MBProgressHUD+YX.h
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (YX)

/**
弹出一个提示框,2秒后消失

@param message 文字
@param view 显示view
@param inBottom YES:处于底部  NO:处于中部
*/
+ (void)showNormalMessage:(NSString *)message forView:(UIView *)view inBottom:(BOOL)inBottom;


/**
 弹出一个带自定义图标的提示框,2秒后消失
 
 @param message 文字
 @param customViewImage 自定义图标
 @param view 显示view
 */
+ (void)showNormalMessage:(NSString *)message customViewImage:(NSString *)customViewImage forView:(UIView *)view;

/**
 带取消按钮的自定义图标提示框
 
 @param message 文字
 @param customViewImage 自定义图标(默认为菊花)
 @param btnTitle 按钮文字
 @param target 对象
 @param action 事件
 @param view 显示view
 */
+ (void)showNormalMessage:(NSString *)message customViewImage:(NSString *)customViewImage btnTitle:(NSString *)btnTitle target:(id)target action:(SEL)action forView:(UIView *)view;

/**
 带文字的loading,需要手动关闭
 
 @param message 信息
 @param view view
 @return 直接返回一个MBProgressHUD
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


/**
 不带文字的loading,需要手动关闭
 
 @param view view
 @return 直接返回一个MBProgressHUD
 */
+(MBProgressHUD *)showLoading:(UIView *)view;
@end
