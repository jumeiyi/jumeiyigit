//
//  HtmlshouyeChartView.m
//  聚美医
//
//  Created by fenghuang on 16/3/23.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import "HtmlshouyeChartView.h"
#import "TopBarView.h"

@interface HtmlshouyeChartView ()

@end

@implementation HtmlshouyeChartView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = self.namestr;
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaas) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    self.webView.frame = CGRectMake(0,0, self.view.bounds.size.width,self.view.bounds.size.height);
    
}

-(void)comebacksaaas{
    [self.navigationController popViewControllerAnimated:YES];
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

@end
