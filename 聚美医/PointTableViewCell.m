//
//  PointTableViewCell.m
//  聚美医
//
//  Created by fenghuang on 15/11/13.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "PointTableViewCell.h"

@implementation PointTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   // [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{

}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bgimage = [[UIImageView alloc] init];
        [self addSubview:self.bgimage];
        
        self.whiteview = [[UIImageView alloc] init];
        [self.bgimage addSubview:self.whiteview];
        
        self.jifen = [[UILabel alloc] init];
        [self addSubview:self.jifen];
        
        self.jifennumber = [[UILabel alloc] init];
        [self addSubview:self.jifennumber];
        
        self.jifenmingxi = [[UILabel alloc] init];
        [self addSubview:self.jifenmingxi];
        
        self.celltitle = [[UILabel alloc] init];
        [self addSubview:self.celltitle];
        
        self.celltime = [[UILabel alloc] init];
        [self addSubview:self.celltime];
        
        self.cellnumber = [[UILabel alloc] init];
        [self addSubview:self.cellnumber];
        
    }
    
    return self;
}


@end
