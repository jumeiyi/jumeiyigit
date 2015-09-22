//
//  mycustomerdata.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/4/15.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mycustomerdata : NSObject

//@property(nonatomic,copy)NSString *BuyProductNames;
//@property(nonatomic,copy)NSString *CellPhone;
//@property(nonatomic,copy)NSString *FirstSearchWord;
//@property(nonatomic,copy)NSString *PicSrc;
//@property(nonatomic,copy)NSString *Sno;
//@property(nonatomic,copy)NSString *TrueName;
//
//@property(nonatomic,copy)NSString *infoid;
//@property(nonatomic,copy)NSString *nickname;
//@property(nonatomic,copy)NSString *truename;
//@property(nonatomic,copy)NSString *agecount;
//@property(nonatomic,copy)NSString *birthday;
//@property(nonatomic,copy)NSString *address;
//@property(nonatomic,copy)NSString *sextype;
//@property(nonatomic,copy)NSString *iscanuse;
//@property(nonatomic,copy)NSString *remark;
//@property(nonatomic,copy)NSString *createdt;
//@property(nonatomic,copy)NSString *createby;
//@property(nonatomic,copy)NSString *lastchangedt;
//@property(nonatomic,copy)NSString *lastchangeby;
//@property(nonatomic,copy)NSString *picsrc;
//@property(nonatomic,copy)NSString *levelsno;
//@property(nonatomic,copy)NSString *pointcount;
//@property(nonatomic,copy)NSString *firstsearchword;
//@property(nonatomic,copy)NSString *doctorsno;
//@property(nonatomic,copy)NSString *agetype;
//@property(nonatomic,copy)NSString *iostoken;
//@property(nonatomic,copy)NSString *cellphone;
//@property(nonatomic,copy)NSString *buyproductnames;
//@property(nonatomic,copy)NSString *rownumber;

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

+(mycustomerdata *)mycustomerdataWithdiction:(NSDictionary *)diction;

@end




