//
//  myclientManGroupCell.m
//  聚美医
//
//  Created by fenghuang on 15/9/10.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientManGroupCell.h"

@implementation myclientManGroupCell

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
        
        self.headimage = [[UIImageView alloc] init];
        [self addSubview:self.headimage];
        
        self.name = [[UILabel alloc] init];
        [self addSubview:self.name];
        
        self.project1 = [[UILabel alloc] init];
        [self addSubview:self.project1];
        
        self.project2 = [[UILabel alloc] init];
        [self addSubview:self.project2];
        
        self.project3 = [[UILabel alloc] init];
        [self addSubview:self.project3];
        
    }
    
    return self;
}

@end
