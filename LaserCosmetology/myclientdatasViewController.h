//
//  myclientdatasViewController.h
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myclientdatasViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate,NSXMLParserDelegate>

{
    NSMutableArray *_imageofhead;
    NSMutableArray *_titleary;
    
     NSMutableData *_data;
}
@property(nonatomic,retain)NSString *doctorSno;

@end
