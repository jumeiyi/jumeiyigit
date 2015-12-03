//
//  myclientdiseaseediting.h
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pickerimageViewController.h"
@interface myclientdiseaseediting : UIViewController<UIImagePickerControllerDelegate,sendvaluedelegate,UIAlertViewDelegate>

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
@property(nonatomic,assign)NSInteger shoosebuttonindex;
@property(nonatomic,retain)NSMutableArray *imageURLary;
@property(nonatomic,assign)NSInteger imagearycount;

@property(nonatomic,retain)UIButton *addimagebtn;
@property(nonatomic,retain)UIButton *imagebtn1;
@property(nonatomic,retain)UIButton *imagebtn2;
@property(nonatomic,retain)UIButton *imagebtn3;
@property(nonatomic,retain)UIImage *image;
@property(nonatomic,retain)UIImage *image2;
@property(nonatomic,retain)UIImage *image3;
@property(nonatomic,assign)BOOL isimage1;
@property(nonatomic,assign)BOOL isimage2;
@property(nonatomic,assign)BOOL isimage3;

@end
