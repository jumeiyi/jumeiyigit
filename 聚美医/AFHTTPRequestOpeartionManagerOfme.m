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
#import "medicalrecord.h"

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
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
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
//        NSLog(@"AFHTTPRequestOpeartionManager医生的客户分组-%@---- %@",data ,error);
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
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
        for (NSDictionary *data in dataary) {
               mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:data];
            [allgroup addObject:mycustom];
        }
        
            block(groupname,allgroup,groupid);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

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
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        //NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        //NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
        block(nil,nil,dctArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];

}
//获取客户列表数据
+ (void)postmanberplistandurl:(NSString *)url withblock:(dataBlcok)block
{
    
    NSLog(@"报错接口---：%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        
                NSLog(@"获取客户列表数据-%@---- %@",data ,error);
        
       
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        //NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        //NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        //NSString *resultMessage = [NSString stringWithFormat:@"%@",dctArray];
        
         //NSLog(@"分组：data--%@",data);
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        //NSMutableArray *headnamearray = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
        NSMutableArray *mutablehead = [[NSMutableArray alloc] initWithCapacity:0];
        //NSString *stra;
        for (NSDictionary *mycusdiction in dataary) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];

           // NSLog(@"mycustom.createby--%@",mycustom.createby);
            //stra = mycustom.firstsearchword;
            [mycustomerDataarray addObject:mycustom];
        }
        [mutablehead addObject:mycustomerDataarray];
//        
//        
//        
//       NSMutableArray *allgroup = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
//        for (NSString *str in headnamearray) {
//            NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
//            for (mycustomerdata *mydata in mycustomerDataarray) {
//                if ([mydata.firstsearchword isEqualToString:str]) {
//                    [indexary addObject:mydata];
//                }
//            }
//            [allgroup addObject:indexary];
//        }
//        
//        NSLog(@"分组列表的客户列表：headnamearray%@",headnamearray);
       // NSLog(@"客户数据%@",allgroup);
        

        for (mycustomerdata *mycustom in mycustomerDataarray) {
        }
        
        block(nil,mycustomerDataarray,nil);
        
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
        
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
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
        
        block(headnamearray,allgroup,dctArray);
        
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
        
                NSLog(@"AFHTTPRequestOpeartionManager-个人信息数据-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
//                NSString *str = [data objectForKey:@"ErrorMessage"];
//        
//        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
//        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSDictionary *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
//                NSString *string = [[data objectForKey:@"Content"] objectForKey:@"state"];
//                NSString *resultMessage = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        
//        NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);
//        
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:dataary];
            [mycustomerDataarray addObject:mycustom];
        
        NSMutableArray *beautitylist = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *buty in mycustom.beautitylist) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:buty];
            [beautitylist addObject:mycustom];
        }
        
        block(mycustomerDataarray,beautitylist,nil);
        
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
        
        NSLog(@"AFHTTPRequestOpeartionManager-病历记录页面-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        //                NSString *str = [data objectForKey:@"ErrorMessage"];
        //
        //        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        //        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSDictionary *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
        NSMutableArray *mymedicalary = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *mydiction in dataary) {
            medicalrecord *medical = [medicalrecord getmedicalrecordWithdictionary:mydiction];
            [mymedicalary addObject:medical];
        }
        

        
        block(mymedicalary,nil,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    


}

//保存选择的分组
+(void)postSaveTheShooseGroup:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSLog(@"AFHTTPRequestOpeartionManager-保存选择的分组-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
        
        NSLog(@"保存分组：state--%@--msg--%@",dictArray,dctArray);

        
        
        block(nil,nil,dctArray);
        
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
        
        NSLog(@"分组成员------%@",data);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
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

//单个病历列表
+(void)posetgetmedicalhistorylis:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        
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

//上传病历前获取medicalhistorysno
+(void)postsEditingmedical:(NSString *)url withblock:(dataBlcok)block{

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
        
        
        NSLog(@"AFHTTPRequestOpeartionManager-上传病历前获取medicalhistorysno-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }

        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *medicalhistorysno = [[data objectForKey:@"Content"] objectForKey:@"medicalhistorysno"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
        
        NSLog(@"//编辑病历：state--%@--msg--%@",dictArray,dctArray);
        
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        for (NSDictionary *mydiction in dataary) {
            mycustomerdata *mydata = [mycustomerdata mycustomerdataWithdiction:mydiction];
            [mycustomerDataarray addObject:mydata];
        }
        
        
        block(mycustomerDataarray,nil,medicalhistorysno);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//已关注我，或未关注我
+(void)postsattentionTOMe:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSLog(@"AFHTTPRequestOpeartionManager-已关注我，或未关注我-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        NSMutableArray *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
        
        NSLog(@"关注信息：state--%@--msg--%@",dictArray,dctArray);
        
        
        NSMutableArray *mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
        
        for (NSDictionary *mydiction in dataary) {
            mycustomerdata *mydata = [mycustomerdata mycustomerdataWithdiction:mydiction];
            [mycustomerDataarray addObject:mydata];
        }
        
        
        block(mycustomerDataarray,nil,dctArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

//删除病历
+(void)postscancellThemedicalhistory:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSLog(@"AFHTTPRequestOpeartionManager-删除病历-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        NSString *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
         NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        
        
        if ([string isEqualToString:@"0"]) {
            NSLog(@"删除病历1：state--%@--msg--%@",dictArray,dctArray);
        }else{
        NSLog(@"删除病历2：state--%@--msg--%@",dictArray,dctArray);
        }

       
        
        
        block(nil,nil,dctArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}
//上传病历图片
+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSData *)imagedata Completion:(dataBlcok)completion{
    
     NSDictionary *parameters = @{@"medicalhistorysno": canshu1,@"doctorsno": canshu2,@"datatype":@"image/jpg"};
    
    NSMutableURLRequest *request = nil;
    request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@",url] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
      
        if (imagedata.length > 50) {
            [formData appendPartWithFileData:imagedata name:@"data" fileName:fileName mimeType:@"image/jpg"];

        }
       
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
//        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
                NSLog(@"32423423==%@",responseObject);
        //        NSLog(@"error == %@",error);
//        NSString *dictArray = [[responseObject objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *dctArray = [[responseObject objectForKey:@"Content"] objectForKey:@"state"];
        
//        NSString *statestr = [NSString stringWithFormat:@"%@",dctArray];
//        if ([statestr isEqualToString:@"1"]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加成功！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }else{
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加失败！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }
        
    }];
    
    [uploadTask resume];

}

//设置分组成员
+(void)posetsetmanberInGroup:(NSString *)url withblock:(dataBlcok)block{

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
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        NSString *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
//        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
//        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        
        

        
        
        
        block(nil,nil,dctArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    


}

//上传编辑病历图片
+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSString *)canshu3 and:(NSData *)imagedata Completion:(dataBlcok)completion{


    NSDictionary *parameters = @{@"medicalhistorysno": canshu1,@"doctorsno": canshu2,@"datatype":@"image/jpg",@"medicalhistoryimagesno": canshu3};
    
    NSMutableURLRequest *request = nil;
    request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@",url] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imagedata name:@"data" fileName:fileName mimeType:@"image/jpg"];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        NSLog(@"上传编辑病历图片==%@",responseObject);
        //        NSLog(@"error == %@",error);
        NSString *dictArray = [[responseObject objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *dctArray = [[responseObject objectForKey:@"Content"] objectForKey:@"state"];
        
        NSString *statestr = [NSString stringWithFormat:@"%@",dctArray];
        if ([statestr isEqualToString:@"1"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加成功！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加失败！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
        
        
    }];
    
    [uploadTask resume];

}

//获取单条病历
+(void)posetgetAmedicalwithurl:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSLog(@"AFHTTPRequestOpeartionManager--获取单条病历-%@---- %@",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        NSString *dictArray = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSDictionary *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        NSString *string = [NSString stringWithFormat:@"%@",dictArray];
        
        NSMutableArray *medicalhistoryimages = [dataary objectForKey:@"medicalhistoryimages"];
        NSString *contents = [dataary objectForKey:@"content"];
        
        
        if ([string isEqualToString:@"0"]) {
            NSLog(@"获取单条病历：state--%@--msg--%@",dictArray,dctArray);
        }else{
            NSLog(@"获取单条病历：state--%@--msg--%@",dictArray,dctArray);
        }
        
        
        
        block(medicalhistoryimages,nil,contents);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
//编辑病历。上传修改图片
+(void)posetUpdatatheChangeImage:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 medicalhistoryimagesno:(NSString *)canshu3 and:(NSData *)imagedata Completion:(dataBlcok)completion{

    
    NSDictionary *parameters = @{@"medicalhistorysno": canshu1,@"doctorsno": canshu2,@"medicalhistoryimagesno": canshu3,@"datatype":@"image/jpg"};
    
    NSMutableURLRequest *request = nil;
    request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@",url] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imagedata name:@"data" fileName:fileName mimeType:@"image/jpg"];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        NSLog(@"修改上传编辑病历图片==%@",responseObject);
        //        NSLog(@"error == %@",error);
        NSString *dictArray = [[responseObject objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *dctArray = [[responseObject objectForKey:@"Content"] objectForKey:@"state"];
        
//        NSString *statestr = [NSString stringWithFormat:@"%@",dctArray];
//        if ([statestr isEqualToString:@"1"]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加成功！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }else{
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片添加失败！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }
        
        
    }];
    
    [uploadTask resume];

}

//获取订单详情
+(void)postsetnowstateWithurl:(NSString *)url withblock:(dataBlcok)block{

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
        
        NSLog(@"AFHTTPRequestOpeartionManager--获取订单详情-%@---- %@--",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        NSDictionary *datadiction = [[data objectForKey:@"Content"] objectForKey:@"data"];
        NSDictionary *medicalhistorydic = [[data objectForKey:@"Content"] objectForKey:@"medicalhistory"];
        NSString *msg = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        
        NSLog(@"msg------%@",msg);
        
        
        if ([msg isEqualToString:@"0"]) {
           
        }else{
            
        }
        
        
        
        block(nil,nil,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//上传病历进度nowstate
+(void)posetchangenowstateWithurl:(NSString *)url withblock:(dataBlcok)block{


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
        
        NSLog(@"AFHTTPRequestOpeartionManager--上传病历进度nowstate-%@---- %@--",data ,error);
        
//        
//        NSDictionary *datadiction = [[data objectForKey:@"Content"] objectForKey:@"data"];
//        NSDictionary *medicalhistorydic = [[data objectForKey:@"Content"] objectForKey:@"medicalhistory"];
        
         NSString *msg = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        
        NSString *statestr = [NSString stringWithFormat:@"%@",[[data objectForKey:@"Content"] objectForKey:@"state"]];
//        if ([statestr isEqualToString:@"1"]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }else{
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            [alert show];
//        }
        NSMutableArray *ary = [[NSMutableArray alloc] initWithObjects:msg, nil];
        
        block(nil,ary,statestr);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//医生上传病历界面项目列表
+(void)getbeautifyproductlist:(NSString *)url withblock:(dataBlcok)block
{
    
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
        
        NSLog(@"AFHTTPRequestOpeartionManager--医生上传病历界面项目列表-%@---- %@--",data ,error);
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        //        NSDictionary *datadiction = [[data objectForKey:@"Content"] objectForKey:@"data"];
        //        NSDictionary *medicalhistorydic = [[data objectForKey:@"Content"] objectForKey:@"medicalhistory"];
        //        NSString *msg = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        //
        //        NSLog(@"msg------%@",msg);
        //
        //
        //        if ([msg isEqualToString:@"0"]) {
        //
        //        }else{
        //
        //        }
        
        block(nil,nil,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//保存编辑的病历
+(void)savermediclhistoryWithurl:(NSString *)url withblock:(dataBlcok)block{

    
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
        
        NSLog(@"AFHTTPRequestOpeartionManager--保存编辑的病历-%@---- %@--",data ,error);
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
//                NSDictionary *datadiction = [[data objectForKey:@"Content"] objectForKey:@"data"];
//                NSDictionary *medicalhistorydic = [[data objectForKey:@"Content"] objectForKey:@"medicalhistory"];
                NSString *msg = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        
                NSLog(@"msg------%@",msg);
        
        
                if ([msg isEqualToString:@"0"]) {
        
                }else{
        
                }
        
        block(nil,nil,msg);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

//获取群组的人数
+(void)getTheGroupOfNumberWith:(NSString *)url withblock:(dataBlcok)block
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
       // NSLog(@"AFHTTPRequestOpeartionManager医生的客户分组-----人数----%@---- %@",data ,error);
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];


        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        for (NSDictionary *manber in dataary) {
           NSString *str = [manber objectForKey:@"groupnum"];
            [array addObject:str];
        }
        
        block(array,nil,nil);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}


//删除病历的部分图片
+(void)deleteThemadicleimaheWithURL:(NSString *)url withblock:(dataBlcok)block{

    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                     (CFStringRef)url,
                                                                                                     NULL,
                                                                                                     NULL,
                                                                                                     kCFStringEncodingUTF8));
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST: [NSString stringWithFormat:@"%@",encodedString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[operation responseData] options:NSJSONReadingMutableContainers error:&error];
        
         NSLog(@"AFHTTPRequestOpeartionManager医生的删除病历部分图片---------%@---- %@",data ,error);
        
        
        NSString *errorstring = [data objectForKey:@"ErrorMessage"];
        if (errorstring.length > 10) {
            UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"提示" message:errorstring delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [aler show];
            return ;
        }
        
        
        
        
        NSString *dctArray = [[data objectForKey:@"Content"] objectForKey:@"msg"];
        NSString *state = [[data objectForKey:@"Content"] objectForKey:@"state"];
        NSMutableArray *dataary = [[data objectForKey:@"Content"] objectForKey:@"data"];
        
        NSLog(@"报错--------：%@-----state:%@",dctArray,state);

        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        for (NSDictionary *manber in dataary) {
            NSString *str = [manber objectForKey:@"groupnum"];
            [array addObject:str];
        }
        
        block(array,nil,nil);
        
        
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
