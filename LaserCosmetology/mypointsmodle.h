//
//  mypointsmodle.h
//  聚美医
//
//  Created by fenghuang on 15/11/26.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mypointsmodle : NSObject

@property(nonatomic,retain)NSString *points;
@property(nonatomic,retain)NSString *reason;
@property(nonatomic,retain)NSString *createdt;
@property(nonatomic,retain)NSString *rownumber;
@property(nonatomic,retain)NSString *createdate;
@property(nonatomic,retain)NSString *createtime;
@property(nonatomic,retain)NSString *abspoints;
+(mypointsmodle *)mypointswithdiction:(NSDictionary *)diction;
@end

