//
//  DoctorMainViewController.m
//  LaserCosmetology
//
//  Created by fenghuang on 15/3/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//
#define UID @"wdc001"
#define PSW @"dcg658"

#import "DoctorMainViewController.h"
#import "TopBarView.h"
//#import "BottomBarView.h"
#import "PerfectDataViewController.h"
#import "GongNengSheZhi.h"
#import "MyClientViewController.h"
#import "mymakeController.h"
#import "GuestbookViewController.h"
#import "CustomerCareViewController.h"
#import "CustomerEvaluationViewController.h"
#import "YuYueShiJianBiaoShuJu.h"
#import "WEBViewController.h"
#import "ShareViewController.h"
#import "QRCodeReaderViewController.h"
#import "QRCodeReader.h"
#import "HuQiJingsharManage.h"
#import "PrefixHeader.pch"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "PointViewController.h"

@interface DoctorMainViewController ()

@end

@implementation DoctorMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getdate];
    
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    background.image = [UIImage imageNamed:@"huidi"];
    background.userInteractionEnabled = YES;
    [self.view addSubview:background];
    
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 140, 25)];
    titilelable.text = @"医生个人中心";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];

     float botomerhight = 0.130667 * self.view.bounds.size.width;
    
    float buttonH = ((self.view.bounds.size.height - 64 - botomerhight) - 10 - (5*5))/4;
    float withd = (self.view.bounds.size.width - 25)/2;
    float withd1 = self.view.bounds.size.width - 18;
    
    //我的时间
        UIImageView *mytimeimage = [[UIImageView alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:0], withd, buttonH)];
    mytimeimage.image = [UIImage imageNamed:@"yisheng_03"];
    mytimeimage.userInteractionEnabled = YES;
    [self.view addSubview:mytimeimage];

    UIButton *buttun = [[UIButton alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:0], withd, buttonH)];
    buttun.tag = 10;
    [buttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttun];
    
    //完善资料
    UIImageView *PerfectInformation = [[UIImageView alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:0], withd, (buttonH - 5)/2)];
    PerfectInformation.image = [UIImage imageNamed:@"yisheng_05"];
    PerfectInformation.userInteractionEnabled = YES;
    [self.view addSubview:PerfectInformation];
    
    UIButton *PerfectInformationbuttun = [[UIButton alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:0], withd, (buttonH - 5)/2)];
    PerfectInformationbuttun.tag = 11;
    [PerfectInformationbuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:PerfectInformationbuttun];
    
    //分享
    UIImageView *Share = [[UIImageView alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:0] + (buttonH - 5)/2 + 5, withd, (buttonH - 5)/2)];
    Share.image = [UIImage imageNamed:@"wanshanziliao"];
    Share.userInteractionEnabled = YES;
    [self.view addSubview:Share];
    
    UIButton *Sharebuttun = [[UIButton alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:0]+ (buttonH - 5)/2 + 5, withd, (buttonH - 5)/2)];
    Sharebuttun.tag = 12;
    [Sharebuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Sharebuttun];

    //我的收益
    UIImageView *myProfit = [[UIImageView alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:1], withd, buttonH)];
    myProfit.image = [UIImage imageNamed:@"wodeyuyue"];
    myProfit.userInteractionEnabled = YES;
    [self.view addSubview:myProfit];
    
    UIButton *myProfitbuttun = [[UIButton alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:1], withd, buttonH)];
    myProfitbuttun.tag = 13;
    [myProfitbuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myProfitbuttun];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *ishaver = [def objectForKey:@"ishaver"];
    self.redsmlimgae = [[UIImageView alloc] initWithFrame:CGRectMake( withd, [self heigthwithnumber:1], 12, 12)];
    [self.view addSubview:self.redsmlimgae];
    if ([ishaver isEqualToString:@"1"]) {
        self.redsmlimgae.image = [UIImage imageNamed:@"个人中心44_03"];
    }
    
    
    //我的客户
    UIImageView *MyClient = [[UIImageView alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:1], withd, buttonH)];
    MyClient.image = [UIImage imageNamed:@"yisheng_12"];
    MyClient.userInteractionEnabled = YES;
    [self.view addSubview:MyClient];
    
    UIButton *MyClientbuttun = [[UIButton alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:1], withd, buttonH)];
    MyClientbuttun.tag = 14;
    [MyClientbuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MyClientbuttun];
    
    //客户留言
    UIImageView *Guestbook = [[UIImageView alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:2], withd1, buttonH)];
    Guestbook.image = [UIImage imageNamed:@"yisheng_15"];
    Guestbook.userInteractionEnabled = YES;
    [self.view addSubview:Guestbook];
    
    UIButton *Guestbookbuttun = [[UIButton alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:2], withd1, buttonH)];
    Guestbookbuttun.tag = 15;
    [Guestbookbuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Guestbookbuttun];
    
    //客户关怀
    UIImageView *Customercare = [[UIImageView alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:3], withd, buttonH)];
    Customercare.image = [UIImage imageNamed:@"yisheng_17"];
    Customercare.userInteractionEnabled = YES;
    [self.view addSubview:Customercare];
    
    UIButton *Customercarebuttun = [[UIButton alloc] initWithFrame:CGRectMake(10, [self heigthwithnumber:3], withd, buttonH)];
    Customercarebuttun.tag = 16;
    [Customercarebuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Customercarebuttun];
    
    //客户评价
    UIImageView *CustomerEvaluation = [[UIImageView alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:3], withd, buttonH)];
    CustomerEvaluation.image = [UIImage imageNamed:@"yisheng_19"];
    CustomerEvaluation.userInteractionEnabled = YES;
    [self.view addSubview:CustomerEvaluation];
    
    UIButton *CustomerEvaluationbuttun = [[UIButton alloc] initWithFrame:CGRectMake([self xwithanumber:1], [self heigthwithnumber:3], withd, buttonH)];
    CustomerEvaluationbuttun.tag = 17;
    [CustomerEvaluationbuttun addTarget:self action:@selector(doctersbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CustomerEvaluationbuttun];
    
    _monaay = [[NSArray alloc] initWithObjects:@"星期一",@"星期二", @"星期三",@"星期四",@"星期五",@"星期六",@"星期日",nil];
    

    
//    float imageX = self.view.bounds.size.width/5;
//    
//    UIImageView *tabBarimage0 = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height - botomerhight, self.view.bounds.size.width, botomerhight)];
//    tabBarimage0.image = [UIImage imageNamed:@"diseq"];
//    [self.view addSubview:tabBarimage0];
//    
//    
//    UIImageView *tabBarimage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX * 1,self.view.bounds.size.height - botomerhight, imageX - 10, botomerhight)];
//    tabBarimage.image = [UIImage imageNamed:@"anjianzuo"];
//    [self.view addSubview:tabBarimage];
//    
//    UIImageView *tabBarimage2 = [[UIImageView alloc] initWithFrame:CGRectMake(imageX * 3,self.view.bounds.size.height - botomerhight, imageX - 15, botomerhight)];
//    tabBarimage2.image = [UIImage imageNamed:@"anjianyoub"];
//    [self.view addSubview:tabBarimage2];
//    
//    BottomBarView *botom = [[BottomBarView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height - botomerhight, self.view.bounds.size.width, botomerhight)];
//    [self.view addSubview:botom];
    
    NSDate*date = [NSDate date];
    NSString *date1 = [self weekdayStringFromDate:date];
    
    if ([date1 isEqualToString:@"周一"]) {
        self.weekCount = 1;
    }else if ([date1 isEqualToString:@"周二"]){
        self.weekCount = 2;
    }else if ([date1 isEqualToString:@"周三"]){
        self.weekCount = 3;
    }else if ([date1 isEqualToString:@"周四"]){
        self.weekCount = 4;
    }else if ([date1 isEqualToString:@"周五"]){
        self.weekCount = 5;
    }else if ([date1 isEqualToString:@"周六"]){
        self.weekCount = 6;
    }else{
        self.weekCount = 7;
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    self.doctorSno =  [userdf objectForKey:@"customerSno"];//这个实际上医生的索引
    self.loginToken = [userdf objectForKey:@"loginToken"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(personbackbuttonclicka) name:@"dengluye" object:nil];
 [self soaprequstWithdoctorSno:self.doctorSno];
    
   
    NSString *ishaver = [userdf objectForKey:@"ishaver"];
//    if ([ishaver isEqualToString:@"1"]) {
//        mymakeController *MyIncome = [[mymakeController alloc] init];
//        MyIncome.doctorSno = self.doctorSno;
//        MyIncome.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:MyIncome animated:YES];
//    }
//    NSLog(@"ishaver  %@--",ishaver);
    
    
 float botomerhight = 0.130667 * self.view.bounds.size.width;

    NSLog(@"---个人中心ishaver-%@",ishaver);
    
    float x = self.view.bounds.size.width/5;
    if (!self.redbutton) {
        self.redbutton = [[UIButton alloc] initWithFrame:CGRectMake(3 * x + x/2 + 2,3 + self.view.bounds.size.height - botomerhight, 9, 9)];
        [self.view addSubview:self.redbutton];
    }
    if ([ishaver isEqualToString:@"1"]) {
        [self.redbutton setBackgroundImage:[UIImage imageNamed:@"个人中心44_03"] forState:UIControlStateNormal];
        
    }else{
        [self.redbutton setBackgroundImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
       self.redsmlimgae.image = [UIImage imageNamed:@" "];
    }
    
    NSString *registID =  [userdf objectForKey:@"registration_id"];
    
    [self soaprequestwithuserSno:self.doctorSno registrationId:registID];
    
    self.isshonwlertconnection = NO;


}
-(void)isNewLogin
{
    NSLog(@"---------self.loginToken--%@----------self.requestbackloginToken--%@---------",self.loginToken,self.requestbackloginToken);
    
    if (![self.loginToken isEqualToString:self.requestbackloginToken]) {
        
        NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
        [userDefatluts setObject:@"" forKey:@"CommomUserORCommomDoctor"];
        [userDefatluts setObject:@"" forKey:@"customerSno"];
        
 //       NSDictionary *dictionary = [userDefatluts dictionaryRepresentation];
//        for(NSString* key in [dictionary allKeys]){
//            [userDefatluts removeObjectForKey:key];
//            [userDefatluts synchronize];
//            
            [HuQiJingsharManage shareManage].sssss = @"3";
//        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dengluye" object:nil];
    }
    
}
-(void)getdate
{
    NSDate*date = [NSDate date];
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    // 年月日获得
    comps =[calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                       fromDate:date];
    self.year = [comps year];
    self.month = [comps month];
    self.day = [comps day];
    NSInteger days = [self getDaysOfMonthwithyear:self.year month:self.month];//计算当月的天数
    self.dayarray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int a = 1; a < days + 1; a ++) {
        NSString *daystr = [NSString stringWithFormat:@"%d",a];
        [self.dayarray addObject:daystr];
    }
    
}
-(void)selectpikerviewgetdata:(NSInteger)month
{

    NSInteger days = [self getDaysOfMonthwithyear:self.year month:month];//计算当月的天数
    if (self.dayarray) {
        [self.dayarray removeAllObjects];
    }
    self.dayarray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int a = 1; a < days + 1; a ++) {
        NSString *daystr = [NSString stringWithFormat:@"%d",a];
        [self.dayarray addObject:daystr];
    }

}
// y 的值
-(CGFloat)heigthwithnumber:(NSInteger)number{
    
     float botomerhight = 0.130667 * self.view.bounds.size.width;
    
    float buttonH = ((self.view.bounds.size.height - 64 - botomerhight) - 5 - (5*5))/4;
    float y = 64 + (5 + buttonH)* number + 5;
    return y;
}
// x的值
-(CGFloat)xwithanumber:(NSInteger)a
{
    float xs = (self.view.bounds.size.width - 30)/2;
    float x = (xs + 10) * a + 10;
    return x;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark 按钮点击事件


-(void)doctersbuttonclick:(UIButton *)button
{
    if ([self.checkState isEqualToString:@"0"]) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您好！您的资料我们在审核中，通过后便可以使用会员所有功能！谢谢您的使用！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alertview.tag = 200;
        [alertview show];
        return;
    }
    switch (button.tag) {
        case 10:
        {
            [self getdate];
            
            [self soaprequstWithcustomerSno:@"" doctorSno:self.doctorSno yearCount:[NSString stringWithFormat:@"%ld",self.year] monthCount:[NSString stringWithFormat:@"%ld",self.month] dayCount:[NSString stringWithFormat:@"%ld",self.day]];
            


        }
            break;
        case 11:
        {
            PerfectDataViewController *PerfectInformation = [[PerfectDataViewController alloc] init];
            PerfectInformation.doctorSno = self.doctorSno;
            PerfectInformation.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:PerfectInformation animated:YES];
        }
            break;
        case 12:
        {
            ShareViewController *share = [[ShareViewController alloc] init];
            share.userSno = self.doctorSno;
            [self.navigationController pushViewController:share animated:YES];
        }
            break;
        case 13:
        {
            mymakeController *MyIncome = [[mymakeController alloc] init];
            MyIncome.doctorSno = self.doctorSno;
            MyIncome.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:MyIncome animated:YES];
        }
            break;
        case 14:
        {
            MyClientViewController *MyClient = [[MyClientViewController alloc] init];
            MyClient.doctorsno = self.doctorSno;
            MyClient.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:MyClient animated:YES];
        }
            break;
        case 15:
        {
            GuestbookViewController *Guestbook = [[GuestbookViewController alloc] init];
            Guestbook.doctorsno = self.doctorSno;
            Guestbook.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:Guestbook animated:YES];
        }
            break;
        case 16:
        {
            CustomerCareViewController *CustomerCare = [[CustomerCareViewController alloc] init];
            CustomerCare.doctorsno = self.doctorSno;
            CustomerCare.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:CustomerCare animated:YES];
        }
            break;
        case 17:
        {
//            CustomerEvaluationViewController *CustomerEvaluation = [[CustomerEvaluationViewController alloc] init];
//            CustomerEvaluation.doctorsno = self.doctorSno;
//            CustomerEvaluation.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:CustomerEvaluation animated:YES];
           
            PointViewController *pointview = [[PointViewController alloc] init];
            pointview.doctorsno = self.doctorSno;
            [self.navigationController pushViewController:pointview animated:YES];
        
        }
            break;
            
        default:
            break;
    }


}
-(void)personbackbuttonclicka
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)creattimeButton
{
    
    NSMutableArray *hasmake = [[NSMutableArray alloc] initWithCapacity:0];
    
    _timeclickarray = [[NSMutableArray alloc] initWithCapacity:0];//储存忙时的时间
    
    
    for (YuYueShiJianBiaoShuJu *yuyue in _yuyueRetary) {
        if (yuyue.MinuteCount.length <= 1) {
            yuyue.MinuteCount = @"00";
        }
        NSString *hasmakestr = [NSString stringWithFormat:@"%@:%@",yuyue.HourCount,yuyue.MinuteCount];
        [hasmake addObject:hasmakestr];
        //NSLog(@"已经被预约的时间：%@",hasmakestr);
        [_timeclickarray addObject:hasmakestr];
    }
    
    //请求过来的全部时间
    NSMutableArray *timeary = [[NSMutableArray alloc] initWithCapacity:0];
    for (YuYueShiJianBiaoShuJu *yuyue in _timeDataary) {
        if ([yuyue.MinuteCount isEqualToString:@"0"]) {
            yuyue.MinuteCount = @"00";
        }
        NSString *buttontitle = [NSString stringWithFormat:@"%@:%@",yuyue.HourCount,yuyue.MinuteCount];
        [timeary addObject:buttontitle];
    }
    
    if (_backview == nil) {
        _backview = [[UIView alloc] initWithFrame:self.view.bounds];
        _backview.backgroundColor = [UIColor blackColor];
        _backview.alpha = 0.6;
        [self.view addSubview:_backview];
    }

    if (_tunningview == nil) {
            _tunningview = [[UIView alloc] initWithFrame:CGRectMake(30, 70, self.view.bounds.size.width - 60, self.view.bounds.size.height * 0.75)];
        _tunningview.backgroundColor = [UIColor whiteColor];
        _tunningview.layer.masksToBounds = YES;
        _tunningview.layer.cornerRadius = 4;
        [self.view addSubview:_tunningview];
    }
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _tunningview.bounds.size.width, _tunningview.bounds.size.height)];
    background.image = [UIImage imageNamed:@"huidi"];
    background.userInteractionEnabled = YES;
    background.layer.masksToBounds = YES;
    background.layer.cornerRadius = 4;
    [_tunningview addSubview:background];
    
    
//    if (self.pickerview) {
//        
//    }else{
//        self.pickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(48, -14, background.bounds.size.width-80, 20)];
//    }
//    self.pickerview.backgroundColor = [UIColor clearColor];
//    self.pickerview.dataSource = self;
//    self.pickerview.delegate = self;
//    [_tunningview addSubview:self.pickerview];
//    
//    [self.pickerview selectRow:self.month-1 inComponent:0 animated:YES];
//    [self.pickerview selectRow:self.day-1 inComponent:2 animated:YES];
    

//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"2015-10-30"];
//    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];


    
    UIPickerView *pickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 0, _tunningview.bounds.size.width - 100, 80)];
    pickerview.dataSource = self;
    pickerview.delegate = self;
    [pickerview selectRow:self.weekCount - 1 inComponent:0 animated:YES];
    [_tunningview addSubview:pickerview];
    

    
    //关闭按钮
    UIButton *off = [[UIButton alloc] initWithFrame:CGRectMake(_tunningview.bounds.size.width - 35, 2, 37, 35)];
    [off setBackgroundImage:[UIImage imageNamed:@"g"] forState:UIControlStateNormal];
    [off addTarget:self action:@selector(offbuttunclick) forControlEvents:UIControlEventTouchUpInside];
    [_tunningview addSubview:off];
    
    UIView *wview = [[UIView alloc] initWithFrame:CGRectMake(5, 120, _tunningview.bounds.size.width - 10, _tunningview.bounds.size.height - 125)];
    wview.backgroundColor = [UIColor whiteColor];
    [_tunningview addSubview:wview];
    
    for (int a = 0; a < timeary.count; a++) {
        int xn = a % 5;
        int yn = a / 5;
        float width = (wview.bounds.size.width - (5 * 6))/5;
        float heiht = width;
        int x = (5 + width) * xn + 5;
        int y = (5 + heiht) * yn + 5;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        button.titleEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
        [button addTarget:self action:@selector(timeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitle:[timeary objectAtIndex:a] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"专家列表_03"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"专家列表_07"] forState:UIControlStateHighlighted];
        button.tag = 200 + a;
        [wview addSubview:button];
    }
    
    for (int a = 0; a < timeary.count; a++) {
        
        UIButton *btn = (UIButton *)[wview viewWithTag:a + 200];
        NSString *btntitle = [btn currentTitle];
        
        for (NSString *str in hasmake) {
            
            if ([str isEqualToString:btntitle]) {
                [btn setTitle:str forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"doctor_time_off"] forState:UIControlStateNormal];
            }
        }
    }

}

//关闭按钮
-(void)offbuttunclick
{
    NSLog(@"关闭");
    [_backview removeFromSuperview];
    _backview = nil;
    [_tunningview removeFromSuperview];
    _tunningview = nil;
    
}
-(void)timeButtonClick:(UIButton *)button
{
    NSString *btntitle = [button currentTitle];
    NSArray *strary = [btntitle componentsSeparatedByString:@":"];
    
    BOOL haver = NO;
    
        for (NSString *str in _timeclickarray) {
            
            if ([str isEqualToString:btntitle]) {//标题在已预约的数组里，把它换成可预约
                [button setBackgroundImage:[UIImage imageNamed:@"专家列表_03"] forState:UIControlStateNormal];
                
                [self soaprequstWithdoctorSno:self.doctorSno weekCount:[NSString stringWithFormat:@"%ld",self.weekCount] hourCount:[strary objectAtIndex:0] minuteCount:[strary objectAtIndex:1] setType:@"0"];//(setType设置类型:1为忙0为闲)

                
                NSLog(@"那么多:%@",str);
                [_timeclickarray removeObject:btntitle];
                haver = YES;
                return;
            }
        }
    
    if (haver == NO) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"doctor_time_off"] forState:UIControlStateNormal];
        
        [self soaprequstWithdoctorSno:self.doctorSno weekCount:[NSString stringWithFormat:@"%ld",self.weekCount] hourCount:[strary objectAtIndex:0] minuteCount:[strary objectAtIndex:1] setType:@"1"];//(setType设置类型:1为忙0为闲)

        
        [_timeclickarray addObject:btntitle];
    }
    
    NSLog(@"_timeclickarray%@",_timeclickarray);
}




#pragma mark-- 二维码

- (void)scanAction:(UIButton *)sender
{
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        static QRCodeReaderViewController *reader = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            reader                        = [QRCodeReaderViewController new];
            reader.modalPresentationStyle = UIModalPresentationFormSheet;
        });
        reader.delegate = self;
        
        [reader setCompletionWithBlock:^(NSString *resultAsString) {
            NSLog(@"Completion with result: %@", resultAsString);
        }];
        
        [self presentViewController:reader animated:YES completion:NULL];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.delegate = self;
        
        [alert show];
    }
    
    
}

#pragma mark - QRCodeReader Delegate Methods
//捕获到网址：result
- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        self.saomiaoURL = result;
        
    }];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"我点击了扫描出来的确定按钮");
    if (alertView.tag == 200) {
       
        [self soaprequstWithdoctorSno:self.doctorSno];
    }else{
    
        WEBViewController *webview = [[WEBViewController alloc] init];
        webview.urlString = self.saomiaoURL;
        [self.navigationController pushViewController:webview animated:YES];
        
    }

}


- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

//算周几
-(NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

#pragma mark--计算每个月的天数
-(NSInteger)getDaysOfMonthwithyear:(NSInteger)year month:(NSInteger)month
{
    int days = 0;
    
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8  || month == 10 || month == 12)
    {
        days = 31;
    }
    else if (month == 4 || month == 6 || month == 9|| month == 11)
    {
        days = 30;
    }
    else
    { // 2月份，闰年29天、平年28天
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
        {
            days = 29;
        }
        else
        {
            days = 28;
        }
    }
    
    return days;
}

#pragma marke -UIPickerView

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return 100;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_monaay objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"选取了---- %ld--->: %@",row,[_monaay objectAtIndex:row]);
    
    NSString *weekstr = [_monaay objectAtIndex:row];
    
    if ([weekstr isEqualToString:@"星期一"]) {
        self.weekCount = 1;
    }else if ([weekstr isEqualToString:@"星期二"]){
        self.weekCount = 2;
    }else if ([weekstr isEqualToString:@"星期三"]){
        self.weekCount = 3;
    }else if ([weekstr isEqualToString:@"星期四"]){
        self.weekCount = 4;
    }else if ([weekstr isEqualToString:@"星期五"]){
        self.weekCount = 5;
    }else if ([weekstr isEqualToString:@"星期六"]){
        self.weekCount = 6;
    }else{
        self.weekCount = 7;
    }
    
    NSLog(@"选择的时间----%ld",self.weekCount);
    
    [self soaprequstWithcustomerSno:@"" doctorSno:self.doctorSno yearCount:[NSString stringWithFormat:@"%ld",self.year] monthCount:[NSString stringWithFormat:@"%ld",self.month] dayCount:[NSString stringWithFormat:@"%ld",self.day]];
    
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}


#pragma mark -- NSURLConnection
-(void)requstwithurl:(NSString *)str
{
    NSURL *urlstr = [NSURL URLWithString:str];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:urlstr];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requst delegate:self];
    
    [connection start];
    
}
#pragma mark --SOAP请求
//获取时间的表格
-(void)soaprequstWithcustomerSno:(NSString *)customerSno doctorSno:(NSString *)doctorSno yearCount:(NSString *)yearCount monthCount:(NSString *)monthCount dayCount:(NSString *)dayCount
{
    NSLog(@"UID:%@-----PSW:%@------doctorSno-%@-----[NSString stringWithFormat:@"",self.weekCount;%@",UID,PSW,doctorSno,[NSString stringWithFormat:@"%ld",self.weekCount]);
    
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetDoctorTimeSetBySnoAndWeek xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<customerSno>%@</customerSno>\n"
                             "<doctorSno>%@</doctorSno>\n"
                             "<weekCount>%@</weekCount>\n"
                             "</GetDoctorTimeSetBySnoAndWeek>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,customerSno,doctorSno,[NSString stringWithFormat:@"%ld",self.weekCount]
                             ];
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetDoctorTimeSetBySnoAndWeek" forHTTPHeaderField:@"SOAPAction"];
    
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"post"];//这个有时候可以换一下一种请求方式，不然请求方式错了返回的是HTML格式的代码而且得不到返回值
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        //webData = [[NSMutableData data] retain];
        webData = [NSMutableData data];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
}
//设置时间表格(setType设置类型:1为忙0为闲)
-(void)soaprequstWithdoctorSno:(NSString *)doctorSno weekCount:(NSString *)weekCount hourCount:(NSString *)hourCount  minuteCount:(NSString *)minuteCount setType:(NSString *)setType
{
    
    NSLog(@"doctorSno:%@---weekCount-%@-----hourCount:%@-----minuteCount%@----setType-%@------",doctorSno,weekCount,hourCount,minuteCount,setType);
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<SetDoctorTimeByWeek xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<doctorSno>%@</doctorSno>\n"
                             "<weekCount>%@</weekCount>\n"
                             "<hourCount>%@</hourCount>\n"
                             "<minuteCount>%@</minuteCount>\n"
                             "<setType>%@</setType>\n"
                             "</SetDoctorTimeByWeek>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,doctorSno,[NSString stringWithFormat:@"%ld",self.weekCount],hourCount,minuteCount,setType];
                             
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/SetDoctorTimeByWeek" forHTTPHeaderField:@"SOAPAction"];
    
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"post"];//这个有时候可以换一下一种请求方式，不然请求方式错了返回的是HTML格式的代码而且得不到返回值
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        //webData = [[NSMutableData data] retain];
        webData = [NSMutableData data];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
}

//获取医生登录TOKEN和审核状态
-(void)soaprequstWithdoctorSno:(NSString *)doctorSno
{
    
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetDoctorLoginToken xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<doctorSno>%@</doctorSno>\n"
                             "</GetDoctorLoginToken>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,doctorSno];
    
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetDoctorLoginToken" forHTTPHeaderField:@"SOAPAction"];
    
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"post"];//这个有时候可以换一下一种请求方式，不然请求方式错了返回的是HTML格式的代码而且得不到返回值
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        //webData = [[NSMutableData data] retain];
        webData = [NSMutableData data];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
}

//用户和设备编号关联
-(void)soaprequestwithuserSno:(NSString *)userSno registrationId:(NSString *)registrationId
{
    NSLog(@"userSno---%@-------registrationId--%@",userSno,registrationId);
   
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetCustomerCenterData xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<userSno>%@</userSno>\n"
                             "<registrationId>%@</registrationId>\n"
                             "</GetCustomerCenterData>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,userSno,registrationId];
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetCustomerCenterData" forHTTPHeaderField:@"SOAPAction"];
    
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"post"];//这个有时候可以换一下一种请求方式，不然请求方式错了返回的是HTML格式的代码而且得不到返回值
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        //webData = [[NSMutableData data] retain];
        webData = [NSMutableData data];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
    
}

#pragma mark SOAP请求方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
    NSHTTPURLResponse *urlresponse = (NSHTTPURLResponse *)response;
    NSLog(@"状态码----》%ld",(long)[urlresponse statusCode]);
    NSLog(@"响应头部信息---》%@",[urlresponse allHeaderFields]);
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
    //NSLog(@"connection: didReceiveData:2");
    NSLog(@"已经请求成功");
}

//如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"链接失败---ERROR with theConenction");
    
    // NSLog(@"ERROR with theConenction");[error description]
    if (self.isshonwlertconnection == NO) {
        UIAlertView * alert =
        [[UIAlertView alloc]
         initWithTitle:@"提示"
         message:@"链接超时或无网络!"
         delegate:nil
         cancelButtonTitle:nil
         otherButtonTitles:@"OK", nil];
        [alert show];
        
        self.isshonwlertconnection = YES;
    }
    

}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // NSLog(@"3 DONE. Received Bytes: %ld", [webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    
    //NSLog(@"提交预约的数据--%@",theXML);
    
    // NSString *str = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];

    
    xmlParser = [[NSXMLParser alloc] initWithData: webData];
    [xmlParser setDelegate: self];
    [xmlParser setShouldResolveExternalEntities: YES];
    [xmlParser parse];
    
    // [connection release];
    //[webData release];
}

#pragma mark - XML数据接收
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"GetDoctorTimeSetBySnoAndWeekResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    if ([elementName isEqualToString:@"GetDoctorLoginTokenResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    if ([elementName isEqualToString:@"SetDoctorTimeByWeekResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    
}

// 找到内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // 如果内容太长,会分多次去读,这里需要拼接(追加)
    [_soapResults appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"GetDoctorTimeSetBySnoAndWeekResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
       // NSLog(@"医生时间表详情：dic%@",dic);
        
        NSString *state = [dic objectForKey:@"state"];
        
        NSString *msg = [dic objectForKey:@"msg"];
        
         NSMutableArray *timeData = [dic objectForKey:@"timeData"];
        _timeDataary = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary *dic in timeData) {
            YuYueShiJianBiaoShuJu *yuyue = [YuYueShiJianBiaoShuJu yuyuewithNsdictionary:dic];
            [_timeDataary addObject:yuyue];
            }
        
        NSMutableArray *ret = [dic objectForKey:@"ret"];
        _yuyueRetary = [[NSMutableArray alloc] initWithCapacity:0];
        if ([[dic objectForKey:@"state"] isEqualToString:@"1"]) {
            
            for (NSDictionary *diction in ret) {
                YuYueShiJianBiaoShuJu *yuyue = [YuYueShiJianBiaoShuJu yuyuewithNsdictionary:diction];
                [_yuyueRetary addObject:yuyue];
            }
        }
        [self creattimeButton];
        
        if ([state isEqualToString:@"1"]) {
           
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }

    }
    
    
    if ([elementName isEqualToString:@"GetDoctorLoginTokenResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"判断医生是否审核通过的数据：dic%@",dic);
  
        self.checkState = [NSString stringWithFormat:@"%@",[dic objectForKey:@"checkState"]];
        self.requestbackloginToken = [dic objectForKey:@"loginToken"];
        
        [self isNewLogin];
    }

    if ([elementName isEqualToString:@"SetDoctorTimeByWeekResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"医生设置时间：dic%@",dic);

    }
    
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"-------------------start--------------");
    
    // 创建一个可变字符串
    _soapResults = [[NSMutableString alloc] initWithCapacity:0];//解析开始了，创建空字符串来存
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"-------------------end--------------");
    
}

@end
