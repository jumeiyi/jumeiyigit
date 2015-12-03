//
//  myclientdatasViewCell.m
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientdatasViewCell.h"

@implementation myclientdatasViewCell

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
        
        self.sex = [[UIImageView alloc] init];
        [self addSubview:self.sex];
        
        self.name = [[UILabel alloc] init];
        [self addSubview:self.name];
        
        self.age = [[UILabel alloc] init];
        [self addSubview:self.age];
        
        self.suxian = [[UIImageView alloc] init];
        [self addSubview:self.suxian];
        
        self.city = [[UILabel alloc] init];
        [self addSubview:self.city];
        
        self.payattention = [[UIButton alloc] init];
        [self addSubview:self.payattention];
        
        //..............................

        self.titleimage = [[UIImageView alloc] init];
        [self addSubview:self.titleimage];
        
        self.titles = [[UILabel alloc] init];
        [self addSubview:self.titles];
        
        self.contents = [[UILabel alloc] init];
        [self addSubview:self.contents];
        
        self.right = [[UIImageView alloc] init];
        [self addSubview:self.right];
        
        //.................
        
        self.riliimage = [[UIImageView alloc] init];
        [self addSubview:self.riliimage];
        
        self.jilutext = [[UILabel alloc] init];
        [self addSubview:self.jilutext];
        
        self.date = [[UILabel alloc] init];
        [self addSubview:self.date];

        
        self.projectname = [[UILabel alloc] init];
        [self addSubview:self.projectname];
        
        self.inspect = [[UIButton alloc] init];
        [self addSubview:self.inspect];
        

    }

    return self;
}

@end
