//
//  mypointsmodle.m
//  聚美医
//
//  Created by fenghuang on 15/11/26.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "mypointsmodle.h"

@implementation mypointsmodle

+(mypointsmodle *)mypointswithdiction:(NSDictionary *)diction{

    mypointsmodle *mypoint = [[mypointsmodle alloc] init];
    
    mypoint.points = [diction objectForKey:@"points"];
    mypoint.reason = [diction objectForKey:@"reason"];
    mypoint.createdt = [diction objectForKey:@"createdt"];
    mypoint.rownumber = [diction objectForKey:@"rownumber"];
    mypoint.createdate = [diction objectForKey:@"createdate"];
    mypoint.createtime = [diction objectForKey:@"createtime"];
    mypoint.abspoints = [diction objectForKey:@"abspoints"];
    
    return mypoint;

}

@end
