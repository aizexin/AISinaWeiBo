//
//  AIAccountModel.h
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIAccountModel : NSObject
/**
 * 	用于调用access_token，接口获取授权后的access token。
 */
@property(nonatomic ,copy)NSString *access_token;
/**
 *access_token的生命周期，单位是秒数。
 */
@property(nonatomic ,copy)NSString *expires_in;
/**
 * 当前授权用户的UID。
 */
@property(nonatomic ,copy)NSString *uid;
/**
 *  过期时间
 */
@property(nonatomic,strong)NSDate *expires_in_time;
@end
