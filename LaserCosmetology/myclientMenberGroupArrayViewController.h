//
//  myclientMenberGroupArrayViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshControl.h"

@interface myclientMenberGroupArrayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RefreshControlDelegate,UISearchBarDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>

{
    
    
    UITableView *_tableview;
    
    RefreshControl *_refreshControl;
    BOOL _isLoading;
    NSTimer *_timer1;
    
    UIView *btnview;
    UIView *shoosebtnview;
    UIImageView *_btnimage;
    NSMutableArray *_shooesproject;
    UIButton *_groupbtn;
    UIButton *_shoosebtn;
    
    NSMutableData *_data;
    
    NSMutableArray *_groupsname;
    NSMutableArray *_groupstr;
    NSMutableArray *_sectionindex;
    NSMutableArray *_insectionofrow;
    
    NSMutableArray *_sectionary;
    
    NSMutableArray *_getmanberary;
}

@property(nonatomic,assign)BOOL istop;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customersno;
@property(nonatomic,assign)NSInteger a;
@property(nonatomic,retain)NSString *typeInfo;
@property(nonatomic,retain)NSString *firstWord;
@property (nonatomic,strong)RefreshControl * refreshControl;
@property(nonatomic,retain)UISearchBar *searchBar;
@property(nonatomic,retain)UISearchDisplayController *searchDisplay;
@property(nonatomic,assign)BOOL isgroupes;
@property(nonatomic,assign)BOOL isproject;
@property(nonatomic,retain)NSString *group;
@property(nonatomic,retain)NSString *groupid;
@property(nonatomic,retain)NSString *groupname;
@property(nonatomic,retain)NSString *customersIDs;//以逗号分隔
@property(nonatomic,retain)UIScrollView *myscrollview;

@end
