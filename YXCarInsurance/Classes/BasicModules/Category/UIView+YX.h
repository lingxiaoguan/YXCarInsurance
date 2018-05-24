//
//  UIView+YX.h
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YX)
/**
 设置x坐标
 */
- (void)setX:(CGFloat)x;

/**
 获取x坐标
 */
- (CGFloat)x;

/**
 设置y坐标
 */
- (void)setY:(CGFloat)y;

/**
 获取y坐标
 */
- (CGFloat)y;


@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

/**
 设置width
 */
- (void)setWidth:(CGFloat)width;

/**
 获取width
 */
- (CGFloat)width;

/**
 设置height
 */
- (void)setHeight:(CGFloat)height;

/**
 获取height
 */
- (CGFloat)height;

/**
 设置size
 */
- (void)setSize:(CGSize)size;
/**
 获取size
 */
- (CGSize)size;

/**
 设置origin
 */
- (void)setOrigin:(CGPoint)origin;
/**
 获取origin
 */
- (CGPoint)origin;



#pragma mark - By Peizhuo

/**根据响应者链获取当前视图所在的 视图控制器*/
@property (nonatomic, strong, readonly) UIViewController *viewController;
/**根据响应者链获取当前视图所在的 导航控制器*/
@property (nonatomic, strong, readonly) UINavigationController *navigationController;


/**是否允许视图跟随手指移动。默认为false。*/
@property (nonatomic, assign) BOOL allowFollowDraging;
/**是否回弹到原位置。默认为false，需与allowFollowDraging共同使用，单独设置无效果。*/
@property (nonatomic, assign) BOOL springback;


/**设置为true时，当前视图将具备按下缩小，松手回弹的动画效果（会自动将userInteractionEnabled设置为true，无需重复设置），默认为false*/
@property (nonatomic, assign) BOOL allowSpring;


/**设置为true时，当前视图会跟随按压屏幕的力度缩放（需要ForceTouch屏幕支持，会自动将userInteractionEnabled设置为true，无需重复设置），默认为false*/
@property (nonatomic, assign) BOOL      allowForceTouchScale NS_AVAILABLE_IOS(9_0);
/**视图根据按压力度缩放的最大倍数，默认为1.2，需与allowForceTouchScale属性配合使用，单独设置无效*/
@property (nonatomic, assign) CGFloat   maxForceTouchScale   NS_AVAILABLE_IOS(9_0);

@end
