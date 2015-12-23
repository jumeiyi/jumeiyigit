//
//  ShouYeViewController.h
//  聚美医
//
//  Created by fenghuang on 15/12/4.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShouYeViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,NSXMLParserDelegate>
{

    NSMutableData *webData;
    NSMutableString *_soapResults;
    NSXMLParser *xmlParser;
    
    //储存被点击的按钮
    NSMutableArray *_timeclickarray;
    NSMutableArray *_yuyueRetary;
    
    UIView *_backview;
    UIView *_tunningview;
    
    NSArray *_monaay;
    NSMutableArray *_timeDataary;
    
    
    UITextField *_phonenumber;
    UITextField *_testnumber;
    UIButton *_testbtn;
    NSTimer *_timer;
    UIView *_view0;
    UIView *_view1;
    UIImageView *_backgroundimage;
    UIView *_denglubackgroundimage;
    
}
@property(nonatomic,assign)BOOL Isxieyi;
@property(nonatomic,assign)BOOL  personordocter;
@property(nonatomic,assign)BOOL yidenglu;
@property(nonatomic,retain)NSString *isNew;
@property(nonatomic,retain)NSString *Contents;
@property(nonatomic,retain)NSString *Description;
@property(nonatomic,retain)NSString *PicSrc;
@property(nonatomic,retain)NSString *Title;
@property(nonatomic,retain)NSString *recommendNo;

@property(nonatomic,retain)UIImageView *deadimage;
@property(nonatomic,retain)NSString *doctorSno;
@property(nonatomic,retain)UILabel *name;
@property(nonatomic,retain)UILabel *hospital;
@property(nonatomic,retain)UIImageView *personimage;
@property(nonatomic,retain)UIImageView *hospitalimage;

@property(nonatomic,assign)NSInteger *year;
@property(nonatomic,assign)NSInteger *month;
@property(nonatomic,assign)NSInteger *day;
@property(nonatomic,retain)NSMutableArray *dayarray;
@property(nonatomic,assign)NSInteger weekCount;
@property(nonatomic,retain)UILabel *kehu;
@property(nonatomic,retain)UILabel *kehushu;
@property(nonatomic,retain)UILabel *yuyueshu;

@property(nonatomic,retain)UIButton *redbtn;
@property(nonatomic,assign)NSInteger times;
@end

