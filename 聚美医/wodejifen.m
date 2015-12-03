//
//  wodejifen.m
//  聚美医
//
//  Created by fenghuang on 15/11/26.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "wodejifen.h"
#import "AFNetworking.h"
#import "mypointsmodle.h"
@implementation wodejifen

+(void)getTheDataWithULR:(NSString *)url AndBlock:(dataBlcok)block{

    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                     (CFStringRef)url,
                                                                                                     NULL,
                                                                                                     NULL,
                                                                                                     kCFStringEncodingUTF8));
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",encodedString] parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        
        
        NSLog(@"AFHTTPRequestOpeartionManager-我的积分---%@----------%@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
//        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
//        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *diction = [[data objectForKey:@"Content"] objectForKey:@"data"];
//                NSString *string = [NSString stringWithFormat:@"%@",dictArray];
//                NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        NSMutableArray *mypointsary = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dic in diction) {
            mypointsmodle *mypoints = [mypointsmodle mypointswithdiction:dic];
            [mypointsary addObject:mypoints];
        }
        
        NSString *point = [[data objectForKey:@"Content"] objectForKey:@"points"];

        
        block(mypointsary,nil,point);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    

}

+ (void)checkNetWorkStatus{
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     *  AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     *  AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     *  AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络Wifi
     */
    // 如果要检测网络状态的变化, 必须要用检测管理器的单例startMoitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            
            //            NSLog(@"网络连接已断开，请检查您的网络！");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络连接已断开，请检查您的网络！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器异常" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
        }
    }];
    
}

@end
