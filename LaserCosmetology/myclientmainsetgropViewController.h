//
//  myclientmainsetgropViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/8.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myclientmainsetgropViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>

{
    NSMutableArray *_titleary;
    NSMutableArray *_mycustomerDataarray;
    NSMutableData *_data;
}

@property(nonatomic,retain)UITableView *mytableview;
@property(nonatomic,retain)NSString *doctorsno;

@end
