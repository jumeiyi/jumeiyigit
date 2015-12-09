//
//  mymakerCell.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/4/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mymakerCell : UITableViewCell

//@property (retain, nonatomic)  UILabel *name;
//@property (retain, nonatomic)  UILabel *phonenumber;
//@property (retain, nonatomic)  UILabel *object;
//@property (retain, nonatomic)  UILabel *maketiem;
//@property (retain, nonatomic)  UILabel *tiemess;
//@property (retain, nonatomic)  UILabel *nametext;
//@property (retain, nonatomic)  UILabel *phonenumbertext;
//@property (retain, nonatomic)  UILabel *objecttext;
//@property (retain, nonatomic)  UILabel *maketiemtext;
//@property (retain, nonatomic)  UILabel *tiemesstext;
//
//@property (retain, nonatomic)  UILabel *shijianzhou1;
//@property (retain, nonatomic)  UILabel *shijianzhou2;
//@property (retain, nonatomic)  UILabel *shijianzhou3;
//@property (retain, nonatomic)  UILabel *jindushijianzhou;
//
//@property (retain, nonatomic)  UIImageView *shijianimage1;
//@property (retain, nonatomic)  UIImageView *shijianimage2;
//@property (retain, nonatomic)  UIImageView *shijianimage3;
//
//@property (retain, nonatomic)  UIImageView *shijianimagebg1;
//@property (retain, nonatomic)  UIImageView *shijianimagebg2;
//@property (retain, nonatomic)  UIImageView *shijianimagebg3;
//
//@property (retain, nonatomic)  UIButton *binglibtn;
//
//- (IBAction)upbingli:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phonenumber;
@property (weak, nonatomic) IBOutlet UILabel *object;
@property (weak, nonatomic) IBOutlet UILabel *maketiem;
@property (weak, nonatomic) IBOutlet UILabel *tiemess;

@property (weak, nonatomic) IBOutlet UILabel *shijianzhou1;
@property (weak, nonatomic) IBOutlet UILabel *shijianzhou2;
@property (weak, nonatomic) IBOutlet UILabel *shijianzhou3;

@property (weak, nonatomic) IBOutlet UIImageView *shijianimage1;
@property (weak, nonatomic) IBOutlet UIImageView *shijianimage2;
@property (weak, nonatomic) IBOutlet UIImageView *shijianimage3;

@property (weak, nonatomic) IBOutlet UIButton *binglibtn;

- (IBAction)upbingli:(id)sender;

@end
