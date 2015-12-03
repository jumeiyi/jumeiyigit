//
//  wodejifen.h
//  聚美医
//
//  Created by fenghuang on 15/11/26.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^dataBlcok)(NSMutableArray *array1,NSMutableArray *array2,NSString *string);

@interface wodejifen : NSObject

@property (nonatomic,assign)dataBlcok block;

+(void)getTheDataWithULR:(NSString *)url AndBlock:(dataBlcok)block;
@end
