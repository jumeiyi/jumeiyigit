//
//  ShouYeViewController.m
//  聚美医
//
//  Created by fenghuang on 15/12/4.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1472), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define UID @"wdc001"
#define PSW @"dcg658"

#import "ShouYeViewController.h"
#import "mymakeController.h"
#import "MyClientViewController.h"
#import "ShareViewController.h"
#import "PrefixHeader.pch"
#import "UIImageView+WebCache.h"
#import "YuYueShiJianBiaoShuJu.h"
#import "sys/utsname.h"
#import "DoctorRegistViewController.h"


@interface ShouYeViewController ()

@end


@implementation ShouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"isRetina:%d",isRetina);
     NSLog(@"iPhone5:%d",iPhone5);
     NSLog(@"iPhone6:%d",iPhone6);
    NSLog(@"iPhone6p:%d",iPhone6p);
     NSLog(@"iPhone7:%d",iPhone7);
    
    NSLog(@"self.view.bounds.size.width---%f-----self.view.bounds.size.height--%f",self.view.bounds.size.width,self.view.bounds.size.height);
    
}

-(void)mainview{

    [_backgroundimage removeFromSuperview];
    
    _denglubackgroundimage = [[UIView alloc] initWithFrame:self.view.bounds];
    _denglubackgroundimage.backgroundColor = [self colorWithRGB:0xaeb1b0 alpha:1];
    [self.view addSubview:_denglubackgroundimage];
    
    UIImageView *imagevie = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 158)];
    imagevie.image = [UIImage imageNamed:@"shouye_bg"];
    [_denglubackgroundimage addSubview:imagevie];
    
    UIView *whitview = [[UIView alloc] initWithFrame:CGRectMake(0, 158, self.view.bounds.size.width,182)];
    whitview.backgroundColor = [UIColor whiteColor];
    [_denglubackgroundimage addSubview:whitview];
    
    self.deadimage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - ((self.view.bounds.size.width * 0.373)/2), 158 - ((self.view.bounds.size.width* 0.373)/2), self.view.bounds.size.width * 0.373, self.view.bounds.size.width * 0.373)];
    self.deadimage.image = [UIImage imageNamed:@"headimage_@3x"];
    self.deadimage.layer.masksToBounds = YES;
    self.deadimage.layer.cornerRadius = (self.view.bounds.size.width * 0.373)/2;
    [_denglubackgroundimage addSubview:self.deadimage];
    
    NSLog(@"屏幕的宽度：%f",self.view.bounds.size.width);
    
    self.personimage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 20, 168 + ((self.view.bounds.size.width* 0.373)/2), 20, 20)];
    self.personimage.image = [UIImage imageNamed:@"xingming_@3x"];
    [self.view addSubview:self.personimage];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 50, 168 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:self.name.text], 20)];
    self.name.font = [UIFont systemFontOfSize:16];
    self.name.textColor = [self colorWithRGB:0x666666 alpha:1];
    [_denglubackgroundimage addSubview:self.name];
    
    
    self.hospitalimage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 10, 198 + ((self.view.bounds.size.width * 0.373)/2), 20, 20)];
    self.hospitalimage.image = [UIImage imageNamed:@"yiyuan_@3x"];
    [_denglubackgroundimage addSubview:self.hospitalimage];
    
    self.hospital = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 40, 198 + ((self.view.bounds.size.width * 0.373)/2), 150, 20)];
    self.hospital.font = [UIFont systemFontOfSize:16];
    self.hospital.textColor = [self colorWithRGB:0x666666 alpha:1];
    [_denglubackgroundimage addSubview:self.hospital];
    
    
    self.kehu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:@"0"] - 15 - [self NSStringwithsize:16 str:@"客户:"], 228 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:@"客户:"], 20)];
    self.kehu.text = @"患者:";
    self.kehu.font = [UIFont systemFontOfSize:16];
    self.kehu.textColor = [self colorWithRGB:0x666666 alpha:1];
    [_denglubackgroundimage addSubview:self.kehu];
    
    self.kehushu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:@"0"] - 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20)];
    self.kehushu.text = @"0";
    self.kehushu.textColor = [self colorWithRGB:0x1bc6bc alpha:1];
    [_denglubackgroundimage addSubview:self.kehushu];
    
    UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 228 + ((self.view.bounds.size.width * 0.373)/2), 0.5, 25)];
    shuxian.image = [UIImage imageNamed:@"shouye_shuxian"];
    [self.view addSubview:shuxian];
    
    UILabel *yuyuedanshu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 + 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20)];
    yuyuedanshu.text = @"预约数:";
    yuyuedanshu.font = [UIFont systemFontOfSize:16];
    yuyuedanshu.textColor = [self colorWithRGB:0x666666 alpha:1];
    [self.view addSubview:yuyuedanshu];
    
    self.yuyueshu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 + [self NSStringwithsize:17 str:@"预单数:"] + 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20)];
    self.yuyueshu.text = @"0";
    self.yuyueshu.textColor = [self colorWithRGB:0xf5a556 alpha:1];
    [self.view addSubview:self.yuyueshu];
    
    UIImageView *hengxian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 340, self.view.bounds.size.width, 9)];
    hengxian.image = [UIImage imageNamed:@"shouye_hengxian@3x"];
    [self.view addSubview:hengxian];
    
    float withd = (self.view.bounds.size.width - 0.5)/2;
    float higth = (self.view.bounds.size.height - 349 - 50)/2;
    float y = 349;
    
    UIView *imagebg1 = [[UIView alloc] initWithFrame:CGRectMake(0, y, withd, higth)];
    imagebg1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg1];
    
    UIImageView *buttonbg1 = [[UIImageView alloc] initWithFrame:CGRectMake(withd/2 - ((withd - 124)/2), y + 15, withd - 124, withd - 124)];
    buttonbg1.image = [UIImage imageNamed:@"wodeshijian_@3x"];
    [self.view addSubview:buttonbg1];
    
    UILabel *shijian = [[UILabel alloc] initWithFrame:CGRectMake(imagebg1.bounds.size.width/2 - ([self NSStringwithsize:16 str:@"我的时间"]/2), withd - 124 + 25, [self NSStringwithsize:16 str:@"我的时间"], 20)];
    shijian.text = @"我的时间";
    shijian.font = [UIFont systemFontOfSize:16];
    shijian.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg1 addSubview:shijian];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, y, withd, higth)];
    button1.backgroundColor = [UIColor clearColor];
    [button1 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 1;
    [self.view addSubview:button1];
    
    
    UIView *imagebg2 = [[UIView alloc] initWithFrame:CGRectMake(withd + 0.5, y, withd, higth)];
    imagebg2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg2];
    
    UIImageView *buttonbg2 = [[UIImageView alloc] initWithFrame:CGRectMake(withd + 2 + withd/2 - ((withd - 124)/2), y + 15, withd - 124, withd - 124)];
    buttonbg2.image = [UIImage imageNamed:@"wodeyuyue_@3x"];
    [self.view addSubview:buttonbg2];
    
    UILabel *yuyue = [[UILabel alloc] initWithFrame:CGRectMake(imagebg2.bounds.size.width/2 - ([self NSStringwithsize:16 str:@"我的预约"]/2), withd - 124 + 25, [self NSStringwithsize:16 str:@"我的预约"], 20)];
    yuyue.text = @"我的预约";
    yuyue.font = [UIFont systemFontOfSize:16];
    yuyue.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg2 addSubview:yuyue];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(withd + 0.5, y, withd, higth)];
    button2.backgroundColor = [UIColor clearColor];
    [button2 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 2;
    [self.view addSubview:button2];
    
    
    UIView *imagebg3 = [[UIView alloc] initWithFrame:CGRectMake(0, y + 0.5 + higth, withd, higth)];
    imagebg3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg3];
    
    UIImageView *buttonbg3 = [[UIImageView alloc] initWithFrame:CGRectMake(withd/2 - ((withd - 124)/2), y + 0.5 + higth+ 15, withd - 124, withd - 124)];
    buttonbg3.image = [UIImage imageNamed:@"wodekehu_@3x"];
    [self.view addSubview:buttonbg3];
    
    UILabel *kehubg = [[UILabel alloc] initWithFrame:CGRectMake(imagebg3.bounds.size.width/2 - ([self NSStringwithsize:16 str:@"我的患者"]/2), withd - 124 + 25, [self NSStringwithsize:16 str:@"我的患者"], 20)];
    kehubg.text = @"我的患者";
    kehubg.font = [UIFont systemFontOfSize:16];
    kehubg.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg3 addSubview:kehubg];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, y + 0.5 + higth, withd, higth)];
    button3.backgroundColor = [UIColor clearColor];
    [button3 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 3;
    [self.view addSubview:button3];
    
    
    UIView *imagebg4 = [[UIView alloc] initWithFrame:CGRectMake(withd + 0.5, y + 0.5 + higth, withd,higth)];
    imagebg4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg4];
    
    UIImageView *buttonbg4 = [[UIImageView alloc] initWithFrame:CGRectMake(withd + 2 + withd/2 - ((withd - 124)/2), y + 15 + 0.5 + higth, withd - 124, withd - 124)];
    buttonbg4.image = [UIImage imageNamed:@"tianjiahuanzhese_@3x"];
    [self.view addSubview:buttonbg4];
    
    UILabel *tianjia = [[UILabel alloc] initWithFrame:CGRectMake(imagebg4.bounds.size.width/2 - ([self NSStringwithsize:16 str:@"添加患者"]/2), withd - 124 + 25, [self NSStringwithsize:16 str:@"添加患者"], 20)];
    tianjia.text = @"添加患者";
    tianjia.font = [UIFont systemFontOfSize:16];
    tianjia.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg4 addSubview:tianjia];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(withd + 0.5, y + 0.5 + higth, withd,higth)];
    button4.backgroundColor = [UIColor clearColor];
    [button4 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 4;
    [self.view addSubview:button4];
    

    
    self.tabBarController.tabBar.frame = CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49);
    
    _monaay = [[NSArray alloc] initWithObjects:@"星期一",@"星期二", @"星期三",@"星期四",@"星期五",@"星期六",@"星期日",nil];
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chengeindexpage:) name:@"msg" object:nil];
    
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    self.doctorSno =  [userdf objectForKey:@"customerSno"];//这个实际上医生的索引
    
    [self soaprequstWithdoctorSno:self.doctorSno];
    NSString *registID =  [userdf objectForKey:@"registration_id"];
    [self soaprequestwithuserSno:self.doctorSno registrationId:registID];
    
    [self getDeviceAndOSInfo];
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)dengluye{
    
    self.tabBarController.tabBar.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 49);
    
    [_denglubackgroundimage removeFromSuperview];
    [_backgroundimage removeFromSuperview];
    
    _backgroundimage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _backgroundimage.image = [UIImage imageNamed:@"denglu_di"];
    _backgroundimage.userInteractionEnabled = YES;
    _backgroundimage.tag = 100;
    [self.view addSubview:_backgroundimage];
    
    if (iPhone5) {
        
        UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(40, 190, self.view.bounds.size.width - 80, 50)];
        phoneview.backgroundColor = [UIColor whiteColor];
        phoneview.layer.masksToBounds = YES;
        phoneview.layer.cornerRadius = 25;
        [_backgroundimage addSubview:phoneview];
        
        _phonenumber  =[[UITextField alloc] initWithFrame:CGRectMake(55, 12, phoneview.bounds.size.width - 90, 30)];
        _phonenumber.backgroundColor = [UIColor whiteColor];
        _phonenumber.placeholder = @"输入手机号码";
        _phonenumber.keyboardType = UIKeyboardTypeDecimalPad;
        _phonenumber.font = [UIFont systemFontOfSize:16];
        _phonenumber.layer.masksToBounds = YES;
        _phonenumber.layer.cornerRadius = 4;
        [phoneview addSubview:_phonenumber];
        
        UIImageView *numimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 15, 20)];
        numimage.image = [UIImage imageNamed:@"shouji_tubiao@3x"];
        [phoneview addSubview:numimage];
        
        UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian.image = [UIImage imageNamed:@"shouye_suxian"];
        [phoneview addSubview:shuxian];
        
        UIView *recode = [[UIView alloc] initWithFrame:CGRectMake(40, 255, self.view.bounds.size.width - 80, 50)];
        recode.backgroundColor = [UIColor whiteColor];
        recode.layer.masksToBounds = YES;
        recode.layer.cornerRadius = 25;
        [_backgroundimage addSubview:recode];
        
        UIImageView *codeimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 15, 20)];
        codeimage.image = [UIImage imageNamed:@"mima_tubiao@3x"];
        [recode addSubview:codeimage];
        
        UIImageView *shuxian2 = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian2.image = [UIImage imageNamed:@"shouye_suxian"];
        [recode addSubview:shuxian2];
        
        
        _testnumber = [[UITextField alloc] initWithFrame:CGRectMake(_phonenumber.frame.origin.x, 12, 120, 30)];
        _testnumber.backgroundColor = [UIColor whiteColor];
        _testnumber.placeholder = @"输入验证码";
        _testnumber.keyboardType = UIKeyboardTypeDecimalPad;
        _testnumber.font = [UIFont systemFontOfSize:16];
        _testnumber.layer.masksToBounds = YES;
        _testnumber.layer.cornerRadius = 4;
        [recode addSubview:_testnumber];
        
        _testbtn = [[UIButton alloc] initWithFrame:CGRectMake(recode.bounds.size.width - 100, 0, 100, 50)];
        [_testbtn addTarget:self action:@selector(testbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluye"] forState:UIControlStateNormal];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluyeH"] forState:UIControlStateHighlighted];        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _testbtn.backgroundColor = [self colorWithRGB:0xadedf1 alpha:1];
        [_testbtn setTitleColor:[self colorWithRGB:0x127075 alpha:1] forState:UIControlStateNormal];
        [_testbtn setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateHighlighted];
        _testbtn.layer.masksToBounds = YES;
        [recode addSubview:_testbtn];
        
        
        UIImageView *tubiao = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 32, 49, 74, 100)];
        tubiao.image = [UIImage imageNamed:@"denglu_tubiao@3x"];
        [_backgroundimage addSubview:tubiao];
        
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 364, self.view.bounds.size.width - 80, 50)];
        [button addTarget:self action:@selector(commitclick) forControlEvents:UIControlEventTouchUpInside];
        //    [button setBackgroundImage:[UIImage imageNamed:@"大按钮s"] forState:UIControlStateNormal];
        //    button.center = CGPointMake(self.view.bounds.size.width/2, 380);
        button.backgroundColor = [self colorWithRGB:0xc6d714 alpha:1];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 25;
        [_backgroundimage addSubview:button];


        
        UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        weixin.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
        weixin.tag = 30;
        [weixin setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
        [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
        weixin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:weixin];
        
        UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        yisheng.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
        [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
        yisheng.tag = 31;
        [yisheng setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
        yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:yisheng];
        
    }else if (iPhone6){
    
        UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(40, 280, self.view.bounds.size.width - 80, 50)];
        phoneview.backgroundColor = [UIColor whiteColor];
        phoneview.layer.masksToBounds = YES;
        phoneview.layer.cornerRadius = 25;
        [_backgroundimage addSubview:phoneview];
        
        _phonenumber  =[[UITextField alloc] initWithFrame:CGRectMake(55, 12, phoneview.bounds.size.width - 90, 30)];
        _phonenumber.backgroundColor = [UIColor whiteColor];
        _phonenumber.placeholder = @"输入手机号码";
        _phonenumber.keyboardType = UIKeyboardTypeDecimalPad;
        _phonenumber.font = [UIFont systemFontOfSize:16];
        _phonenumber.layer.masksToBounds = YES;
        _phonenumber.layer.cornerRadius = 4;
        [phoneview addSubview:_phonenumber];
        
        UIImageView *numimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 15, 20)];
        numimage.image = [UIImage imageNamed:@"shouji_tubiao@3x"];
        [phoneview addSubview:numimage];
        
        UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian.image = [UIImage imageNamed:@"shouye_suxian"];
        [phoneview addSubview:shuxian];
        
        UIView *recode = [[UIView alloc] initWithFrame:CGRectMake(40, 345, self.view.bounds.size.width - 80, 50)];
        recode.backgroundColor = [UIColor whiteColor];
        recode.layer.masksToBounds = YES;
        recode.layer.cornerRadius = 25;
        [_backgroundimage addSubview:recode];
        
        UIImageView *codeimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 15, 20)];
        codeimage.image = [UIImage imageNamed:@"mima_tubiao@3x"];
        [recode addSubview:codeimage];
        
        UIImageView *shuxian2 = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian2.image = [UIImage imageNamed:@"shouye_suxian"];
        [recode addSubview:shuxian2];
        
        
        _testnumber = [[UITextField alloc] initWithFrame:CGRectMake(_phonenumber.frame.origin.x, 12, 120, 30)];
        _testnumber.backgroundColor = [UIColor whiteColor];
        _testnumber.placeholder = @"输入验证码";
        _testnumber.keyboardType = UIKeyboardTypeDecimalPad;
        _testnumber.font = [UIFont systemFontOfSize:16];
        _testnumber.layer.masksToBounds = YES;
        _testnumber.layer.cornerRadius = 4;
        [recode addSubview:_testnumber];
        
        _testbtn = [[UIButton alloc] initWithFrame:CGRectMake(recode.bounds.size.width - 100, 0, 100, 50)];
        [_testbtn addTarget:self action:@selector(testbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluye"] forState:UIControlStateNormal];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluyeH"] forState:UIControlStateHighlighted];        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _testbtn.backgroundColor = [self colorWithRGB:0xadedf1 alpha:1];
        [_testbtn setTitleColor:[self colorWithRGB:0x127075 alpha:1] forState:UIControlStateNormal];
        [_testbtn setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateHighlighted];
        _testbtn.layer.masksToBounds = YES;
        [recode addSubview:_testbtn];
        
        
        UIImageView *tubiao = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 32, 109, 74, 100)];
        tubiao.image = [UIImage imageNamed:@"denglu_tubiao@3x"];
        [_backgroundimage addSubview:tubiao];
        
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 454, self.view.bounds.size.width - 80, 50)];
        [button addTarget:self action:@selector(commitclick) forControlEvents:UIControlEventTouchUpInside];
        //    [button setBackgroundImage:[UIImage imageNamed:@"大按钮s"] forState:UIControlStateNormal];
        //    button.center = CGPointMake(self.view.bounds.size.width/2, 380);
        button.backgroundColor = [self colorWithRGB:0xc6d714 alpha:1];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 25;
        [_backgroundimage addSubview:button];
        
        
        UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        weixin.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
        weixin.tag = 30;
        [weixin setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
        [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
        weixin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:weixin];
        
        UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        yisheng.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
        [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
        yisheng.tag = 31;
        [yisheng setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
        yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:yisheng];
        
    }else if (iPhone6p){
    
        UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(38, 416, self.view.bounds.size.width - 76, 50)];
        phoneview.backgroundColor = [UIColor whiteColor];
        phoneview.layer.masksToBounds = YES;
        phoneview.layer.cornerRadius = 37;
        [_backgroundimage addSubview:phoneview];
        
        _phonenumber  =[[UITextField alloc] initWithFrame:CGRectMake(55, 17, phoneview.bounds.size.width - 90, 30)];
        _phonenumber.backgroundColor = [UIColor whiteColor];
        _phonenumber.placeholder = @" 输入手机号码";
        _phonenumber.keyboardType = UIKeyboardTypeDecimalPad;
        _phonenumber.font = [UIFont systemFontOfSize:14];
        _phonenumber.layer.masksToBounds = YES;
        _phonenumber.layer.cornerRadius = 4;
        [phoneview addSubview:_phonenumber];
        
        UIImageView *numimage = [[UIImageView alloc] initWithFrame:CGRectMake(19, 16, 15, 20)];
        numimage.image = [UIImage imageNamed:@"shouji_tubiao@3x"];
        [phoneview addSubview:numimage];
        
        UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian.image = [UIImage imageNamed:@"shouye_suxian"];
        [phoneview addSubview:shuxian];
        
        UIView *recode = [[UIView alloc] initWithFrame:CGRectMake(57, 516, self.view.bounds.size.width - 114, 75)];
        recode.backgroundColor = [UIColor whiteColor];
        recode.layer.masksToBounds = YES;
        recode.layer.cornerRadius = 37;
        [_backgroundimage addSubview:recode];
        
        UIImageView *codeimage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 24, 25, 30)];
        codeimage.image = [UIImage imageNamed:@"mima_tubiao@3x"];
        [recode addSubview:codeimage];
        
        UIImageView *shuxian2 = [[UIImageView alloc] initWithFrame:CGRectMake(62, 22, 2.0, 30)];
        shuxian2.image = [UIImage imageNamed:@"shouye_suxian"];
        [recode addSubview:shuxian2];

        
        _testnumber = [[UITextField alloc] initWithFrame:CGRectMake(_phonenumber.frame.origin.x, 25, 120, 30)];
        _testnumber.backgroundColor = [UIColor whiteColor];
        _testnumber.placeholder = @"输入验证码";
        _testnumber.keyboardType = UIKeyboardTypeDecimalPad;
        _testnumber.font = [UIFont systemFontOfSize:22];
        _testnumber.layer.masksToBounds = YES;
        _testnumber.layer.cornerRadius = 4;
        [recode addSubview:_testnumber];
        
        _testbtn = [[UIButton alloc] initWithFrame:CGRectMake(recode.bounds.size.width - 80, 0, 80, 75)];
        [_testbtn addTarget:self action:@selector(testbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluye"] forState:UIControlStateNormal];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluyeH"] forState:UIControlStateHighlighted];        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.titleLabel.font = [UIFont systemFontOfSize:20];
        _testbtn.backgroundColor = [self colorWithRGB:0xadedf1 alpha:1];
        _testbtn.layer.masksToBounds = YES;
        _testbtn.layer.cornerRadius = 4;
        [recode addSubview:_testbtn];
        
        
        UIImageView *tubiao = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 38, 149, 76, 101)];
        tubiao.image = [UIImage imageNamed:@"denglu_tubiao@3x"];
        [_backgroundimage addSubview:tubiao];
        
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(57, 674, self.view.bounds.size.width - 114, 75)];
        [button addTarget:self action:@selector(commitclick) forControlEvents:UIControlEventTouchUpInside];
        //    [button setBackgroundImage:[UIImage imageNamed:@"大按钮s"] forState:UIControlStateNormal];
        //    button.center = CGPointMake(self.view.bounds.size.width/2, 380);
        button.backgroundColor = [self colorWithRGB:0xc6d714 alpha:1];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 37;
        [_backgroundimage addSubview:button];
        
        UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        weixin.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
        weixin.tag = 30;
        [weixin setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
        [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
        weixin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:weixin];
        
        UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        yisheng.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
        [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
        yisheng.tag = 31;
        [yisheng setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
        yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:yisheng];

        
    }else if (iPhone7){
    
        UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(57, 270, self.view.bounds.size.width - 114, 75)];
        phoneview.backgroundColor = [UIColor whiteColor];
        phoneview.layer.masksToBounds = YES;
        phoneview.layer.cornerRadius = 37;
        [_backgroundimage addSubview:phoneview];
        
        _phonenumber  =[[UITextField alloc] initWithFrame:CGRectMake(70, 22, phoneview.bounds.size.width - 90, 30)];
        _phonenumber.backgroundColor = [UIColor whiteColor];
        _phonenumber.placeholder = @" 输入手机号码";
        _phonenumber.keyboardType = UIKeyboardTypeDecimalPad;
        _phonenumber.font = [UIFont systemFontOfSize:22];
        _phonenumber.layer.masksToBounds = YES;
        _phonenumber.layer.cornerRadius = 4;
        [phoneview addSubview:_phonenumber];
        
        UIImageView *numimage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 22, 25, 30)];
        numimage.image = [UIImage imageNamed:@"shouji_tubiao@3x"];
        [phoneview addSubview:numimage];
        
        UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(62, 22, 2.5, 30)];
        shuxian.image = [UIImage imageNamed:@"shouye_suxian"];
        [phoneview addSubview:shuxian];
        
        UIView *recode = [[UIView alloc] initWithFrame:CGRectMake(57, 369, self.view.bounds.size.width - 114, 75)];
        recode.backgroundColor = [UIColor whiteColor];
        recode.layer.masksToBounds = YES;
        recode.layer.cornerRadius = 37;
        [_backgroundimage addSubview:recode];
        
        UIImageView *codeimage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 22, 25, 30)];
        codeimage.image = [UIImage imageNamed:@"mima_tubiao@3x"];
        [recode addSubview:codeimage];
        
        UIImageView *shuxian2 = [[UIImageView alloc] initWithFrame:CGRectMake(62, 22, 2.5, 30)];
        shuxian2.image = [UIImage imageNamed:@"shouye_suxian"];
        [recode addSubview:shuxian2];
        
        UIImageView *yanzheng = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 30, 30)];
        yanzheng.image = [UIImage imageNamed:@""];
        [recode addSubview:yanzheng];
        
        _testnumber = [[UITextField alloc] initWithFrame:CGRectMake(_phonenumber.frame.origin.x, 22, 120, 30)];
        _testnumber.backgroundColor = [UIColor whiteColor];
        _testnumber.placeholder = @"输入验证码";
        _testnumber.keyboardType = UIKeyboardTypeDecimalPad;
        _testnumber.font = [UIFont systemFontOfSize:22];
        _testnumber.layer.masksToBounds = YES;
        _testnumber.layer.cornerRadius = 4;
        [recode addSubview:_testnumber];
        
        _testbtn = [[UIButton alloc] initWithFrame:CGRectMake(recode.bounds.size.width - 80, 0, 80, 75)];
        [_testbtn addTarget:self action:@selector(testbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluye"] forState:UIControlStateNormal];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluyeH"] forState:UIControlStateHighlighted];        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.titleLabel.font = [UIFont systemFontOfSize:20];
        _testbtn.backgroundColor = [self colorWithRGB:0xadedf1 alpha:1];
        _testbtn.layer.masksToBounds = YES;
        _testbtn.layer.cornerRadius = 4;
        [recode addSubview:_testbtn];
        
        
        UIImageView *tubiao = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 37.5, 100, 75, 100)];
        tubiao.image = [UIImage imageNamed:@"denglu_tubiao@3x"];
        [_backgroundimage addSubview:tubiao];
        
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(57, 500, self.view.bounds.size.width - 114, 75)];
        [button addTarget:self action:@selector(commitclick) forControlEvents:UIControlEventTouchUpInside];
        //    [button setBackgroundImage:[UIImage imageNamed:@"大按钮s"] forState:UIControlStateNormal];
        //    button.center = CGPointMake(self.view.bounds.size.width/2, 380);
        button.backgroundColor = [self colorWithRGB:0xc6d714 alpha:1];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 37;
        [_backgroundimage addSubview:button];
        
        
        UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        weixin.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
        weixin.tag = 30;
        [weixin setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
        [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
        weixin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:weixin];
        
        UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        yisheng.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
        yisheng.tag = 31;
        [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
        [yisheng setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
        yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:yisheng];

    }else{
    
        UIView *phoneview = [[UIView alloc] initWithFrame:CGRectMake(38, 277, self.view.bounds.size.width - 76, 50)];
        phoneview.backgroundColor = [UIColor whiteColor];
        phoneview.layer.masksToBounds = YES;
        phoneview.layer.cornerRadius = 25;
        [_backgroundimage addSubview:phoneview];
        
        _phonenumber  =[[UITextField alloc] initWithFrame:CGRectMake(55, 12, phoneview.bounds.size.width - 90, 30)];
        _phonenumber.backgroundColor = [UIColor whiteColor];
        _phonenumber.placeholder = @"输入手机号码";
        _phonenumber.keyboardType = UIKeyboardTypeDecimalPad;
        _phonenumber.font = [UIFont systemFontOfSize:14];
        _phonenumber.layer.masksToBounds = YES;
        _phonenumber.layer.cornerRadius = 4;
        [phoneview addSubview:_phonenumber];
        
        UIImageView *numimage = [[UIImageView alloc] initWithFrame:CGRectMake(19, 16, 15, 20)];
        numimage.image = [UIImage imageNamed:@"shouji_tubiao@3x"];
        [phoneview addSubview:numimage];
        
        UIImageView *shuxian = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian.image = [UIImage imageNamed:@"shouye_suxian"];
        [phoneview addSubview:shuxian];
        
        UIView *recode = [[UIView alloc] initWithFrame:CGRectMake(38, 343, self.view.bounds.size.width - 76, 50)];
        recode.backgroundColor = [UIColor whiteColor];
        recode.layer.masksToBounds = YES;
        recode.layer.cornerRadius = 25;
        [_backgroundimage addSubview:recode];
        
        UIImageView *codeimage = [[UIImageView alloc] initWithFrame:CGRectMake(19, 16, 15, 20)];
        codeimage.image = [UIImage imageNamed:@"mima_tubiao@3x"];
        [recode addSubview:codeimage];
        
        UIImageView *shuxian2 = [[UIImageView alloc] initWithFrame:CGRectMake(45, 15, 2.0, 20)];
        shuxian2.image = [UIImage imageNamed:@"shouye_suxian"];
        [recode addSubview:shuxian2];
        
        
        _testnumber = [[UITextField alloc] initWithFrame:CGRectMake(_phonenumber.frame.origin.x, 12, 120, 30)];
        _testnumber.backgroundColor = [UIColor whiteColor];
        _testnumber.placeholder = @"输入验证码";
        _testnumber.keyboardType = UIKeyboardTypeDecimalPad;
        _testnumber.font = [UIFont systemFontOfSize:14];
        _testnumber.layer.masksToBounds = YES;
        _testnumber.layer.cornerRadius = 4;
        [recode addSubview:_testnumber];
        
        _testbtn = [[UIButton alloc] initWithFrame:CGRectMake(recode.bounds.size.width - 80, 0, 80, 50)];
        [_testbtn addTarget:self action:@selector(testbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluye"] forState:UIControlStateNormal];
        [_testbtn setBackgroundImage:[UIImage imageNamed:@"huoquyanzhengma_dengluyeH"] forState:UIControlStateHighlighted];
        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _testbtn.backgroundColor = [self colorWithRGB:0xadedf1 alpha:1];
        [_testbtn setTitleColor:[self colorWithRGB:0x127075 alpha:1] forState:UIControlStateNormal];
        [_testbtn setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateHighlighted];
        _testbtn.layer.masksToBounds = YES;
        [recode addSubview:_testbtn];
        
        
        UIImageView *tubiao = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 38, 98, 76, 101)];
        tubiao.image = [UIImage imageNamed:@"denglu_tubiao@3x"];
        [_backgroundimage addSubview:tubiao];
        
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(38, 448, self.view.bounds.size.width - 76, 50)];
        [button addTarget:self action:@selector(commitclick) forControlEvents:UIControlEventTouchUpInside];
        //    [button setBackgroundImage:[UIImage imageNamed:@"大按钮s"] forState:UIControlStateNormal];
        //    button.center = CGPointMake(self.view.bounds.size.width/2, 380);
        button.backgroundColor = [self colorWithRGB:0xc6d714 alpha:1];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 25;
        [_backgroundimage addSubview:button];
        
        
        UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        weixin.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
        weixin.tag = 30;
        [weixin setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
        [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
        weixin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:weixin];
        
        UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
        [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
        yisheng.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
        [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
        yisheng.tag = 31;
        [yisheng setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
        yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
        [_backgroundimage addSubview:yisheng];

    }
    
    
    self.Isxieyi = YES;
    self.personordocter = YES;

    
    
}

-(void)dengluyeweixinduan{
    
    [_denglubackgroundimage removeFromSuperview];
    
    _backgroundimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 54)];
    _backgroundimage.image = [UIImage imageNamed:@"dengluyeweixin_bg.jpg"];
    _backgroundimage.userInteractionEnabled = YES;
    [self.view addSubview:_backgroundimage];


    UIButton *weixin = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
    [weixin addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
    weixin.tag = 30;
    weixin.backgroundColor = [self colorWithRGB:0x1c6078 alpha:1];
    [weixin setTitleColor:[self colorWithRGB:0xffffff alpha:1] forState:UIControlStateNormal];
    [weixin setTitle:@"用户微信" forState:UIControlStateNormal];
    weixin.titleLabel.font = [UIFont systemFontOfSize:13];
    [_backgroundimage addSubview:weixin];
    
    UIButton *yisheng = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 54, self.view.bounds.size.width/2, 54)];
    [yisheng addTarget:self action:@selector(shoosegroup:) forControlEvents:UIControlEventTouchUpInside];
    [yisheng setTitleColor:[self colorWithRGB:0x2c6d6c alpha:1] forState:UIControlStateNormal];
    yisheng.backgroundColor = [self colorWithRGB:0x2aa5a7 alpha:1];
    yisheng.tag = 31;
    [yisheng setTitle:@"医生端" forState:UIControlStateNormal];
    yisheng.titleLabel.font = [UIFont systemFontOfSize:13];
    [_backgroundimage addSubview:yisheng];
    
}

-(void)shoosegroup:(UIButton *)btn{

    NSLog(@"7878787878787");
    
    if (btn.tag == 30) {
        [self dengluyeweixinduan];
    }else{
        [self dengluye];
    }
    
}

- (void)getDeviceAndOSInfo
{
    //here use sys/utsname.h
    struct utsname systemInfo;
    //声明结构体，包含5个char数成员:sysname,nodename,release,version,machine
    uname(&systemInfo);
    //c方法，填写系统结构体内容，返回值为0，表示成功。
    
    //get the device model and the system version
    NSLog(@"[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]-------:%@", [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]);
    NSLog(@"[[UIDevice currentDevice] systemVersion]----:%@", [[UIDevice currentDevice] systemVersion]);
    
}

-(void)chengeindexpage:(NSNotification *)noti
{
    NSString *string = [noti object];
    if ([string isEqualToString:@"1"]) {
        
        self.redbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 + 5, 0, 12,12)];
        self.redbtn.backgroundColor = [UIColor redColor];
        self.redbtn.layer.masksToBounds = YES;
        self.redbtn.layer.cornerRadius = 6;
        [self.tabBarController.tabBar addSubview:self.redbtn];
        
        //self.tabBarController.selectedIndex = 1;
        
    }else{

        [self.redbtn removeFromSuperview];
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *customersno = [user objectForKey:@"customerSno"];
    
    if (customersno.length < 5) {
        [self dengluye];
        self.yidenglu = NO;
        
    }else{
        
        self.tabBarController.tabBar.frame = CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49);
        
        self.view.backgroundColor = [self colorWithRGB:0xDEDEDE alpha:1];
        
        if (self.yidenglu == NO) {
            [self mainview];
            self.yidenglu = YES;
        }
        
        
        NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
        //    self.doctorSno =  [userdf objectForKey:@"customerSno"];//这个实际上医生的索引
        //self.loginToken = [userdf objectForKey:@"loginToken"];
        
        [self soaprequstWithdoctorSno:self.doctorSno];
        
        NSString *registID =  [userdf objectForKey:@"registration_id"];
        
        [self soaprequestwithuserSno:self.doctorSno registrationId:registID];
        
    }

    
    


}

-(void)isNewLogin
{
//    NSLog(@"---------self.loginToken--%@----------self.requestbackloginToken--%@---------",self.loginToken,self.requestbackloginToken);
    
//if (![self.loginToken isEqualToString:self.requestbackloginToken]) {
        
//        NSUserDefaults *userDefatluts = [NSUserDefaults standardUserDefaults];
//        [userDefatluts setObject:@"" forKey:@"CommomUserORCommomDoctor"];
//        [userDefatluts setObject:@"" forKey:@"customerSno"];
//        
//        //       NSDictionary *dictionary = [userDefatluts dictionaryRepresentation];
//        //        for(NSString* key in [dictionary allKeys]){
//        //            [userDefatluts removeObjectForKey:key];
//        //            [userDefatluts synchronize];
//        //
//        [HuQiJingsharManage shareManage].sssss = @"3";
//        //        }
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"dengluye" object:nil];
//    }
    
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}


//计算字体长度
-(float)NSStringwithsize:(int )a str:(NSString *)string
{
    
    UIFont *font = [UIFont systemFontOfSize:a];
    
    CGSize size = [string sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    // 名字的H
    //CGFloat nameH = size.height;
    // 名字的W
    CGFloat strwidth = size.width;
    
    return strwidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)netcontrollerview:(UIButton *)btn
{
    
    if (btn.tag == 2) {
        
        mymakeController *mymake = [[mymakeController alloc] init];
        mymake.doctorSno = self.doctorSno;
        mymake.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mymake animated:YES];
    }else if (btn.tag == 3){
        
        MyClientViewController *myclient = [[MyClientViewController alloc] init];
        myclient.hidesBottomBarWhenPushed = YES;
        myclient.doctorsno = self.doctorSno;
        [self.navigationController pushViewController:myclient animated:YES];
    }else if (btn.tag == 4){
    
        ShareViewController *shareview = [[ShareViewController alloc] init];
        shareview.userSno = self.doctorSno;
        shareview.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:shareview animated:YES];
    }else{
        
        
        [self getdate];
        
        [self soaprequstWithcustomerSno:@"" doctorSno:self.doctorSno yearCount:[NSString stringWithFormat:@"%ld",self.year] monthCount:[NSString stringWithFormat:@"%ld",self.month] dayCount:[NSString stringWithFormat:@"%ld",self.day]];
        
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
            
            NSLog(@"---self.doctorSno:%@ -   [NSString stringWithFormat:@"",self.weekCount]:%@ ---- [strary objectAtIndex:0]:%@---- [strary objectAtIndex:1]:%@ --- setType:0",self.doctorSno,[NSString stringWithFormat:@"%ld",self.weekCount],[strary objectAtIndex:0],[strary objectAtIndex:1]);
            
            [self soaprequstWithdoctorSno:self.doctorSno weekCount:[NSString stringWithFormat:@"%ld",self.weekCount] hourCount:[strary objectAtIndex:0] minuteCount:[strary objectAtIndex:1] setType:@"0"];//(setType设置类型:1为忙0为闲)
            
            
            NSLog(@"那么多:%@",str);
            [_timeclickarray removeObject:btntitle];
            haver = YES;
            return;
        }
    }
    
    if (haver == NO) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"doctor_time_off"] forState:UIControlStateNormal];
        
        NSLog(@"---self.doctorSno:%@ -   [NSString stringWithFormat:@"",self.weekCount]:%@ ---- [strary objectAtIndex:0]:%@---- [strary objectAtIndex:1]:%@ --- setType:1",self.doctorSno,[NSString stringWithFormat:@"%ld",self.weekCount],[strary objectAtIndex:0],[strary objectAtIndex:1]);
        
        [self soaprequstWithdoctorSno:self.doctorSno weekCount:[NSString stringWithFormat:@"%ld",self.weekCount] hourCount:[strary objectAtIndex:0] minuteCount:[strary objectAtIndex:1] setType:@"1"];//(setType设置类型:1为忙0为闲)
        
        
        [_timeclickarray addObject:btntitle];
    }
    
    NSLog(@"_timeclickarray%@",_timeclickarray);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark --SOAP请求
//获取时间的表格
-(void)soaprequstWithcustomerSno:(NSString *)customerSno doctorSno:(NSString *)doctorSno yearCount:(NSString *)yearCount monthCount:(NSString *)monthCount dayCount:(NSString *)dayCount
{
    NSLog(@"UID:%@-----PSW:%@------doctorSno：%@-----yearCount;%@--- monthCount:%@--dayCount:%@----self.weekCount:%ld",UID,PSW,doctorSno,yearCount,monthCount,dayCount,self.weekCount);
    
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


#pragma mark -- soap请求
//获取客户专属推荐码及APP下载链接
-(void)soaprequstWithdoctorSno:(NSString *)userSno
{
    
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetDoctorInfo xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<doctorSno>%@</doctorSno>\n"
                             "</GetDoctorInfo>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,userSno];
    
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetDoctorInfo" forHTTPHeaderField:@"SOAPAction"];
    
    
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

#pragma mark ------- 登录界面的请求 -------

//用户协议
-(void)soaprequestwithinfoSno
{
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetNewsDataBySno xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<infoSno>%@</infoSno>\n"
                             "</GetNewsDataBySno>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,@"8f327150-144f-4da1-9498-74e7024b9a96"
                             ];
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetNewsDataBySno" forHTTPHeaderField:@"SOAPAction"];
    
    
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

//GetAuthCode
//发送手机号码并返回发送内容
-(void)soaprequestwithphonenumber
{
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetAuthCode xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<phoneNo>%@</phoneNo>\n"
                             "</GetAuthCode>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,_phonenumber.text
                             ];
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetAuthCode" forHTTPHeaderField:@"SOAPAction"];
    
    
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
//CheckLogin
//手机号码+验证码+用户类型 登录验证,成功则返回客户/医生SNO     //超级验证码7698
-(void)soaprequestwithPhoneNo:(NSString *)phoneNo AuthCode:(NSString *)authCode UserType:(NSString *)userType recommendNo:(NSString *)recommendNo registrationId:(NSString *)registrationId
{
    
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<CheckLogin3 xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<phoneNo>%@</phoneNo>\n"
                             "<authCode>%@</authCode>\n"
                             "<userType>%@</userType>\n"
                             "<recommendNo>%@</recommendNo>\n"
                             "<registrationId>%@</registrationId>\n"
                             "</CheckLogin3>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,_phonenumber.text
                             ,authCode,userType,recommendNo,registrationId];
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/CheckLogin3" forHTTPHeaderField:@"SOAPAction"];
    
    
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
    
    if ((long)[urlresponse statusCode] == 400) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"链接失败，请返回上一页再回来！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
    //NSLog(@"connection: didReceiveData:2");
    
}

//如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConenction");
    
    // NSLog(@"ERROR with theConenction");
    UIAlertView * alert =
    [[UIAlertView alloc]
     initWithTitle:@"提示"
     message:@"链接超时或无网络!"
     delegate:self
     cancelButtonTitle:nil
     otherButtonTitles:@"OK", nil];
    [alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // NSLog(@"3 DONE. Received Bytes: %ld", [webData length]);
//    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
   // NSLog(@"分享的数据--%@",theXML);
    
    
//            NSString *str = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
//    
//    
//                 NSLog(@"请求回来的数据-2--%@",str);
    
    //重新加載xmlParser
    //    if( xmlParser )
    //    {
    //       // [xmlParser release];
    //    }
    
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
    
    if ([elementName isEqualToString:@"GetDoctorInfoResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    if ([elementName isEqualToString:@"GetDoctorTimeSetBySnoAndWeekResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    
    if ([elementName isEqualToString:@"SetDoctorTimeByWeekResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    
    if ([elementName isEqualToString:@"CheckLogin3Result"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    if ([elementName isEqualToString:@"GetAuthCodeResult"]) {//返回的验证码
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    
    if ([elementName isEqualToString:@"GetNewsDataBySnoResult"]) {//返回的协议
        
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
    
    if ([elementName isEqualToString:@"GetDoctorInfoResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
       // NSLog(@"____________分享的数据表详情：dic%@",dic);
        
        NSArray *dataary = [dic objectForKey:@"basicData"];
        NSDictionary *basicData;
        if (dataary.count > 0) {
            basicData = [dataary objectAtIndex:0];
        }
        
       self.name.text = [basicData objectForKey:@"TrueName"];
        self.name.frame = CGRectMake(self.view.bounds.size.width/2 - (([self NSStringwithsize:16 str:self.name.text])/2) + 20, 168 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:self.name.text], 20);
        self.personimage.frame = CGRectMake(self.view.bounds.size.width/2 -(20 + [self NSStringwithsize:16 str:self.name.text])/2, 168 + ((self.view.bounds.size.width* 0.373)/2), 20, 20);
        
        [self.deadimage sd_setImageWithURL:[NSURL URLWithString:[basicData objectForKey:@"PicSrc"]]];
        
        self.hospital.text = [dic objectForKey:@"hospitalName"];
        self.hospital.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:16 str:[dic objectForKey:@"hospitalName"]]/2) + 12, 198 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:[dic objectForKey:@"hospitalName"]], 20);
        
        self.hospitalimage.frame = CGRectMake(self.view.bounds.size.width/2 - 12 -  ([self NSStringwithsize:16 str:[dic objectForKey:@"hospitalName"]]/2), 198 + ((self.view.bounds.size.width * 0.373)/2), 20, 20);
        
        if ([dic objectForKey:@"customersum"] == nil) {
            self.kehushu.text =[NSString stringWithFormat:@"%@",@"0"];
            self.kehushu.frame = CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:self.kehushu.text] - 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20);
            
            self.kehu.frame = CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:self.kehushu.text] - 15 - [self NSStringwithsize:16 str:@"患者:"], 228 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:@"患者:"], 20);
        }else{
        
            self.kehushu.text =[NSString stringWithFormat:@"%@",[dic objectForKey:@"customersum"]];
            self.kehushu.frame = CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:self.kehushu.text] - 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20);
            
            self.kehu.frame = CGRectMake(self.view.bounds.size.width/2 - [self NSStringwithsize:17 str:self.kehushu.text] - 15 - [self NSStringwithsize:16 str:@"患者:"], 228 + ((self.view.bounds.size.width * 0.373)/2), [self NSStringwithsize:16 str:@"患者:"], 20);
        }
       
        
        
        if ([dic objectForKey:@"ordersum"] == nil) {
            self.yuyueshu.text = [NSString stringWithFormat:@"%@",@"0"];
            self.yuyueshu.frame = CGRectMake(self.view.bounds.size.width/2 + [self NSStringwithsize:17 str:@"预约数:"] + 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20);
        }else{
            self.yuyueshu.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"ordersum"]];
            self.yuyueshu.frame = CGRectMake(self.view.bounds.size.width/2 + [self NSStringwithsize:17 str:@"预约数:"] + 10, 228 + ((self.view.bounds.size.width * 0.373)/2), 150, 20);
        }
        
    }
    
    
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
    
    
    if ([elementName isEqualToString:@"SetDoctorTimeByWeekResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        //NSLog(@"医生设置时间：dic%@",dic);
        
        
    }


    if ([elementName isEqualToString:@"CheckLogin3Result"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"发送验证码返回的结果:%@",dic);
        NSString *ret = [dic objectForKey:@"ret"];
        NSString *msg = [dic objectForKey:@"msg"];
        NSString *state = [dic objectForKey:@"state"];
        NSString *loginToken = [dic objectForKey:@"loginToken"];
        
        self.isNew = [NSString stringWithFormat:@"%@",[dic objectForKey:@"isNew"]];
        
        self.doctorSno = ret;
        NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
        [userdf setObject:loginToken forKey:@"loginToken"];
        [userdf setObject:ret forKey:@"customerSno"];
        [userdf synchronize];
        
        NSLog(@"用户登录的客户索引:%@",ret);
        
        
        if ([state isEqualToString:@"1"]) {
            [self enter];
        }else if([state isEqualToString:@"0"]){
            UIAlertView *alerter = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alerter show];
            
        }else{
            
        }
        
    }
    
    
    //返回的验证码
    if ([elementName isEqualToString:@"GetAuthCodeResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
    }
    
    
    
    if ([elementName isEqualToString:@"GetNewsDataBySnoResult"]) {
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"用户协议%@",dic);
        NSString *ret = [dic objectForKey:@"ret"];
        NSString *msg = [dic objectForKey:@"msg"];
        NSString *state = [dic objectForKey:@"state"];
        
        NSLog(@"获取验证码的请求:ret%@-- msg%@--state%@",ret,msg,state);
        
        NSMutableArray *infoData = [dic objectForKey:@"infoData"];
        for (NSDictionary *info in infoData) {
            
            self.Contents = [info objectForKey:@"Contents"];
            self.Description = [info objectForKey:@"Description"];
            self.PicSrc = [info objectForKey:@"PicSrc"];
            self.Title = [info objectForKey:@"Title"];
        }
        
        [self xieyi];
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
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
}

#pragma mark ------ 登录处理区 ---- 
//选择协议
-(void)agreementclick:(UIButton *)butn
{
    
    static int a = 0;
    
    if (butn.tag == 10) {
        if (a % 2 == 0) {
            [butn setBackgroundImage:[UIImage imageNamed:@"05"] forState:UIControlStateNormal];
            NSLog(@"05");
            self.Isxieyi = NO;
        }else{
            [butn setBackgroundImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
            NSLog(@"06");
            self.Isxieyi = YES;
        }
    }else{
        [self soaprequestwithinfoSno];
    }
    a++;
}

//获取验证码
-(void)testbtnclick:(UIButton *)button
{
    
    if ([_phonenumber.text isEqualToString:@""] || _phonenumber.text == nil) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请输入手机号码！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    if (_phonenumber.text.length < 11 || _phonenumber.text.length > 11) {
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"输入的号码有误！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    if (_timer == nil) {
        self.times = 0;
        button.alpha = 0.7;
        button.backgroundColor = [UIColor grayColor];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dingshiqi) userInfo:nil repeats:YES];
        _testbtn.userInteractionEnabled = NO;
        [self soaprequestwithphonenumber];
        
        NSUserDefaults *userd = [NSUserDefaults standardUserDefaults];
        [userd setObject:_phonenumber.text forKey:@"phonenumber"];
        [userd synchronize];
        
    }
    
}

//提交
-(void)commitclick
{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *registration_id = [user objectForKey:@"registration_id"];
    
    if ([_phonenumber.text isEqualToString:@""] || _phonenumber.text == nil) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请输入手机号码！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    if (_phonenumber.text.length < 11 || _phonenumber.text.length > 11) {
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"输入的号码有误！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    
    NSLog(@"提交");
    if ([_testnumber.text isEqualToString:@""] || _testnumber.text == nil) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"验证码不能为空！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    
    if (_testnumber.text.length < 4 || _testnumber.text.length > 4) {
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"输入的验证码有误！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    
    
    if (self.personordocter == NO) {
        [self soaprequestwithPhoneNo:_phonenumber.text AuthCode:_testnumber.text UserType:@"CommomUser" recommendNo:self.recommendNo registrationId:registration_id];
        
        //[self gotoIndividualcenter];//客户中心
    }else{
        
        [self soaprequestwithPhoneNo:_phonenumber.text AuthCode:_testnumber.text UserType:@"CommomDoctor" recommendNo:self.recommendNo registrationId:registration_id];
        //[self gotodoctercenter];//医生个人中心
    }
    
}

-(void)dingshiqi{
    
    NSInteger b = 120 - self.times;
    NSString *time = [NSString stringWithFormat:@"剩余%ld秒",(long)b];
    
    if ([time isEqualToString:@"剩余0秒"]) {
      
        _testbtn.alpha = 1;
        [_testbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _testbtn.userInteractionEnabled = YES;
        [_timer invalidate];
        _timer = nil;
        
    }else{
    
        [_testbtn setTitle:time forState:UIControlStateNormal];
        
    }
    self.times++;
}

//进入页面
-(void)enter
{
    if (self.Isxieyi == YES) {
        
        if (self.personordocter == NO) {
//            [self gotoIndividualcenter];//客户中心
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:@"CommomUser" forKey:@"CommomUserORCommomDoctor"];
            [user setObject:_phonenumber.text forKey:@"customerphonenumber"];
            [user synchronize];
            
        }else{
            
            [self gotodoctercenter];//医生个人中心
            
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:@"CommomDoctor" forKey:@"CommomUserORCommomDoctor"];
            [user setObject:_phonenumber.text forKey:@"customerphonenumber"];
            [user synchronize];
            
        }
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请同意协议条款！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
    
}

//显示协议窗口
-(void)xieyi
{
    
    if (_view0) {
        return;
    }else{
        _view0 = [[UIView alloc] initWithFrame:self.view.bounds];
        _view0.backgroundColor = [UIColor blackColor];
        _view0.alpha = 0.5;
        _view0.tag = 110;
        [self.view addSubview:_view0];
        
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(30, 80, self.view.bounds.size.width - 60, self.view.bounds.size.height * 0.667)];
        _view1.backgroundColor = [UIColor whiteColor];
        _view1.layer.masksToBounds = YES;
        _view1.layer.cornerRadius = 8;
        _view1.tag = 120;
        [self.view addSubview:_view1];
    }
    
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, _view1.bounds.size.width , _view1.bounds.size.height - 40)];
    webView.backgroundColor = [UIColor whiteColor];
    webView.scalesPageToFit = NO;
    [_view1 addSubview:webView];
    NSString *html_str = self.Contents;
    [webView loadHTMLString:html_str baseURL:nil];
    
    
    UIButton *bbtt = [[UIButton alloc] initWithFrame:CGRectMake(50, _view1.bounds.size.height - 35, _view1.bounds.size.width - 100, 30)];
    [bbtt setTitle:@"已阅读" forState:UIControlStateNormal];
    [bbtt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bbtt.layer.masksToBounds = YES;
    bbtt.layer.cornerRadius = 7;
    [bbtt setBackgroundImage:[UIImage imageNamed:@"小按钮s"] forState:UIControlStateNormal];
    [bbtt addTarget:self action:@selector(ISAgree:) forControlEvents:UIControlEventTouchUpInside];
    [_view1 addSubview:bbtt];
    
    
}

#pragma mark--- 医生个人中心
-(void)gotodoctercenter
{

    
    if ([self.isNew isEqualToString:@"0"]) {

        [self mainview];
        
    }else if([self.isNew isEqualToString:@"1"]){
        
        self.isNew = @"0";
        DoctorRegistViewController *regist = [[DoctorRegistViewController alloc] init];
        regist.doctorSno = self.doctorSno;
        regist.phone = _phonenumber.text;
        [self.navigationController pushViewController:regist animated:YES];
    }else{
        ShouYeViewController *main = [[ShouYeViewController alloc] init];
        [self.navigationController pushViewController:main animated:YES];
    }
    
    
}

-(void)ISAgree:(UIButton *)button
{
    
    UIButton *setbtn = (UIButton *)[self.view viewWithTag:10];
    
    [setbtn setBackgroundImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];//同意
    UIView *v1 = (UIView *)[self.view viewWithTag:110];
    [v1 removeFromSuperview]; v1 = nil;
    
    UIView *v2 = (UIView *)[self.view viewWithTag:120];
    [v2 removeFromSuperview]; v2 = nil;
    
    [_view0 removeFromSuperview];
    _view0 = nil;
    [_view1 removeFromSuperview];
    _view1 = nil;
    
    self.Isxieyi = YES;
    
}

@end
