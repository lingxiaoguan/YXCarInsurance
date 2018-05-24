//
//  MBProgressHUD+YX.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "MBProgressHUD+YX.h"

@implementation MBProgressHUD (YX)
/**
 弹出一个提示框,2秒后消失
 
 @param message 文字
 @param view 显示view
 @param inBottom YES:处于底部  NO:处于中部
 */
+ (void)showNormalMessage:(NSString *)message forView:(UIView *)view inBottom:(BOOL)inBottom
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.bezelView.layer.opacity =1.f;
    if(inBottom) {
        hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    }
    [hud hideAnimated:YES afterDelay:2.f];
}

/**
 弹出一个带自定义图标的提示框,2秒后消失
 
 @param message 文字
 @param customViewImage 自定义图标
 @param view 显示view
 */
+ (void)showNormalMessage:(NSString *)message customViewImage:(NSString *)customViewImage forView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.layer.opacity =1.f;
    UIImage *image = [[UIImage imageNamed:customViewImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:2.f];
}

/**
 带取消按钮的自定义图标提示框
 
 @param message 文字
 @param customViewImage 自定义图标(默认为菊花)
 @param action 按钮事件
 @param view 显示view
 */
+ (void)showNormalMessage:(NSString *)message customViewImage:(NSString *)customViewImage btnTitle:(NSString *)btnTitle target:(id)target action:(SEL)action forView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if(customViewImage) {
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:customViewImage] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        hud.customView = [[UIImageView alloc] initWithImage:image];
    }else {
    }
    hud.label.text =message;
    [hud.button setTitle:btnTitle forState:UIControlStateNormal];
    [hud.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


/**
 显示提示信息,需要手动关闭
 
 @param message 信息
 @param view view
 @return 直接返回一个MBProgressHUD
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    //  hud.dimBackground = NO;
    return hud;
}

/**
 不带文字的loading,需要手动关闭
 
 @param view view
 @return 直接返回一个MBProgressHUD
 */
+(MBProgressHUD *)showLoading:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view==nil?[[UIApplication sharedApplication].windows lastObject]:view animated:YES];
    hud.minSize = CGSizeMake(100, 100);
    hud.bezelView.layer.cornerRadius = 7;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}



@end
