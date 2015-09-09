//
//  myclientmenbergroupViewController.m
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientmenbergroupViewController.h"
#import "TopBarView.h"

@interface myclientmenbergroupViewController ()

@end

@implementation myclientmenbergroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"分组成员";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaa) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [topbar addSubview:save];
    
    UILabel *groupname = [[UILabel alloc] initWithFrame:CGRectMake(20, 64 + 12, 120, 25)];
    groupname.text = @"分组名字";
    groupname.textColor = [self colorWithRGB:0x999999 alpha:1];
    groupname.font = [UIFont systemFontOfSize:15];
    groupname.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupname];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 45, self.view.bounds.size.width, 45)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    UILabel *groupmanber = [[UILabel alloc] initWithFrame:CGRectMake(20, 64 + 90 + 12, 120, 25)];
    groupmanber.text = @"分组成员";
    groupmanber.textColor = [self colorWithRGB:0x999999 alpha:1];
    groupmanber.font = [UIFont systemFontOfSize:15];
    groupmanber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupmanber];
    
    UIView *manberview = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 90 + 45, self.view.bounds.size.width, 200)];
    manberview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:manberview];
    
    
    UIButton *addbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 17, 50, 50)];
    [addbtn setBackgroundImage:[UIImage imageNamed:@"yuanxingjia"] forState:UIControlStateNormal];
    [manberview addSubview:addbtn];
    
    UIButton *addbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(90, 17, 50, 50)];
    [addbtn2 setBackgroundImage:[UIImage imageNamed:@"yuanxingjian"] forState:UIControlStateNormal];
    [manberview addSubview:addbtn2];
    
    
    UIButton *cancelbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 50, self.view.bounds.size.height - 100, 100, 40)];
    [cancelbtn setTitle:@"删除分组" forState:UIControlStateNormal];
    cancelbtn.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    cancelbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    cancelbtn.backgroundColor = [self colorWithRGB:0x00c5bb alpha:1];
    cancelbtn.layer.masksToBounds = YES;
    cancelbtn.layer.cornerRadius = 3;
    [self.view addSubview:cancelbtn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)comebacksaaa
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
