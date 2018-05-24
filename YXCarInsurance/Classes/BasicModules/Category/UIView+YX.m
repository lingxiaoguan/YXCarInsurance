//
//  UIView+YX.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "UIView+YX.h"
#import <objc/runtime.h>

static CGFloat const animationDuration = 0.1;
@implementation UIView (YX)
/**
 设置x坐标
 */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/**
 获取x坐标
 */
- (CGFloat)x
{
    return self.frame.origin.x;
}

/**
 设置y坐标
 */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/**
 获取y坐标
 */
- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

/**
 设置width
 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/**
 获取width
 */
- (CGFloat)width
{
    return self.frame.size.width;
}

/**
 设置height
 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 获取height
 */
- (CGFloat)height
{
    return self.frame.size.height;
}

/**
 设置size
 */
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

/**
 获取size
 */
- (CGSize)size
{
    return self.frame.size;
}

/**
 设置origin
 */
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
/**
 获取origin
 */
- (CGPoint)origin
{
    return self.frame.origin;
}


#pragma mark - Responder Chain
- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    
    return nil;
}

- (UINavigationController *)navigationController {
    return self.viewController.navigationController;
}

#pragma mark - Associated Proprety
- (void)setAllowFollowDraging:(BOOL)allowFollowDraging {
    self.userInteractionEnabled = true;
    objc_setAssociatedObject(self, @selector(allowFollowDraging), @(allowFollowDraging), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)allowFollowDraging {
    NSNumber *num = (NSNumber *)objc_getAssociatedObject(self, @selector(allowFollowDraging));
    return num.boolValue;
}

- (void)setSpringback:(BOOL)springback {
    objc_setAssociatedObject(self, @selector(springback), @(springback), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)springback {
    NSNumber *num = (NSNumber *)objc_getAssociatedObject(self, @selector(springback));
    return num.boolValue;
}

- (BOOL)allowSpring {
    NSNumber *num = (NSNumber *)objc_getAssociatedObject(self, @selector(allowSpring));
    return num.boolValue;
}

- (void)setAllowSpring:(BOOL)allowSpring {
    objc_setAssociatedObject(self, @selector(allowSpring), @(allowSpring), OBJC_ASSOCIATION_ASSIGN);
    if (allowSpring == true) {
        self.userInteractionEnabled = allowSpring;
    }
}

- (BOOL)allowForceTouchScale {
    NSNumber *num = objc_getAssociatedObject(self, @selector(allowForceTouchScale));
    return num.boolValue;
}

- (void)setAllowForceTouchScale:(BOOL)allowForceTouchScale {
    objc_setAssociatedObject(self, @selector(allowForceTouchScale), @(allowForceTouchScale), OBJC_ASSOCIATION_ASSIGN);
    if (allowForceTouchScale == true) {
        self.userInteractionEnabled = allowForceTouchScale;
    }
}

- (CGFloat)maxForceTouchScale {
    NSNumber *num = objc_getAssociatedObject(self, @selector(maxForceTouchScale));
    return num ? num.floatValue : 1.2;
}

- (void)setMaxForceTouchScale:(CGFloat)maxForceTouchScale {
    objc_setAssociatedObject(self, @selector(maxForceTouchScale), @(maxForceTouchScale), OBJC_ASSOCIATION_ASSIGN);
}



#pragma mark - Touch Action
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    if (self.allowSpring == true) {
        CGFloat scale = 0.97;
        [UIView animateWithDuration:animationDuration animations:^{
            self.transform = CGAffineTransformMakeScale(scale, scale);
        }];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    if (self.allowFollowDraging == true) {
        CGPoint currentPoint = [touch locationInView:self];
        CGPoint lastPoint = [touch previousLocationInView:self];
        
        CGFloat offset_x = currentPoint.x - lastPoint.x;
        CGFloat offset_y = currentPoint.y - lastPoint.y;
        
        if (offset_x + self.x < 0) {
            offset_x = self.x;
        } else if (offset_x + self.x + self.width > self.superview.width) {
            offset_x = self.superview.width - self.x - self.width;
        }
        
        if (offset_y + self.y < 0) {
            offset_y = self.y;
        } else if (offset_y + self.y + self.height > self.superview.height) {
            offset_y = self.superview.height - self.y - self.height;
        }
        
        CGPoint offsetPoint = CGPointMake(offset_x, offset_y);
        
        self.transform = CGAffineTransformTranslate(self.transform, offsetPoint.x, offsetPoint.y);
    }
    
    if (self.allowForceTouchScale == true) {
        CGFloat scale = touch.force / touch.maximumPossibleForce * (self.maxForceTouchScale - 1) + 1;
        [UIView animateWithDuration:animationDuration animations:^{
            self.transform = CGAffineTransformMakeScale(scale, scale);
        }];
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    if (self.allowFollowDraging == true && self.springback == true) {
        [UIView animateWithDuration:0.15 animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
    }
    
    if (self.allowSpring) {
        CGFloat scale = 1.03;
        [UIView animateWithDuration:animationDuration animations:^{
            self.transform = CGAffineTransformMakeScale(scale, scale);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:animationDuration animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        if (self.allowForceTouchScale == true) {
            [UIView animateWithDuration:animationDuration animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }
    }
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    if (self.allowFollowDraging == true && self.springback == true) {
        [UIView animateWithDuration:0.15 animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        if (self.allowForceTouchScale == true) {
            [UIView animateWithDuration:animationDuration animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }
    }
    
}

@end
