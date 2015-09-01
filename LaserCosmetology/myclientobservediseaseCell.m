//
//  myclientobservediseaseCell.m
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientobservediseaseCell.h"

@implementation myclientobservediseaseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.date = [[UILabel alloc] init];
        [self addSubview:self.date];
        
        self.editingbtn = [[UIButton alloc] init];
        [self.editingbtn addTarget:self action:@selector(editingbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.editingbtn];
        
        self.cancell = [[UIButton alloc] init];
        [self.cancell addTarget:self action:@selector(cancellclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancell];
        
        self.contents = [[UILabel alloc] init];
        [self addSubview:self.contents];
        
        self.image1 = [[UIImageView alloc] init];
        [self addSubview:self.image1];
        
        self.image2 = [[UIImageView alloc] init];
        [self addSubview:self.image2];
        
        self.image3 = [[UIImageView alloc] init];
        [self addSubview:self.image3];
        
        
    }

    return self;
}

-(void)editingbtnclick:(UIButton *)btn {
    
    UITableViewCell *cell = (UITableViewCell*) [btn superview];
    UITableView *table = (UITableView*)[[[btn superview] superview] superview];
    NSIndexPath *indexPath = [table indexPathForCell:cell];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"diseaseeditingbtnclick" object:[NSString stringWithFormat:@"%ld",indexPath.row]];
}
-(void)cancellclick:(UIButton *)button {

    UITableViewCell *cell = (UITableViewCell*) [button superview];
    UITableView *table = (UITableView*)[[[button superview] superview] superview];
    NSIndexPath *indexPath = [table indexPathForCell:cell];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"diseasequpingjia" object:[NSString stringWithFormat:@"%ld",indexPath.row]];
}

@end
