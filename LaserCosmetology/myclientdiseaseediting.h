//
//  myclientdiseaseediting.h
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pickerimageViewController.h"
@interface myclientdiseaseediting : UIViewController<UIImagePickerControllerDelegate,sendvaluedelegate>

{
    NSMutableArray *_imagearry;
    UIView *_editingview;
    UIButton *_addimagebtn;
    UITextView *_mytextview;
    
    UIView *_imagebackview;
}
@property(nonatomic,retain)NSString *imagelist;
@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *medicalhistorysno;
@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSMutableArray *imagedataary;

@property(nonatomic,assign)NSInteger cancelbtnindex;
@property(nonatomic,retain)NSMutableArray *imageURLary;
@property(nonatomic,assign)NSInteger imagearycount;
@end
