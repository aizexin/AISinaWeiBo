//
//  AILoginViewController.m
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AILoginViewController.h"

@interface AILoginViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation AILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//只要有UIScrollView的子类，都添加一句
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    self.sc_navigationItem.title = @"登录";
    

    NSDictionary *dict = @{@"client_id":SINA_APP_KEY,
                           @"redirect_uri":redirect_uri,
                           @"display":@"mobile",
                           @"response_type":@"token"};
    NSString *path = [AIHelp getPathWithBasicPath:SINA_AUTHORIZE_SEVER andDic:dict];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url ];
    //通过webView加载request
    [self.webView loadRequest:request];
}
#pragma mark 代理方法
/**
 *  将要开始请求是调用
 access_token=2.00dUXnZFjoxjvD5e7b387083r9zwVE&remind_in=638272&expires_in=638272&uid=5109642743
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *string = [NSString stringWithFormat:@"%@#",redirect_uri];
    NSArray *array = [request.URL.absoluteString componentsSeparatedByString:string];
    AILog(@"count = %ld",array.count);
    if (array.count>1) { //登录成功返回页面
        NSString *info = array[1];
        AILog(@"------%@",info);
        
        NSString *access_token = [AIHelp getInfoFor:@"access_token=" andInfo:info];
        NSString *remind = [AIHelp getInfoFor:@"remind=" andInfo:info];
        NSString *expires_in = [AIHelp getInfoFor:@"expires_in=" andInfo:info];
        NSString *uid = [AIHelp getInfoFor:@"uid=" andInfo:info];
        //存储
        [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:@"access_token"];
        [[NSUserDefaults standardUserDefaults]setObject:remind forKey:@"remind"];
        [[NSUserDefaults standardUserDefaults]setObject:expires_in forKey:@"expires_in"];
        [[NSUserDefaults standardUserDefaults]setObject:uid forKey:@"uid"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
        AILog(@"%@,%@,%@,%@,",access_token,remind,expires_in,uid);
        return NO;
    }
    return YES;
}
/**
 *  webView开始加载时调用
 */
- (void)webViewDidStartLoad:(UIWebView *)webView{
//    AILog(@"webViewDidStartLoad");
}
/**
 *  webView加载完成时
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    AILog(@"webViewDidFinishLoad");
}
/**
 *  webView加载失败调用
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    AILog(@"didFailLoadWithError");
}



@end
