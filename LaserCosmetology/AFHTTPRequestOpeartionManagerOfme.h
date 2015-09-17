//
//  AFHTTPRequestOpeartionManagerOfme.h
//  聚美医
//
//  Created by fenghuang on 15/9/17.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void (^requestComplete) (NSMutableArray *saleArray,NSString *errorMessage);
typedef void(^dataBlcok)(NSMutableArray *array1,NSMutableArray *array2);

@interface AFHTTPRequestOpeartionManagerOfme : NSObject

@property (nonatomic,assign)dataBlcok block;

+ (void)postSetToTheDefaultAddressRequestWitHAddressId:(NSString *)addressId withBlock:(dataBlcok)block;

+ (void)postSetgroups:(NSString *)url withBlock:(dataBlcok)block;
@end
