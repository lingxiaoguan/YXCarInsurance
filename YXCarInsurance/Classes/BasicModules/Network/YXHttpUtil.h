//
//  YXHttpUtil.h
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpSuccessBlock) (id JSON);
typedef void(^HttpFailureBlock) (NSError *error);

@interface YXHttpUtil : NSObject

/**
 post请求
 
 @param path 请求路径
 @param params 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)postWithPth:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

/**
 get请求
 
 @param path 请求地址
 @param params 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)getWithPth:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

@end
