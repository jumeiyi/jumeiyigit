//
//  myclientmenbergroupViewController.h
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myclientmenbergroupViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

{
     NSMutableArray *_mycustomerDataarray;
    NSMutableData *_data;
    
    UIView *_manberview;
    UIButton *_addbtn;
    UIButton *_subtraction;
}

@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *groupstr;
@property(nonatomic,retain)NSMutableArray *manberarray;

@end
