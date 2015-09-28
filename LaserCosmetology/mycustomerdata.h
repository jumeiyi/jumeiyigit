//
//  mycustomerdata.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/4/15.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mycustomerdata : NSObject



@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *agecount;
@property(nonatomic,copy)NSString *agetype;
@property(nonatomic,copy)NSString *birthday;
@property(nonatomic,copy)NSString *buyproductnames;
@property(nonatomic,copy)NSString *cellphone;
@property(nonatomic,copy)NSString *createby;
@property(nonatomic,copy)NSString *doctorsno;
@property(nonatomic,copy)NSString *firstsearchword;
@property(nonatomic,copy)NSString *infoid;
@property(nonatomic,copy)NSString *iostoken;
@property(nonatomic,copy)NSString *iscanuse;
@property(nonatomic,copy)NSString *lastchangeby;
@property(nonatomic,copy)NSString *levelsno;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *picsrc;
@property(nonatomic,copy)NSString *pointcount;
@property(nonatomic,copy)NSString *remark;
@property(nonatomic,copy)NSString *rownumber;
@property(nonatomic,copy)NSString *sextype;
@property(nonatomic,copy)NSString *sno;
@property(nonatomic,copy)NSString *truename;

@property(nonatomic,copy)NSString *issysreverse;
@property(nonatomic,copy)NSString *groupid;
@property(nonatomic,copy)NSString *groupname;
@property(nonatomic,copy)NSString *isuse;
@property(nonatomic,copy)NSString *groupnum;

@property(nonatomic,copy)NSString *customerid;
@property(nonatomic,copy)NSString *customerremark;
@property(nonatomic,copy)NSString *customersno;
@property(nonatomic,copy)NSString *frommansno;
@property(nonatomic,copy)NSString *frontuserid;
@property(nonatomic,copy)NSString *frontusersno;
@property(nonatomic,copy)NSString *logincellphone;
@property(nonatomic,copy)NSString *loginemailno;
@property(nonatomic,copy)NSString *loginno;
@property(nonatomic,copy)NSString *loginpassword;
@property(nonatomic,copy)NSString *weixinopenid;
@property(nonatomic,copy)NSArray *beautitylist;

@property(nonatomic,copy)NSString *amoumt;
@property(nonatomic,copy)NSString *beautifydetailid;
@property(nonatomic,copy)NSString *beautifydetailremark;
@property(nonatomic,copy)NSString *beautifyid;
@property(nonatomic,copy)NSString *beautifyremark;
@property(nonatomic,copy)NSString *beautifysno;
@property(nonatomic,copy)NSString *beautitydetailsno;
@property(nonatomic,copy)NSString *buycount;
@property(nonatomic,copy)NSString *buyprice;
@property(nonatomic,copy)NSString *paysno;
@property(nonatomic,copy)NSString *evaluatecontents;
@property(nonatomic,copy)NSString *evaluatedt;
@property(nonatomic,copy)NSString *evaluatelevel;
@property(nonatomic,copy)NSString *evaluatereturncontents;
@property(nonatomic,copy)NSString *isevaluate;
@property(nonatomic,copy)NSString *nowstate;
@property(nonatomic,copy)NSString *orderno;
@property(nonatomic,copy)NSString *phoneno;
@property(nonatomic,copy)NSString *productname;
@property(nonatomic,copy)NSString *productsno;
@property(nonatomic,copy)NSString *producttype;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *statustext;
@property(nonatomic,copy)NSString *totalamoumt;
@property(nonatomic,copy)NSString *typeno;


+(mycustomerdata *)mycustomerdataWithdiction:(NSDictionary *)diction;

@end




