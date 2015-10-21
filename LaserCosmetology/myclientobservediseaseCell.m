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
        
        self.btn1 = [[UIButton alloc] init];
        [self.btn1 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn1.tag = 120;
        [self addSubview:self.btn1];
        
        self.btn2 = [[UIButton alloc] init];
        [self.btn2 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn2.tag = 121;
        [self addSubview:self.btn2];
        
        self.btn3 = [[UIButton alloc] init];
        [self.btn3 addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn3.tag = 122;
        [self addSubview:self.btn3];
        
        
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

-(void)btnclick:(UIButton *)btn
{

    UITableViewCell *cell = (UITableViewCell*) [btn superview];
    UITableView *table = (UITableView*)[[[btn superview] superview] superview];
    NSIndexPath *indexPath = [table indexPathForCell:cell];
    
    
    NSLog(@"btn.tag= %ld-----indexPath.row = %ld",btn.tag,indexPath.row);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pusimage" object:[NSString stringWithFormat:@"%ld/%ld",btn.tag,indexPath.row]];
}


@end
