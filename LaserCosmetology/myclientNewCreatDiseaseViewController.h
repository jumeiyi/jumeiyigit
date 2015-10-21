//
//  myclientNewCreatDiseaseViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/28.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pickerimageViewController.h"

@interface myclientNewCreatDiseaseViewController : UIViewController<sendvaluedelegate,UIAlertViewDelegate>

{
    UIView *_editingview;
    UITextView *_mytextview;
    
    NSMutableArray *_imagearry;
    UIButton *_addimagebtn;
    
}
@property(nonatomic,retain)NSMutableArray *imagedataary;
@property(nonatomic,retain)NSString *medicalhistorysno;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSData *imagedat;
@property(nonatomic,retain)NSString *customersno;
@property(nonatomic,retain)NSString *orderDetailSno;
@property(nonatomic,assign)NSInteger a;
@end
