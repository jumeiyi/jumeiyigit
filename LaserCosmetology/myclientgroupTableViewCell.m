//
//  myclientgroupTableViewCell.m
//  聚美医
//
//  Created by fenghuang on 15/9/8.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientgroupTableViewCell.h"

@implementation myclientgroupTableViewCell

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
        
        self.grouplable = [[UILabel alloc] init];
        [self addSubview:self.grouplable];

        
    }
    
    return self;
}

@end
