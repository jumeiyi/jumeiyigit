//
//  myclientobservedisease.h
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshControl.h"

@interface myclientobservedisease : UIViewController<UITableViewDataSource,UITableViewDelegate,RefreshControlDelegate>

{
    NSMutableArray *_medicalrecorddata;
    
    RefreshControl *_refreshControl;

}
@property (nonatomic,strong)RefreshControl * refreshControl;

@property(nonatomic,retain)UITableView *mytableview;
@property(nonatomic,retain)NSString *beautifydetailsno;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customerSno;
@property(nonatomic,retain)NSString *detailsno;
@property(nonatomic,retain)NSMutableArray *contentshightary;
@end
