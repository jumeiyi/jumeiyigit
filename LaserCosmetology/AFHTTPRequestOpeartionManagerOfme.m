//
//  AFHTTPRequestOpeartionManagerOfme.m
//  聚美医
//
//  Created by fenghuang on 15/9/17.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "AFNetworking.h"
#import "mycustomerdata.h"

@implementation AFHTTPRequestOpeartionManagerOfme

+ (void)postSetToTheDefaultAddressRequestWitHAddressId:(NSString *)addressId withBlock:(dataBlcok)block{
    
    NSString * str = [NSString stringWithFormat:@"{\"id\":\"%@\"}",addressId];
    NSDictionary *parameters = @{@"json": str };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",@"http://10.5.1.100/doctor.customerlist.go?docsno=92eb31d9-8beb-47c9-b0a0-70a4f8a4795d&group=Exclusive&toPage=1&Count_per_Page=15"] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSMutableArray *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        NSLog(@"responseObject--%@",resultMessage);
        
        if ([string isEqualToString:@"操作成功"]) {
            
            block(array,nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        completion(nil,[NSString stringWithFormat:@"%@",error]);
        //        NSLog(@"Error: %@", error);
        //        if (error)
        //        {
        //            [self checkNetWorkStatus];
        //        }
    }];
}

+ (void)postSetgroups:(NSString *)url withBlock:(dataBlcok)block{
    
    NSLog(@"responseObject-url-%@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
//        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        NSLog(@"分组：data--%@",data);
//        NSString *str = [data objectForKey:@"ErrorMessage"];
        
//        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
//        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
//        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        for (NSDictionary *diction in dataary) {
             mycustomerdata *mydata = [mycustomerdata mycustomerdataWithdiction:diction];
            [array addObject:mydata];
        }
       
        
      NSMutableArray *groupname = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSString *stra;
        for (NSDictionary *mycusdiction in dataary) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
            if (![stra isEqualToString:mycustom.firstsearchword]) {
                [groupname addObject:mycustom.firstsearchword];
            }
            stra = mycustom.firstsearchword;
            [array addObject:mycustom];
        }
        
        
        NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
        for (NSString *str in groupname) {
            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
            for (mycustomerdata *mydata in array) {
                if ([mydata.firstsearchword isEqualToString:str]) {
                    [indexary addObject:mydata];
                }
            }
            [allgroup addObject:indexary];
        }
        
        
        if ([dctArray isEqualToString:@"操作成功"]) {
            
            block(array,array);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        completion(nil,[NSString stringWithFormat:@"%@",error]);
        //        NSLog(@"Error: %@", error);
        //        if (error)
        //        {
        //            [self checkNetWorkStatus];
        //        }
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
