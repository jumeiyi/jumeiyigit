//
//  PointViewController.h
//  聚美医
//
//  Created by fenghuang on 15/11/13.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView *mytableview;
@property(nonatomic,retain)NSString *doctorsno;

@end
