//
//  myclientmainsetgropViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/8.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOpeartionManagerOfme.h"

@interface myclientmainsetgropViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_titleary;
    NSMutableArray *_mycustomerDataarray;
    
    NSMutableArray *_groupname;
    NSMutableArray *_groupman;
    
}

@property(nonatomic,retain)UITableView *mytableview;
@property(nonatomic,retain)NSString *doctorsno;

@property(nonatomic,retain)AFHTTPRequestOpeartionManagerOfme *requsetmanager;

@end
