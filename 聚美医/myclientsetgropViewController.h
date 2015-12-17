//
//  myclientsetgropViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/2.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myclientsetgropViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_titleary;
    NSMutableArray *_mycustomerDataarray;
    NSMutableData *_data;
    
    NSMutableArray *_groupname;
     NSMutableArray *_groupman;
     NSMutableArray *_groupids;
    NSMutableArray *_shooseindexs;
}
@property(nonatomic,retain)UITableView *mytableview;

@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customersno;
@property(nonatomic,retain)NSString *groupid;
@property(nonatomic,retain)NSString *shoosegroupname;
@end
