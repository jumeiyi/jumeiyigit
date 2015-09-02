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
}
@property(nonatomic,retain)UITableView *mytableview;

@end
