//
//  YXBaseViewController.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "YXBaseViewController.h"
#import <Masonry.h>

@interface YXBaseViewController ()

@end

@implementation YXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
}

-(void)createScrollView
{
    self.view.backgroundColor =[UIColor whiteColor];
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.userInteractionEnabled =YES;
    [self.view addSubview:scrollView];
    self.scrollView =scrollView;
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView.superview);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
