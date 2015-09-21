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
            
            block(nil,nil,nil);
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

//医生的客户分组
+ (void)postSetgroups:(NSString *)url withBlock:(dataBlcok2)block{
    
    NSLog(@"responseObject-url-%@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"AFHTTPRequestOpeartionManager医生的客户分组-%@---- %@",data ,error);
        
        
//        NSString *str = [data objectForKey:@"ErrorMessage"];
        
//        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
//        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
//        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
//        for (NSDictionary *diction in dataary) {
//             mycustomerdata *mydata = [mycustomerdata mycustomerdataWithdiction:diction];
//            [array addObject:mydata];
//        }
       NSMutableArray *array = [[NSMutableArray alloc]init];
        
      NSMutableArray *groupname = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSMutableArray *groupid = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSString *stra;
        for (NSDictionary *mycusdiction in dataary) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
            if (![stra isEqualToString:mycustom.groupname]) {
                [groupname addObject:mycustom.groupname];
                [groupid addObject:mycustom.groupid];
            }
            stra = mycustom.groupname;
            [array addObject:mycustom];
        }
        
        
        NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
        for (NSString *str in groupname) {
            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
            for (mycustomerdata *mydata in array) {
                if ([mydata.groupname isEqualToString:str]) {
                    [indexary addObject:mydata];
                }
                NSLog(@"mydata.groupname:%@",mydata.groupname);
            }
            [allgroup addObject:indexary];
        }
        
        for (NSMutableArray *sry in allgroup) {
            NSLog(@"sry.count-:%ld",sry.count);
        }
        
        
        if ([dctArray isEqualToString:@"操作成功"]) {
            
            block(groupname,allgroup,groupid);
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

//删除分组
+ (void)postdeletegroup:(NSString *)url withblock:(dataBlcok)block{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        
                NSLog(@"AFHTTPRequestOpeartionManager-删除分组--%@---- %@--",data ,error);
        

        
                NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
//        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
//                NSString *string = [NSString stringWithFormat:@"%@",dictArray];
//                NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        block(nil,nil,dctArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];

}
//获取客户列表数据
+ (void)postmanberplistandurl:(NSString *)url withblock:(dataBlcok)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        //        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
       
        //        NSString *str = [data objectForKey:@"ErrorMessage"];
        
        //        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
//        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        //        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
         NSLog(@"分组：data--%@",data);
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSMutableArray *headnamearray = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSString *stra;
        for (NSDictionary *mycusdiction in dataary) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
            if (![stra isEqualToString:mycustom.firstsearchword]) {
                [headnamearray addObject:mycustom.firstsearchword];
            }
            stra = mycustom.firstsearchword;
            [mycustomerDataarray addObject:mycustom];
        }
        
        
        
        NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
        for (NSString *str in headnamearray) {
            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
            for (mycustomerdata *mydata in mycustomerDataarray) {
                if ([mydata.firstsearchword isEqualToString:str]) {
                    [indexary addObject:mydata];
                }
            }
            [allgroup addObject:indexary];
        }
        
        NSLog(@"分组列表的客户列表：headnamearray%@",headnamearray);
        
        block(headnamearray,allgroup,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];
    


}

//保存分组
+(void)postsavegroupplist:(NSString *)url withblock:(dataBlcok)block{

    
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
        
        //        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
        
        //        NSString *str = [data objectForKey:@"ErrorMessage"];
        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        //        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
         NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);
        
        NSLog(@"分组：data--%@",data);
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSMutableArray *headnamearray = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSString *stra;
        for (NSDictionary *mycusdiction in dataary) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
            if (![stra isEqualToString:mycustom.firstsearchword]) {
                [headnamearray addObject:mycustom.firstsearchword];
            }
            stra = mycustom.firstsearchword;
            [mycustomerDataarray addObject:mycustom];
        }
        
        
        
        NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
        for (NSString *str in headnamearray) {
            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
            for (mycustomerdata *mydata in mycustomerDataarray) {
                if ([mydata.firstsearchword isEqualToString:str]) {
                    [indexary addObject:mydata];
                }
            }
            [allgroup addObject:indexary];
        }
        
        NSLog(@"分组列表的客户列表：headnamearray%@",headnamearray);
        
        block(headnamearray,allgroup,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
//获取客户资料
+(void)postsGetcustomerdata:(NSString *)url withblock:(dataBlcok)block{

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
        
        //        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
        
        //        NSString *str = [data objectForKey:@"ErrorMessage"];
        
//        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
////        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
//        NSDictionary *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
//        //        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
//        //        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
//        
////        NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);
////        
//        NSLog(@"分组---dataary-%@-",dataary);
//        
//        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
//        
//        
//            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:dataary];
//            [mycustomerDataarray addObject:mycustom];
//             NSLog(@"分组：mycustom.nickname--%@",mycustom.nickname);
//        
//
//        block(mycustomerDataarray,nil,nil);
//        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//病历记录页面
+(void)postsGetgetmedicalhistorylis:(NSString *)url withblock:(dataBlcok)block{


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
        
        //        NSLog(@"AFHTTPRequestOpeartionManager-%@---- %@",data ,error);
        
        
        //        NSString *str = [data objectForKey:@"ErrorMessage"];
        
        //        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        //        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        //        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        //        NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        //        NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);
        
        NSLog(@"分组：data--%@",data);
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSMutableArray *headnamearray = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSString *stra;
        //        for (NSDictionary *mycusdiction in dataary) {
        //            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
        //            if (![stra isEqualToString:mycustom.firstsearchword]) {
        //                [headnamearray addObject:mycustom.firstsearchword];
        //            }
        //            stra = mycustom.firstsearchword;
        //            [mycustomerDataarray addObject:mycustom];
        //        }
        
        
        
        NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
        for (NSString *str in headnamearray) {
            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
            for (mycustomerdata *mydata in mycustomerDataarray) {
                if ([mydata.firstsearchword isEqualToString:str]) {
                    [indexary addObject:mydata];
                }
            }
            [allgroup addObject:indexary];
        }
        
        NSLog(@"分组列表的客户列表：headnamearray%@",headnamearray);
        
        block(headnamearray,allgroup,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//获取医生的客户分组列表成员信息
+(void)postsallcustomerAndurl:(NSString *)url withblock:(dataBlcok)block{

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
        
                NSLog(@"AFHTTPRequestOpeartionManager-客户分组成员-%@---- %@",data ,error);
        
        
                NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
                NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
                NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];

        
                NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);
        
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        for (NSDictionary *mydiction in dataary) {
            mycustomerdata *mydata = [mycustomerdata mycustomerdataWithdiction:mydiction];
            [mycustomerDataarray addObject:mydata];
        }

        
        block(mycustomerDataarray,nil,nil);
        
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
