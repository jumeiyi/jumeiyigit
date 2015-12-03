//
//  myclientTheConditionRecordViewController.h
//  聚美医
//
//  Created by fenghuang on 15/9/7.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "pickerimageViewController.h"

@interface myclientTheConditionRecordViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate,AVAudioRecorderDelegate,sendvaluedelegate>

{

    
    UITableView *_tableview;
    NSMutableArray *_custommesarray;
    
    UIImageView *_images;
    UITextField *_text;
    
    BOOL _isLoading;
    NSTimer *_timer;
    NSTimer *_messetimer;
}
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,assign) BOOL recording;
@property (nonatomic,strong) NSString *fileName;

@property(nonatomic,retain)NSString *doctorsno;
@property(nonatomic,retain)NSString *customerSno;
@property(nonatomic,retain)NSString *fromType;
@property(nonatomic,retain)NSString *firstWord;
@property(nonatomic,retain)NSString *strPageindex;
@property(nonatomic,retain)NSString *strPagesize;


@property(nonatomic,retain)NSString *fileType;
@property(nonatomic,retain)NSString *textInfo;
@property(nonatomic,retain)NSString *data;
@property(nonatomic,retain)NSString *fileTypeName;
@property(nonatomic,retain)NSString *lastInfoSno;
@property(nonatomic,retain)NSString *noticeDt;
@property(nonatomic,retain)NSString *orderDetailSno;

@property(nonatomic,assign)BOOL isRefreshLoading;

-(void)sendimage:(UIImage *)imagess;

@end
