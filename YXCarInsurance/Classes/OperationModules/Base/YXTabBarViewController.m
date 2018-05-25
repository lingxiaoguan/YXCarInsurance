//
//  YXTabBarViewController.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "YXTabBarViewController.h"
#import "PriceCompareViewController.h"
#import "CarInsuranceViewController.h"
#import "InsuranceRemindViewController.h"
#import "AboutMeViewController.h"

@interface YXTabBarViewController ()

@end

@implementation YXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    
    PriceCompareViewController *price = [[PriceCompareViewController alloc] init];
    UINavigationController *tabitem1 = [[UINavigationController alloc] initWithRootViewController:price];
    tabitem1.tabBarItem.title = @"帮你比较";
    tabitem1.tabBarItem.image = [UIImage imageNamed:@"intensely_n_icon"];
    tabitem1.tabBarItem.selectedImage = [UIImage imageNamed:@"intensely_s_icon"];
    tabitem1.tabBarItem.badgeValue =@"123";
    
    CarInsuranceViewController *car = [[CarInsuranceViewController alloc] init];
    UINavigationController *tabitem2 = [[UINavigationController alloc] initWithRootViewController:car];
    tabitem2.tabBarItem.title = @"汽车保险";
    tabitem2.tabBarItem.image = [UIImage imageNamed:@"insurance_n_icon"];
    tabitem2.tabBarItem.selectedImage = [UIImage imageNamed:@"insurance_s_icon"];
    tabitem2.tabBarItem.badgeValue =@"5";
    
    InsuranceRemindViewController *insurance = [[InsuranceRemindViewController alloc] init];
    UINavigationController *tabitem3 = [[UINavigationController alloc] initWithRootViewController:insurance];
    tabitem3.tabBarItem.title = @"续保提醒";
    tabitem3.tabBarItem.image = [UIImage imageNamed:@"purse_n_icon"];
    tabitem3.tabBarItem.selectedImage = [UIImage imageNamed:@"purse_s_icon"];
    
    AboutMeViewController *me = [[AboutMeViewController alloc] init];
    UINavigationController *tabitem4 = [[UINavigationController alloc] initWithRootViewController:me];
    tabitem4.tabBarItem.title = @"我的";
    tabitem4.tabBarItem.image = [UIImage imageNamed:@"mine_n_icon"];
    tabitem4.tabBarItem.selectedImage = [UIImage imageNamed:@"mine_s_icon"];
    
    self.viewControllers = @[tabitem2,tabitem1,tabitem3,tabitem4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
