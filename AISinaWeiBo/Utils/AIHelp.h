//
//  AIHelp.h
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIAccountModel;
@interface AIHelp : NSObject
/**
 *  返回请求地址
 *
 *  @param basicPath 请求头
 *  @param dict      参数
 */
+(NSString*)getPathWithBasicPath:(NSString*)basicPath andDic:(NSDictionary*)dict;
/**
 *  根据key获得对应信息
 *
 */
+(NSString*)getInfoFor:(NSString *)key andInfo:(NSString*)info;

#warning  准备在这里获得account
+(AIAccountModel*)account;
@end
