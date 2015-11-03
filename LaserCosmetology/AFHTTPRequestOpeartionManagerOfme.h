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
//多个病历记录页面
+(void)postsGetgetmedicalhistorylis:(NSString *)url withblock:(dataBlcok)block;
//获取医生的客户分组列表成员信息
+(void)postsallcustomerAndurl:(NSString *)url withblock:(dataBlcok)block;
//保存选择的分组
+(void)postSaveTheShooseGroup:(NSString *)url withblock:(dataBlcok)block;
//单个病历列表
+(void)posetgetmedicalhistorylis:(NSString *)url withblock:(dataBlcok)block;
//上传病历前获取medicalhistorysno
+(void)postsEditingmedical:(NSString *)url withblock:(dataBlcok)block;
//已关注我，或未关注我
+(void)postsattentionTOMe:(NSString *)url withblock:(dataBlcok)block;
//删除病历
+(void)postscancellThemedicalhistory:(NSString *)url withblock:(dataBlcok)block;
//上传图片
//上传病历图片
+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSData *)imagedata Completion:(dataBlcok)completion;
//设置分组成员
+(void)posetsetmanberInGroup:(NSString *)url withblock:(dataBlcok)block;
//获取单条病历
+(void)posetgetAmedicalwithurl:(NSString *)url withblock:(dataBlcok)block;
//上传编辑病历图片
+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSString *)canshu3 and:(NSData *)imagedata Completion:(dataBlcok)completion;
//编辑病历。上传修改图片
+(void)posetUpdatatheChangeImage:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 medicalhistoryimagesno:(NSString *)canshu3 and:(NSData *)imagedata Completion:(dataBlcok)completion;

//获取订单详情
+(void)postsetnowstateWithurl:(NSString *)url withblock:(dataBlcok)block;

//上传病历进度nowstate
+(void)posetchangenowstateWithurl:(NSString *)url withblock:(dataBlcok)block;

//医生上传病历界面项目列表
+(void)getbeautifyproductlist:(NSString *)url withblock:(dataBlcok)block;

//保存编辑的病历
+(void)savermediclhistoryWithurl:(NSString *)url withblock:(dataBlcok)block;




@end
