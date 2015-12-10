//
//  AppDelegate.m
//  聚美医
//
//  Created by fenghuang on 15/12/1.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "AppDelegate.h"

#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"
//#import <RennSDK/RennSDK.h>
#import "ViewController.h"
#import "APService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [ShareSDK registerApp:@"6236ece9b586"];//字符串api20为您的ShareSDK的AppKey
    
//    //添加新浪微博应用 注册网址 http://open.weibo.com
//    [ShareSDK connectSinaWeiboWithAppKey:@"302195624"
//                               appSecret:@"71515c5b9277d2d4f72c2a7feee1ee35"
//                             redirectUri:@"http://www.sharesdk.cn"];
//    
//    //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
//    [ShareSDK  connectSinaWeiboWithAppKey:@"302195624"
//                                appSecret:@"71515c5b9277d2d4f72c2a7feee1ee35"
//                              redirectUri:@"http://www.sharesdk.cn"
//                              weiboSDKCls:[WeiboSDK class]];
    
//    //添加腾讯微博应用 注册网址 http://dev.t.qq.com
//    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
//                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
//                                redirectUri:@"http://www.sharesdk.cn"];
    
//    //添加QQ空间应用  注册网址  http://connect.qq.com/intro/login/
//    [ShareSDK connectQZoneWithAppKey:@"100371282"
//                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
//                   qqApiInterfaceCls:[QQApiInterface class]
//                     tencentOAuthCls:[TencentOAuth class]];
//    
//    //添加QQ应用  注册网址   http://mobile.qq.com/api/
//    [ShareSDK connectQQWithQZoneAppKey:@"100371282"
//                     qqApiInterfaceCls:[QQApiInterface class]
//                       tencentOAuthCls:[TencentOAuth class]];
    
    //微信登陆的时候需要初始化
    [ShareSDK connectWeChatWithAppId:@"wxa41e44eb390fcaf7"
                           appSecret:@"f2fb220b539e63fd704ca6ac349c3bce"
                           wechatCls:[WXApi class]];
    
    
    
    
    
    // Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil];
    } else {
        //categories 必须为nil
        [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil];
    }
    
    
    
    // Required
    [APService setupWithOption:launchOptions];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    [self requestnotification];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    if (self.pageType != nil) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNotification" object:self.ishaver];
    }
    NSLog(@"self.pageType--%@",self.pageType);
    
    //self.ishaver = @"0";
    [self requestnotification];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also :.
}

#pragma mark ------ 推送---------
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Required
    
    [APService registerDeviceToken:deviceToken];
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    NSString *registration_id = [APService registrationID];
    
    if (registration_id.length > 5) {
        [userdf setObject:registration_id forKey:@"registration_id"];
    }
    
    NSLog(@"--registration_id: %@",registration_id);
    NSLog(@"--AA-deviceToken: %@---AA-",deviceToken);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required
    
    NSString *message = [[userInfo objectForKey:@"aps"]objectForKey:@"alert"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",  nil];
    [alert show];
    
    // Required
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    
    // IOS 7 Support Required
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    

    
    NSLog(@"userInfo-2-- %@",userInfo);
    
    NSString *_j_msgid = [userInfo objectForKey:@"_j_msgid"];
    NSLog(@"_j_msgid-- %@",_j_msgid);
    
    NSString *extra_key = [userInfo objectForKey:@"extra_key"];
    NSLog(@"extra_key---- %@",extra_key);
    
    NSDictionary *aps = [userInfo objectForKey:@"aps"];
    NSLog(@"aps---- %@",aps);
    
    NSString *alert = [aps objectForKey:@"alert"];
    NSLog(@"alert---- %@",alert);
    
    NSString *pageType = [userInfo objectForKey:@"pageType"];
    NSLog(@"-pageType--%@ ----",pageType);
    
    //1是医生收到，2是客户收到
    if ([pageType isEqualToString:@"1"]) {
        
    }else{
        
    }
    
    self.pageType = alert;
    
    
    if (self.pageType.length > 0) {
        self.ishaver = @"1";
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:@"1" forKey:@"ishaver"];
        [def synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"msg" object:@"1"];
    }else{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"msg" object:@""];
    }

  
}

#pragma mark---------11


-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
    NSLog(@"Regist fail%@",error);
}


-(void)requestnotification
{
    // Required
    
# if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //categories
        [APService
         registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                             UIUserNotificationTypeSound |
                                             UIUserNotificationTypeAlert)
         categories:nil];
    } else {
        //categories nil
        [APService
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound |
                                             UIRemoteNotificationTypeAlert)
#else
         //categories nil
         categories:nil];
        [APService
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                             UIRemoteNotificationTypeSound |
                                             UIRemoteNotificationTypeAlert)
#endif
         // Required
         categories:nil];
    }
    [APService setupWithOption:self.launchOptions];
    
}

@end
