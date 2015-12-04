//
//  ShouYeViewController.m
//  聚美医
//
//  Created by fenghuang on 15/12/4.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "ShouYeViewController.h"
#import "mymakeController.h"
#import "MyClientViewController.h"
#import "ShareViewController.h"

@interface ShouYeViewController ()

@end

@implementation ShouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [self colorWithRGB:0xDEDEDE alpha:1];
    
    UIImageView *imagevie = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180)];
    imagevie.image = [UIImage imageNamed:@"shouye_bg"];
    [self.view addSubview:imagevie];
    
    UIView *whitview = [[UIView alloc] initWithFrame:CGRectMake(0, 180, self.view.bounds.size.width,((self.view.bounds.size.height/5)* 3 - 46) - 190)];
    whitview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whitview];
    
    UIImageView *deadimage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3, 180 - ((self.view.bounds.size.width/3)/2), self.view.bounds.size.width/3, self.view.bounds.size.width/3)];
    deadimage.image = [UIImage imageNamed:@"图片4"];
    [self.view addSubview:deadimage];
    
    UIImageView *person = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 20, 195 + ((self.view.bounds.size.width/3)/2), 20, 20)];
    person.image = [UIImage imageNamed:@"xingming_@3x"];
    [self.view addSubview:person];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 50, 195 + ((self.view.bounds.size.width/3)/2), 100, 20)];
    name.text = @"梁红";
    name.textColor = [self colorWithRGB:0x666666 alpha:1];
    [self.view addSubview:name];
    
    
    UIImageView *hospitalimage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 10, 220 + ((self.view.bounds.size.width/3)/2), 20, 20)];
    hospitalimage.image = [UIImage imageNamed:@"yiyuan_@3x"];
    [self.view addSubview:hospitalimage];
    
    UILabel *hospital = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 40, 220 + ((self.view.bounds.size.width/3)/2), 150, 20)];
    hospital.text = @"高级医院";
    hospital.textColor = [self colorWithRGB:0x666666 alpha:1];
    [self.view addSubview:hospital];
    
    
    UILabel *kehu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 - 50, 245 + ((self.view.bounds.size.width/3)/2), 150, 20)];
    kehu.text = @"客户:";
    kehu.textColor = [self colorWithRGB:0x666666 alpha:1];
    [self.view addSubview:kehu];
    
    UILabel *kehushu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 , 245 + ((self.view.bounds.size.width/3)/2), 150, 20)];
    kehushu.text = @"3000";
    kehushu.textColor = [self colorWithRGB:0x1bc6bc alpha:1];
    [self.view addSubview:kehushu];
    
    UILabel *yuyuedanshu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 50, 245 + ((self.view.bounds.size.width/3)/2), 150, 20)];
    yuyuedanshu.text = @"预约单数:";
    yuyuedanshu.textColor = [self colorWithRGB:0x666666 alpha:1];
    [self.view addSubview:yuyuedanshu];
    
    UILabel *yuyueshu = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3 + 130, 245 + ((self.view.bounds.size.width/3)/2), 150, 20)];
    yuyueshu.text = @"5000";
    yuyueshu.textColor = [self colorWithRGB:0xf5a556 alpha:1];
    [self.view addSubview:yuyueshu];
    
    
    float withd = (self.view.bounds.size.width - 2)/2;
    float higth = self.view.bounds.size.height/5;
    float y = (self.view.bounds.size.height/5)* 3 - 46;
    
    UIView *imagebg1 = [[UIView alloc] initWithFrame:CGRectMake(0, y, withd, higth)];
    imagebg1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg1];
    
    UIImageView *buttonbg1 = [[UIImageView alloc] initWithFrame:CGRectMake(withd/2 - ((higth - 50)/2), y + 5, higth - 50, higth - 50)];
    buttonbg1.image = [UIImage imageNamed:@"wodeshijian_@3x"];
    [self.view addSubview:buttonbg1];
    
    UILabel *shijian = [[UILabel alloc] initWithFrame:CGRectMake(imagebg1.bounds.size.width/2 - 35, imagebg1.bounds.size.height - 35, 80, 20)];
    shijian.text = @"我的时间";
    shijian.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg1 addSubview:shijian];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, y, withd, higth)];
    button1.backgroundColor = [UIColor clearColor];
    [button1 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 1;
    [self.view addSubview:button1];
    
    
    
    
    UIView *imagebg2 = [[UIView alloc] initWithFrame:CGRectMake(withd + 2, y, withd, higth)];
    imagebg2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg2];
    
    UIImageView *buttonbg2 = [[UIImageView alloc] initWithFrame:CGRectMake(withd + 2 + withd/2 - ((higth - 50)/2), y + 5, higth - 50, higth - 50)];
    buttonbg2.image = [UIImage imageNamed:@"wodeyuyue_@3x"];
    [self.view addSubview:buttonbg2];
    
    UILabel *yuyue = [[UILabel alloc] initWithFrame:CGRectMake(imagebg2.bounds.size.width/2 - 35, imagebg2.bounds.size.height - 35, 80, 20)];
    yuyue.text = @"我的预约";
    yuyue.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg2 addSubview:yuyue];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(withd + 2, y, withd, higth)];
    button2.backgroundColor = [UIColor clearColor];
    [button2 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 2;
    [self.view addSubview:button2];
    
    
    
    
    UIView *imagebg3 = [[UIView alloc] initWithFrame:CGRectMake(0, y + 2 + higth, withd, higth)];
    imagebg3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg3];
    
    UIImageView *buttonbg3 = [[UIImageView alloc] initWithFrame:CGRectMake(withd/2 - ((higth - 50)/2), y + 2 + higth+ 5, higth - 50, higth - 50)];
    buttonbg3.image = [UIImage imageNamed:@"wodekehu_@3x"];
    [self.view addSubview:buttonbg3];
    
    UILabel *kehubg = [[UILabel alloc] initWithFrame:CGRectMake(imagebg3.bounds.size.width/2 - 35, imagebg3.bounds.size.height - 35, 80, 20)];
    kehubg.text = @"我的客户";
    kehubg.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg3 addSubview:kehubg];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, y + 2 + higth, withd, higth)];
    button3.backgroundColor = [UIColor clearColor];
    [button3 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 3;
    [self.view addSubview:button3];
    
    
    
    
    UIView *imagebg4 = [[UIView alloc] initWithFrame:CGRectMake(withd + 2, y + 2 + higth, withd,higth)];
    imagebg4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imagebg4];
    
    UIImageView *buttonbg4 = [[UIImageView alloc] initWithFrame:CGRectMake(withd + 2 + withd/2 - ((higth - 50)/2), y + 5 + 2 + higth, higth - 50, higth - 50)];
    buttonbg4.image = [UIImage imageNamed:@"tianjiahuanzhese_@3x"];
    [self.view addSubview:buttonbg4];
    
    UILabel *tianjia = [[UILabel alloc] initWithFrame:CGRectMake(imagebg4.bounds.size.width/2 - 35, imagebg4.bounds.size.height - 35, 80, 20)];
    tianjia.text = @"添加患者";
    tianjia.textColor = [self colorWithRGB:0x666666 alpha:1];
    [imagebg4 addSubview:tianjia];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(withd + 2, y + 2 + higth, withd,higth)];
    button4.backgroundColor = [UIColor clearColor];
    [button4 addTarget:self action:@selector(netcontrollerview:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 4;
    [self.view addSubview:button4];
    
    
    
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)netcontrollerview:(UIButton *)btn
{
    
    if (btn.tag == 2) {
        
        mymakeController *mymake = [[mymakeController alloc] init];
        [self.navigationController pushViewController:mymake animated:YES];
    }else if (btn.tag == 3){
        
        MyClientViewController *myclient = [[MyClientViewController alloc] init];
        [self.navigationController pushViewController:myclient animated:YES];
    }else if (btn.tag == 4){
    
        ShareViewController *shareview = [[ShareViewController alloc] init];
        [self.navigationController pushViewController:shareview animated:YES];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂时无法跳转" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
