//
//  AIHelp.m
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIHelp.h"
#import "AIAccountModel.h"
@implementation AIHelp
+(NSString*)getPathWithBasicPath:(NSString*)basicPath andDic:(NSDictionary*)dict{
    if (!dict) {
        return basicPath;
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSString *key in dict.keyEnumerator) {
        NSString *keyValue = [NSString stringWithFormat:@"%@=%@",key,dict[key]];
        [arrayM addObject:keyValue];
    }
    NSString *path = [arrayM componentsJoinedByString:@"&"];
    path = [NSString stringWithFormat:@"%@?%@",basicPath,path];
    return path;
}

+(NSString*)getInfoFor:(NSString *)key andInfo:(NSString*)info{
#warning 根据key返回info
#if 0
    access_token=2.00GTvmMGjoxjvD6a0afc8642kZ76lB&remind_in=639186&expires_in=639186&uid=5685773680
#endif

    
    NSArray *array = [info componentsSeparatedByString:key];
    NSString *string  = (NSString*)[array lastObject];
    NSArray *array2 = [string componentsSeparatedByString:@"&"];
    return array2[0];
//    return nil;
}
+(AIAccountModel*)account{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    AIAccountModel *account = [[AIAccountModel alloc]init];
    
    account.access_token = [defaults objectForKey:@"access_token"];
    account.expires_in = [defaults objectForKey:@"expires_in"];
    account.uid = [defaults objectForKey:@"uid"];
    //计算过期时间
    NSDate *now = [NSDate date];
    account.expires_in_time = [now dateByAddingTimeInterval:([account.expires_in doubleValue])];
    return account;
}
@end
