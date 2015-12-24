//
//  gueschartviewCell.m
//  聚美医
//
//  Created by fenghuang on 15/12/24.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "gueschartviewCell.h"

@implementation gueschartviewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

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
        self.bgimage.userInteractionEnabled = YES;
        [self addSubview:self.bgimage];
        
        self.headimage = [[UIImageView alloc] init];
        [self addSubview:self.headimage];
        
        self.contents = [[lables alloc] init];
        self.contents.numberOfLines = 0;
        [self.bgimage addSubview:self.contents];
        
        self.creattimes = [[UILabel alloc] init];
        [self.bgimage addSubview:self.creattimes];
        
    }
    
    return self;

}



@end
