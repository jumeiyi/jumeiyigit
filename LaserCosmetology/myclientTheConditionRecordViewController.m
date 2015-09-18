//
//  myclientTheConditionRecordViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/7.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientTheConditionRecordViewController.h"
#import "TopBarView.h"
#import "CustomerMessage.h"
#import "guestbookchatview.h"
#import "NSString+DocumentPath.h"

@interface myclientTheConditionRecordViewController ()

@end

@implementation myclientTheConditionRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"病情记录";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaazzzs) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [topbar addSubview:save];
    

    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 60)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableview];


    _images = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 60, self.view.bounds.size.width, 60)];
    _images.image = [UIImage imageNamed:@"dhk_02"];
    _images.userInteractionEnabled = YES;
    _images.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_images];

//    UIButton *Sound = [[UIButton alloc] initWithFrame:CGRectMake(5, 12, 20, 30)];
//    [Sound setBackgroundImage:[UIImage imageNamed:@"liaotiananniu"] forState:UIControlStateNormal];
//    [Sound addTarget:self action:@selector(beginRecord) forControlEvents:UIControlEventTouchDown];
//    [Sound addTarget:self action:@selector(finishRecord) forControlEvents:UIControlEventTouchUpInside];
//    [_images addSubview:Sound];

//    UIButton *addimage = [[UIButton alloc] initWithFrame:CGRectMake(35, 15, 25, 25)];
//    [addimage setBackgroundImage:[UIImage imageNamed:@"liaotianjiahao"] forState:UIControlStateNormal];
//    [addimage addTarget:self action:@selector(doctoraddimageSendAMessage) forControlEvents:UIControlEventTouchUpInside];
//    [_images addSubview:addimage];

    _text = [[UITextField alloc] initWithFrame:CGRectMake(20, 10,self.view.bounds.size.width - 120, 35)];
    _text.backgroundColor = [UIColor whiteColor];
    _text.layer.masksToBounds = YES;
    _text.layer.cornerRadius = 3;
    [_images addSubview:_text];

    UIButton *sendmasses = [[UIButton alloc] initWithFrame:CGRectMake(_text.frame.size.width + _text.frame.origin.x + 15, 10, 60, 35)];
    [sendmasses setBackgroundImage:[UIImage imageNamed:@"xiaoxifasong"] forState:UIControlStateNormal];
    [sendmasses addTarget:self action:@selector(doctorSendAMessage) forControlEvents:UIControlEventTouchUpInside];
    [_images addSubview:sendmasses];


    self.fromType = @"";
    self.data = @"";
    self.fileTypeName = @"";
    self.lastInfoSno = @"";
    self.noticeDt = @"";
    self.orderDetailSno = @"";

    _custommesarray = [[NSMutableArray alloc] initWithCapacity:0];
  
    _messetimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(referenceViewmesse) userInfo:nil repeats:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_messetimer invalidate];
    _messetimer = nil;
}

-(void)referenceViewmesse
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        // self.view.transform=CGAffineTransformMakeTranslation(0, - deltaY);
        NSLog(@"deltaY = %f",deltaY);
        _images.frame = CGRectMake(0, self.view.bounds.size.height - 60 - 252, self.view.bounds.size.width, 60);
        _tableview.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 252 - 64 - 49);
    }];
}
-(void)keyboardHide:(NSNotification *)note
{
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        //self.view.transform = CGAffineTransformIdentity;
        _images.frame = CGRectMake(0, self.view.bounds.size.height - 60, self.view.bounds.size.width, 60);
        _tableview.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 60);
        
    }];
}

-(void)cometoback
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doctorSendAMessage
{
    //fromType发送类型(医生发给客 户:20150213142252612;客户发给医生20150213142231226);fileType发送文件类型(文字 20150213142908837;图片20150213142921851;音频20150213142939496;视频 20150213142950810)
    
    
    if ([_text.text isEqualToString:@""]) {
        
    }else{
        
        CustomerMessage *recod = [[CustomerMessage alloc] init];
        recod.TextInfo = _text.text;
        recod.FromType = @"20150213142252612";
        recod.FileType = @"20150213142908837";
        [_custommesarray insertObject:recod atIndex:0];
        [_tableview reloadData];
        
        
        self.fileType = @"20150213142908837";//文件类型，文字
        [self tableViewScrollCurrentIndexPath];
        
        self.textInfo = _text.text;
        self.fileTypeName = @"";
        
        _text.text = @"";
        
    }
    
    
    
}

-(void)doctoraddimageSendAMessage
{
    pickerimageViewController *picker = [[pickerimageViewController alloc] init];
    picker.delegate1 = self;
    [self.navigationController pushViewController:picker animated:YES];
    
    //    [self doctoraddimageSendAMessage:self.fileName];
    
}

-(void)sendimage:(UIImage *)imagess
{
    NSInteger a = arc4random() % 1000;
    NSInteger b = arc4random() % 1000;
    
    CustomerMessage *recod = [[CustomerMessage alloc] init];
    recod.FileType = @"20150213142921851";
    recod.FromType = @"20150213142252612";
    recod.PicSrc = [NSString stringWithFormat:@"%ld%ld.png",a,b];
    
    NSData *data = UIImageJPEGRepresentation(imagess, 0.4f);
    NSString *_encodedImageStr = [data base64Encoding];
    self.data = _encodedImageStr;
    
    NSMutableDictionary *dictionarray = [[NSMutableDictionary alloc] init];
    [dictionarray setValue:data forKey:recod.PicSrc];
    
    NSUserDefaults *myuser = [NSUserDefaults standardUserDefaults];
    [myuser setObject:dictionarray forKey:@"imagedictionarray"];
    [myuser synchronize];
    
    [_custommesarray insertObject:recod atIndex:0];//存入数组
    [self tableViewScrollCurrentIndexPath];
    NSLog(@"data1图片=%@",data);
    self.fileTypeName = @"png";
    
    
    //    UIImageView *yy = [[UIImageView alloc] initWithFrame:self.view.bounds];
    //    yy.image = [UIImage imageWithData:data];
    //    yy.backgroundColor =  [UIColor yellowColor];
    //    [self.view addSubview:yy];
    

}

#pragma mark tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _custommesarray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        UIView *cellview = [[UIView alloc] initWithFrame:cell.bounds];
        cellview.tag = 2;
        [cell addSubview:cellview];
    }
    CustomerMessage *cusmes = [_custommesarray objectAtIndex:_custommesarray.count - indexPath.row - 1];
    
    UIView *vi = (UIView *)[cell viewWithTag:2];
    UIView *vv = (UIView *)[vi viewWithTag:3];
    [vv removeFromSuperview];
    
    
    
    NSUserDefaults *myuser = [NSUserDefaults standardUserDefaults];
    NSDictionary *diction = [myuser objectForKey:@"imagedictionarray"];
    
    NSData *imagedata = [diction objectForKey:cusmes.PicSrc];
    
    //fromType发送类型(医生发给客 户:20150213142252612;客户发给医生20150213142231226);fileType发送文件类型(文字 20150213142908837;图片20150213142921851;音频20150213142939496;视频 20150213142950810)
    
    
    //医生发给客户
    if ([cusmes.FromType isEqualToString:@"20150213142252612"]) {
        
        //图片
        if ([cusmes.FileType isEqualToString:@"20150213142921851"]) {
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width tyfrom:@"yisheng" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
        }else if ([cusmes.FileType isEqualToString:@"20150213142908837"]){//文字
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width tyfrom:@"yisheng" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];    NSLog(@"文字来了，赋值(%@)",cusmes.TextInfo);
            chatview.tag = 3;
            [vi addSubview:chatview];
            
            
        }else if ([cusmes.FileType isEqualToString:@"20150213142939496"]){//音频
            
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width tyfrom:@"yisheng" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
            //视频
        }else{
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width tyfrom:@"yisheng" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
        }
        
        
    }else{
        
        //图片
        if ([cusmes.FileType isEqualToString:@"20150213142921851"]) {
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width  tyfrom:@"kehu" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
            //文字
        }else if ([cusmes.FileType isEqualToString:@"20150213142908837"]){
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width  tyfrom:@"kehu" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
            //音频
        }else if ([cusmes.FileType isEqualToString:@"20150213142939496"]){
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width  tyfrom:@"kehu" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
            //视频
        }else{
            
            guestbookchatview *chatview = [[guestbookchatview alloc] initWithFrame:self.view.bounds andwidth:self.view.bounds.size.width  tyfrom:@"kehu" andcontents:cusmes.TextInfo creatdate:cusmes.CreateDt andimages:imagedata filetype:cusmes.FileType];
            chatview.tag = 3;
            [vi addSubview:chatview];
            
        }
        
    }
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    
    NSLog(@"获取屏幕尺寸 width%f = height%f",width,height);
    
    return cell;
    
}
//计算文字内容在规定宽度时候它的显示高度
-(CGFloat)contentsWithnsstring:(NSString *)str
{
    UIFont *font = [UIFont systemFontOfSize:17];
    CGSize size = CGSizeMake(250,2000);
    CGRect labelRect = [str boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    CGFloat gaodu = labelRect.size.height;
    return gaodu;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomerMessage *cusmes = [_custommesarray objectAtIndex:_custommesarray.count - indexPath.row - 1];
    
    if ([cusmes.FileType isEqualToString:@"20150213142908837"]) {
        return [self contentsWithnsstring:cusmes.TextInfo] + 40;
    }else{
        return 310;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableViewScrollCurrentIndexPath
{
    if (_custommesarray.count > 0) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:_custommesarray.count-1 inSection:0];
        [_tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    [self.view endEditing:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static int a = 1;
    // 假设偏移表格高度的20%进行刷新
    
    if (!_isLoading) { // 判断是否处于刷新状态，刷新中就不执行
        // 取内容的高度：
        //    如果内容高度大于UITableView高度，就取TableView高度
        //    如果内容高度小于UITableView高度，就取内容的实际高度
        float height = scrollView.contentSize.height > _tableview.frame.size.height ?_tableview.frame.size.height : scrollView.contentSize.height;
        if ((height - scrollView.contentSize.height + scrollView.contentOffset.y) / height > 0.2) {
            // 调用上拉刷新方法
            NSLog(@"到底了");
        }
        if (- scrollView.contentOffset.y / _tableview.frame.size.height > 0.2) {
            _isLoading = YES;
            a++;
            // 调用下拉刷新方法
            NSLog(@"到顶了");
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.50 target:self selector:@selector(shuaxin) userInfo:nil repeats:NO];
   
            self.isRefreshLoading = NO;
        }
    }
    
}
-(void)shuaxin
{
    _isLoading = NO;
}

-(void)beginRecord
{
    
    self.recording=NO;
    [self.recorder stop];
    self.recorder=nil;
    
    NSDictionary *settings=[NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithFloat:8000],AVSampleRateKey,
                            [NSNumber numberWithInt:kAudioFormatLinearPCM],AVFormatIDKey,
                            [NSNumber numberWithInt:1],AVNumberOfChannelsKey,
                            [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                            [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,
                            [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,
                            nil];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *fileName = [NSString stringWithFormat:@"rec_%@.wav",[dateFormater stringFromDate:now]];
    self.fileName=fileName;
    NSString *filePath=[NSString documentPathWith:fileName];
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    NSError *error;
    self.recorder=[[AVAudioRecorder alloc]initWithURL:fileUrl settings:settings error:&error];
    [self.recorder prepareToRecord];
    [self.recorder setMeteringEnabled:YES];
    [self.recorder peakPowerForChannel:0];
    [self.recorder record];
    
    NSLog(@"开始录音");
    
}
-(void)finishRecord
{
    self.recording = NO;
    [self.recorder stop];
    self.recorder=nil;
    
    CustomerMessage *cusmes = [[CustomerMessage alloc] init];
    cusmes.TextInfo = self.fileName;
    
    NSString *filePath=[NSString documentPathWith:self.fileName];
    NSData *datA = [NSData dataWithContentsOfFile:filePath];
    
    NSString *_encodedImageStr = [datA base64Encoding];
    self.data = _encodedImageStr;
    
    NSLog(@"音频 =self.data %@ == %@",self.data,self.fileName);
    
    [_custommesarray addObject:cusmes];
    [_tableview reloadData];
    [self tableViewScrollCurrentIndexPath];
    

    
    NSLog(@"录音结束");
}
-(void)initPlayer{
    //初始化播放器的时候如下设置
    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,
                            sizeof(sessionCategory),
                            &sessionCategory);
    
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                             sizeof (audioRouteOverride),
                             &audioRouteOverride);
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //默认情况下扬声器播放
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    audioSession = nil;
}
-(void)doctoraddimageSendAMessage:(NSString *)content//content是音频文件名
{
    if(self.player.isPlaying){
        
        [self.player stop];
    }
    //播放
    NSString *filePath=[NSString documentPathWith:content];
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    [self initPlayer];
    NSError *error;
    self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:&error];
    [self.player setVolume:1];
    [self.player prepareToPlay];
    [self.player setDelegate:self];
    [self.player play];
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    
    NSLog(@"播放录音");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)comebacksaaazzzs
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}


@end