//
//  mycustomerdata.m
//  LaserCosmetology
//
//  Created by fenghuang on 15/4/15.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "mycustomerdata.h"

@implementation mycustomerdata

+(mycustomerdata *)mycustomerdataWithdiction:(NSDictionary *)diction
{
    mycustomerdata *mycustom  = [[mycustomerdata alloc] init];
    
    mycustom.BuyProductNames = [diction objectForKey:@"BuyProductNames"];
    mycustom.CellPhone = [NSString stringWithFormat:@"%@",[diction objectForKey:@"CellPhone"]];
    mycustom.FirstSearchWord = [diction objectForKey:@"FirstSearchWord"];
    mycustom.PicSrc = [diction objectForKey:@"PicSrc"];
    mycustom.Sno = [diction objectForKey:@"Sno"];
    mycustom.TrueName = [diction objectForKey:@"TrueName"];
    
    mycustom.infoid = [diction objectForKey:@"infoid"];
    mycustom.nickname = [diction objectForKey:@"nickname"];
    mycustom.truename = [diction objectForKey:@"truename"];
    mycustom.agecount = [diction objectForKey:@"agecount"];
    mycustom.birthday = [diction objectForKey:@"birthday"];
    mycustom.address = [diction objectForKey:@"address"];
    mycustom.sextype = [diction objectForKey:@"sextype"];
    mycustom.iscanuse = [diction objectForKey:@"iscanuse"];
    mycustom.remark = [diction objectForKey:@"remark"];
    mycustom.createdt = [diction objectForKey:@"createdt"];
    mycustom.createby = [diction objectForKey:@"createby"];
    mycustom.lastchangedt = [diction objectForKey:@"lastchangedt"];
    mycustom.lastchangeby = [diction objectForKey:@"lastchangeby"];
    mycustom.picsrc = [diction objectForKey:@"picsrc"];
    mycustom.levelsno = [diction objectForKey:@"levelsno"];
    mycustom.pointcount = [diction objectForKey:@"pointcount"];
    mycustom.firstsearchword = [diction objectForKey:@"firstsearchword"];
    mycustom.doctorsno = [diction objectForKey:@"doctorsno"];
    mycustom.agetype = [diction objectForKey:@"agetype"];
    mycustom.iostoken = [diction objectForKey:@"iostoken"];
    mycustom.cellphone = [diction objectForKey:@"cellphone"];
    mycustom.buyproductnames = [diction objectForKey:@"buyproductnames"];
    mycustom.rownumber = [diction objectForKey:@"rownumber"];


    return mycustom;
}
@end

