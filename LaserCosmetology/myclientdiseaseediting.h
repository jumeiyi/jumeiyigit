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
}
@end
