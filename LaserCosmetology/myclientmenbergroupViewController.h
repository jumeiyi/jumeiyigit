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
}

@property(nonatomic,retain)NSString *doctorsno;

@end
