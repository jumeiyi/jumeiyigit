//
//  medicalrecord.h
//  聚美医
//
//  Created by fenghuang on 15/9/24.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface medicalrecord : NSObject

@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *cussno;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *imagelist;
@property(nonatomic,retain)NSString *infoid;
@property(nonatomic,retain)NSString *orderdetailsno;
@property(nonatomic,retain)NSString *sno;
@property(nonatomic,retain)NSString *createdt;

+(medicalrecord *)getmedicalrecordWithdictionary:(NSDictionary *)diction;
@end

