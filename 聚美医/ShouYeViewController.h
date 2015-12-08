//
//  ShouYeViewController.h
//  聚美医
//
//  Created by fenghuang on 15/12/4.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShouYeViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
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
    NSMutableArray *_timeDataary ;
}
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
@end

