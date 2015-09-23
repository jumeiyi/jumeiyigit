//
//  UpdataiWithimage.h
//  聚美医
//
//  Created by fenghuang on 15/9/23.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^dataBlcok)(NSMutableArray *array1,NSMutableArray *array2,NSString *string);
@interface UpdataiWithimage : NSObject

@property (nonatomic,assign)dataBlcok block;

//上传病历图片
+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSData *)imagedata Completion:(dataBlcok)completion;

@end
