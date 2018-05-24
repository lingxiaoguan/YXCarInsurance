//
//  YXHttpUtil.m
//  YXCarInsurance
//
//  Created by Lingxg on 2018/5/24.
//  Copyright © 2018年 Lingxg. All rights reserved.
//

#import "YXHttpUtil.h"
#import <AFNetworking.h>

@implementation YXHttpUtil

+(void)postWithPth:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseJSON =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(responseJSON);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        failure(error);
    }];
}

+ (void)getWithPth:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    [manager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseJSON =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(responseJSON);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        failure(error);
        
    }];
}

@end
