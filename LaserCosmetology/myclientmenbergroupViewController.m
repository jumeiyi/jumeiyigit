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
    
    
    UILabel *groupname = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 120, 25)];
    groupname.text = @"分组名字";
    groupname.textColor = [UIColor grayColor];
    groupname.font = [UIFont systemFontOfSize:20];
    groupname.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupname];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 130, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    UILabel *groupmanber = [[UILabel alloc] initWithFrame:CGRectMake(20, 80 + 160, 120, 25)];
    groupmanber.text = @"分组成员";
    groupmanber.textColor = [UIColor grayColor];
    groupmanber.font = [UIFont systemFontOfSize:20];
    groupmanber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupmanber];
    
    UIView *manberview = [[UIView alloc] initWithFrame:CGRectMake(0, 130 + 160, self.view.bounds.size.width, 200)];
    manberview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:manberview];
    
    
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
-(void)comebacksaaa
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
