//
//  AFHTTPRequestOpeartionManagerOfme.h
//  聚美医
//
//  Created by fenghuang on 15/9/17.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void (^requestComplete) (NSMutableArray *saleArray,NSString *errorMessage);
typedef void(^dataBlcok)(NSMutableArray *array1,NSMutableArray *array2,NSString *string);

typedef void(^dataBlcok2)(NSMutableArray *array1,NSMutableArray *array2,NSMutableArray *array3);

@interface AFHTTPRequestOpeartionManagerOfme : NSObject

@property (nonatomic,assign)dataBlcok block;

+ (void)postSetToTheDefaultAddressRequestWitHAddressId:(NSString *)addressId withBlock:(dataBlcok)block;
//医生的客户分组
+ (void)postSetgroups:(NSString *)url withBlock:(dataBlcok2)block;
//删除分组
+ (void)postdeletegroup:(NSString *)url withblock:(dataBlcok)block;
 //获取客户列表数据
+ (void)postmanberplistandurl:(NSString *)url withblock:(dataBlcok)block;
//保存分组
+(void)postsavegroupplist:(NSString *)url withblock:(dataBlcok)block;
//获取客户资料
+(void)postsGetcustomerdata:(NSString *)url withblock:(dataBlcok)block;
//病历记录页面
+(void)postsGetgetmedicalhistorylis:(NSString *)url withblock:(dataBlcok)block;
//获取医生的客户分组列表成员信息
+(void)postsallcustomerAndurl:(NSString *)url withblock:(dataBlcok)block;
@end
