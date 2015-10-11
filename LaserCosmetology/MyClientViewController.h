//
//  MyClientViewController.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/3/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshControl.h"


@interface MyClientViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RefreshControlDelegate,UISearchBarDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>

{
    
    
    UITableView *_tableview;
    NSMutableArray *_mycustomerDataarray;
    
    NSMutableArray *_headnamearray;
    RefreshControl *_refreshControl;
    BOOL _isLoading;
    NSTimer *_timer1;
    
     UIView *btnview;
    UIView *shoosebtnview;
    UIImageView *_btnimage;
    NSMutableArray *_shooesproject;
    NSMutableArray *_groups;
    NSMutableArray *_groupIDarray;
    UIButton *_groupbtn;
    UIButton *_shoosebtn;
    
     NSMutableData *_data;
    NSMutableArray *_allgroup;
}
@property(nonatomic,assign)BOOL istop;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customersno;
@property(nonatomic,assign)NSInteger a;
@property(nonatomic,retain)NSString *typeInfo;
@property(nonatomic,retain)NSString *firstWord;
@property(nonatomic,retain)NSString *searchcontents;
@property(nonatomic,strong)RefreshControl * refreshControl;
@property(nonatomic,retain)UISearchBar *searchBar;
@property(nonatomic,retain)UISearchDisplayController *searchDisplay;
@property(nonatomic,assign)BOOL isgroupes;
@property(nonatomic,assign)BOOL isproject;
@property(nonatomic,assign)BOOL IsServiced;
@property(nonatomic,retain)NSString *group;

@end
