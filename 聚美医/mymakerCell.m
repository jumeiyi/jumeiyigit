//
//  mymakerCell.m
//  LaserCosmetology
//
//  Created by fenghuang on 15/4/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "mymakerCell.h"

@implementation mymakerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)upbingli:(id)sender {
    
    UITableViewCell *cell = (UITableViewCell*)[[sender superview] superview];
   
    UITableView *table = (UITableView*)[[[[sender superview] superview] superview] superview];
    
    NSIndexPath *indexPath = [table indexPathForCell:cell];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updata" object:[NSString stringWithFormat:@"%ld",indexPath.row]];
}

//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        
//        self.name = [[UILabel alloc] init];
//        [self addSubview:self.name];
//        
//        self.phonenumber = [[UILabel alloc] init];
//        [self addSubview:self.phonenumber];
//        
//        self.object = [[UILabel alloc] init];
//        [self addSubview:self.object];
//        
//        self.maketiem = [[UILabel alloc] init];
//        [self addSubview:self.maketiem];
//        
//        self.tiemess = [[UILabel alloc] init];
//        [self addSubview:self.tiemess];
//        
//        self.nametext = [[UILabel alloc] init];
//        [self addSubview:self.nametext];
//        
//        self.phonenumbertext = [[UILabel alloc] init];
//        [self addSubview:self.phonenumbertext];
//        
//        self.objecttext = [[UILabel alloc] init];
//        [self addSubview:self.objecttext];
//        
//        self.maketiemtext = [[UILabel alloc] init];
//        [self addSubview:self.maketiemtext];
//        
//        self.tiemesstext = [[UILabel alloc] init];
//        [self addSubview:self.tiemesstext];
//        
//        self.shijianzhou1 = [[UILabel alloc] init];
//        [self addSubview:self.shijianzhou1];
//        
//        self.shijianzhou2 = [[UILabel alloc] init];
//        [self addSubview:self.shijianzhou2];
//        
//        self.shijianzhou3 = [[UILabel alloc] init];
//        [self addSubview:self.shijianzhou3];
//        
//        self.shijianimage1 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimage1];
//        
//        self.shijianimage2 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimage2];
//        
//        self.shijianimage3 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimage3];
//        
//        self.shijianimagebg1 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimagebg1];
//        
//        self.shijianimagebg2 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimagebg2];
//        
//        self.shijianimagebg3 = [[UIImageView alloc] init];
//        [self addSubview:self.shijianimagebg3];
//        
//        self.binglibtn = [[UIButton alloc] init];
//        [self.binglibtn addTarget:self action:@selector(upbingli:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.binglibtn];
//    }
//
//    return self;
//
//}

@end
