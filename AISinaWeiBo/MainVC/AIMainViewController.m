//
//  AIMainViewController.m
//  AISinaWeiBo
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIMainViewController.h"
#import "AIFansListViewController.h"
#import "AIAttensionListViewController.h"
#import "AIMineWeiBoViewController.h"
#import "AIMineViewController.h"
#import "AIHomePageViewController.h"
#import "RDVTabBarItem.h"
#import "AILoginViewController.h"
#import "AIAccountModel.h"
@interface AIMainViewController ()

@end

@implementation AIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViewControllers];

}
/**
 *  设置控制器
 */
-(void)setUpViewControllers{

    //主页
    AIHomePageViewController *homePageVC = [[AIHomePageViewController alloc] initWithNibName:@"AIHomePageViewController" bundle:nil];
    SCNavigationController *homePageNav = [[SCNavigationController alloc]initWithRootViewController:homePageVC];
//    2.粉丝列表
    AIFansListViewController *fansVC = [[AIFansListViewController alloc] initWithNibName:@"AIFansListViewController" bundle:nil];
    SCNavigationController *fansNav = [[SCNavigationController alloc]initWithRootViewController:fansVC];
//    3.我的微博
    AIMineWeiBoViewController *mineWeiboVC = [[AIMineWeiBoViewController alloc] initWithNibName:@"AIMineWeiBoViewController" bundle:nil];
    SCNavigationController *mineWeiboNav = [[SCNavigationController alloc]initWithRootViewController:mineWeiboVC];
//    关注列表
    AIAttensionListViewController *attensionListVC = [[AIAttensionListViewController alloc] initWithNibName:@"AIAttensionListViewController" bundle:nil];
    SCNavigationController *attensionListNav = [[SCNavigationController alloc]initWithRootViewController:attensionListVC];
//    我的
    AIMineViewController *mineVC = [[AIMineViewController alloc] initWithNibName:@"AIMineViewController" bundle:nil];
    SCNavigationController *mineNav = [[SCNavigationController alloc]initWithRootViewController:mineVC];
    
//    将以上五个控制器装到数组中作为tabBarcontroller的ViewController
    self.viewControllers = @[homePageNav,fansNav,attensionListNav,mineWeiboNav,mineNav];
    [self customizeTabBarForController:self];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
  
    NSArray *tabBarItemTitles = @[@"主页", @"粉丝列表", @"我的微博",@"关注列表",@"我的"];
    NSArray *tabBarItemImages = @[@"shouye",@"shouye",@"shouye",@"shouye",@"shouye"];
    NSDictionary *textAttributes_normal = nil;
    NSDictionary *textAttributes_selected = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        textAttributes_normal = @{
                                  NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  NSForegroundColorAttributeName: [UIColor colorWithRed:147/255.0 green:145/255.0 blue:145/255.0 alpha:1.0],
                                  };
        textAttributes_selected = @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName: [UIColor colorWithRed:199/255.0 green:57/255.0 blue:32/255.0 alpha:1.0],
                                    };
    }
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        item.title = tabBarItemTitles[index];
        NSString *normalImageName = [NSString stringWithFormat:@"%@_normal.png",tabBarItemImages[index]];
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected.png",tabBarItemImages[index]];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        
        //配置title颜色和图标颜色一致
        
        item.selectedTitleAttributes =textAttributes_selected;
        item.unselectedTitleAttributes = textAttributes_normal;
//        item.finishedSelectedImage = [UIImage imageNamed:tabBarItemImages[i]];
        
        index++;
    }
}

/**
 *  登录
 */
-(void)login{
#warning 还去要更改
    AILog(@"%@",NSHomeDirectory());
    if ([self isNeedLogin]) {  //TODO:还需要处理
        AILoginViewController *loginVC = [[AILoginViewController alloc]initWithNibName:@"AILoginViewController" bundle:nil];
        SCNavigationController *loginNav = [[SCNavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self login];
}

-(BOOL)isNeedLogin{
    BOOL isNeed = NO;
    AIAccountModel *account = [AIHelp account];
    //  判断是否过期
    NSDate *now = [NSDate date];
    if ([now compare:account.expires_in_time] != NSOrderedAscending) {
        isNeed = YES;
    }
    
    return isNeed;
}
@end










