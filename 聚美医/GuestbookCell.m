//
//  GuestbookCell.m
//  LaserCosmetology
//
//  Created by fenghuang on 15/3/10.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "GuestbookCell.h"

@implementation GuestbookCell

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
        
        self.customename = [[UILabel alloc] init];
        [self addSubview:self.customename];
        
        self.bookcontents = [[UILabel alloc] init];
        [self addSubview:self.bookcontents];
        
        self.notrechis = [[UILabel alloc] init];
        [self addSubview:self.notrechis];
        
        self.thetiems = [[UILabel alloc] init];
        [self addSubview:self.thetiems];
    }
    return self;

}
@end


