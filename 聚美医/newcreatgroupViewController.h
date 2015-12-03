//
//  newcreatgroupViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/21.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newcreatgroupViewController : UIViewController

{
    
    NSMutableData *_data;
    
    UIView *_manberview;
    UIButton *_addbtn;
    UIButton *_subtraction;
    
    UITextField *_grouptitle;
}
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *groupstr;
@property(nonatomic,retain)NSString *groupid;
@property(nonatomic,retain)NSString *groupname;
@property(nonatomic,retain)NSString *customersIDs;
@property(nonatomic,retain)NSMutableArray *manberarray;
@property(nonatomic,retain)NSMutableArray *gentmanberarrays;
@property(nonatomic,retain)NSMutableArray *getmanberarrayIDs;
@property(nonatomic,assign)BOOL iscancel;

-(void)getManberarrayWithary:(NSArray *)ary;

@end
