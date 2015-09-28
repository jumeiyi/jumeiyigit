//
//  myclientobservedisease.h
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myclientobservedisease : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_medicalrecorddata;

}
@property(nonatomic,retain)UITableView *mytableview;
@property(nonatomic,retain)NSString *beautifydetailsno;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customerSno;
@property(nonatomic,retain)NSString *detailsno;
@end
