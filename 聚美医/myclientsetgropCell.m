//
//  myclientsetgropCell.m
//  聚美医
//
//  Created by fenghuang on 15/9/2.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientsetgropCell.h"

@implementation myclientsetgropCell

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
        
        self.shooseimage = [[UIImageView alloc] init];
        [self addSubview:self.shooseimage];
        
    }
    
    return self;
}
@end
