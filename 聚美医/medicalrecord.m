//
//  medicalrecord.m
//  聚美医
//
//  Created by fenghuang on 15/9/24.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "medicalrecord.h"

@implementation medicalrecord

+(medicalrecord *)getmedicalrecordWithdictionary:(NSDictionary *)diction{

    medicalrecord *mymedcal = [[medicalrecord alloc] init];
    
    mymedcal.content = [NSString stringWithFormat:@"%@",[diction objectForKey:@"content"]];
    mymedcal.cussno = [diction objectForKey:@"cussno"];
    mymedcal.doctorsno = [diction objectForKey:@"doctorsno"];
    mymedcal.imagelist = [diction objectForKey:@"imagelist"];
    mymedcal.infoid = [NSString stringWithFormat:@"%@",[diction objectForKey:@"infoid"]];
    mymedcal.orderdetailsno = [diction objectForKey:@"orderdetailsno"];
    mymedcal.sno = [diction objectForKey:@"sno"];
    mymedcal.createdt = [diction objectForKey:@"createdt"];

    return mymedcal;
}


@end

