//
//  YXBaseViewController.h
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXBaseViewController : UIViewController

/**
 滚动视图,添加子视图,请添加在scrollView上,如果需要添加到view上,请调用removeScrollView.
 */
@property(nonatomic, strong) UIScrollView *scrollView;


/**
 移除滚动视图,移除后scrollView相关设置无效,默认为NO
 */
@property(nonatomic, assign) BOOL removeScrollView;


/**
 设置是否隐藏tabbar,默认为NO
 */
@property(nonatomic, assign) BOOL shouldHideTabbar;


/**
 设置视图是否可滚动,默认为YES
 */
@property(nonatomic, assign) BOOL scrollEnabled;

@end
