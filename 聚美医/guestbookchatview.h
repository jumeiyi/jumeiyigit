//
//  guestbookchatview.h
//  LaserCosmetology
//
//  Created by fenghuang on 15/5/6.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lables.h"

@interface guestbookchatview : UIView

@property(nonatomic,retain)UIView *myview;

@property(nonatomic,retain)UIImageView *lefetimage;
@property(nonatomic,retain)UIImageView *rigthimage;

@property(nonatomic,retain)lables *lefetcontents;
@property(nonatomic,retain)lables *rigthcontents;

@property(nonatomic,retain)UIImageView *lefetPhoto;
@property(nonatomic,retain)UIImageView *rigthPhoto;

-(id)initWithFrame:(CGRect)frame andwidth:(CGFloat)width tyfrom:(NSString *)tyfrom andcontents:(NSString *)contents creatdate:(NSString *)creatdate andimages:(NSData *)imagesData filetype:(NSString *)filetype;

@end
