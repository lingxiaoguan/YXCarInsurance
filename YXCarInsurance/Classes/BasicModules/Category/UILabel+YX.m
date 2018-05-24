//
//  UILabel+YX.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "UILabel+YX.h"

@implementation UILabel (YX)
+(UILabel *)setLabelText:(NSString *)title FontSize:(NSInteger)fontSize FontColor:(UIColor *)fontColor isWrap:(BOOL)isWrap{
    
    UILabel *lable=[[UILabel alloc]init];
    lable.text=title;
    lable.font=[UIFont systemFontOfSize:fontSize];
    lable.textColor=fontColor;
    
    if (isWrap) {
        lable.numberOfLines=0;
    }
    return lable;
}
@end
