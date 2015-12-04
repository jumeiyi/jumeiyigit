//
//  ShareViewController.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/3/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController<NSXMLParserDelegate>

{

    
    NSMutableData *webData;
    NSMutableString *_soapResults;
    NSXMLParser *xmlParser;
}
@property(nonatomic,retain)NSString *userSno;
@property(nonatomic,retain)UIImageView *qrimage;
@property(nonatomic,retain)NSString *myname;
@end
