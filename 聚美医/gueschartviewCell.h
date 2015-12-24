//
//  gueschartviewCell.h
//  聚美医
//
//  Created by fenghuang on 15/12/24.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lables.h"

@interface gueschartviewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *bgimage;
@property(nonatomic,retain)UIImageView *headimage;
@property(nonatomic,retain)lables *contents;
@property(nonatomic,retain)UILabel *creattimes;

@end
