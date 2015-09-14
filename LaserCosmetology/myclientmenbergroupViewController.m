//
//  myclientmenbergroupViewController.m
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientmenbergroupViewController.h"
#import "TopBarView.h"
#import "mycustomerdata.h"
#import "PrefixHeader.pch"
#import "myclientMenberGroupArrayViewController.h"

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
    
    _grouptitle = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, self.view.bounds.size.width - 30, 20)];
    _grouptitle.text = self.groupstr;
    _grouptitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    _grouptitle.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    [view addSubview:_grouptitle];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 10, 20, 20)];
    [btn setBackgroundImage:[UIImage imageNamed:@"huidianshnchu"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(canceltext) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    

    UILabel *groupmanber = [[UILabel alloc] initWithFrame:CGRectMake(20, 64 + 90 + 12, 120, 25)];
    groupmanber.text = @"分组成员";
    groupmanber.textColor = [self colorWithRGB:0x999999 alpha:1];
    groupmanber.font = [UIFont systemFontOfSize:15];
    groupmanber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupmanber];
    
    _manberview = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 90 + 45, self.view.bounds.size.width, 200)];
    _manberview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_manberview];
    
    
    _addbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 17, 50, 50)];
    [_addbtn setBackgroundImage:[UIImage imageNamed:@"yuanxingjia"] forState:UIControlStateNormal];
    [_addbtn addTarget:self action:@selector(addGroupmanberbtn) forControlEvents:UIControlEventTouchUpInside];
    [_manberview addSubview:_addbtn];
    
    _subtraction = [[UIButton alloc] initWithFrame:CGRectMake(90, 17, 50, 50)];
    [_subtraction setBackgroundImage:[UIImage imageNamed:@"yuanxingjian"] forState:UIControlStateNormal];
    [_subtraction addTarget:self action:@selector(cancelbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [_manberview addSubview:_subtraction];
    
    
    UIButton *cancelbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 50, self.view.bounds.size.height - 100, 100, 40)];
    [cancelbtn setTitle:@"删除分组" forState:UIControlStateNormal];
    cancelbtn.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    cancelbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    cancelbtn.backgroundColor = [self colorWithRGB:0x00c5bb alpha:1];
    cancelbtn.layer.masksToBounds = YES;
    cancelbtn.layer.cornerRadius = 3;
    [self.view addSubview:cancelbtn];
    
    
    _data = [[NSMutableData alloc] init];
    _mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.manberarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int c = 0; c < 7; c++) {
        [self.manberarray addObject:[NSString stringWithFormat:@"%D",c]];
    }
    
    [self addmanbers];
    [self startrequest];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)canceltext
{
     _grouptitle.text = @"";
}

-(void)addmanbers
{

    for (int c = 0; c < self.manberarray.count; c++) {
        UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + c];
        [btn removeFromSuperview];
    }
    
    float width = 50;
    float heiht = width;
    
    for (int j = 0; j < [self.manberarray count]; j ++) {
        
        NSInteger xn = j % 5;
        NSInteger yn = j / 5;
        
        int x = (20 + width) * xn + 20;
        int y = (20 + heiht) * yn + 17;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        button.backgroundColor = [UIColor redColor];
        [button setBackgroundImage:[UIImage imageNamed:@"txtx"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(cancelbuttonclickl:) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = NO;
        button.tag = 10 + j;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 25;
        [_manberview addSubview:button];
    }
    
    NSInteger a1 = [self.manberarray count];
    NSInteger xn1 = a1 % 5;
    NSInteger yn1 = a1 / 5;
    
    int x1 = (20 + width) * xn1 + 20;
    int y1 = (20 + heiht) * yn1 + 17;
   
    _addbtn.frame = CGRectMake(x1, y1, width , heiht);

    NSInteger a2 = [self.manberarray count] + 1;
    NSInteger xn2 = a2 % 5;
    NSInteger yn2 = a2 / 5;
    
    int x2 = (20 + width) * xn2 + 20;
    int y2 = (20 + heiht) * yn2 + 17;

    _subtraction.frame = CGRectMake(x2, y2, width , heiht);

}

-(void)cancelbtnclick
{
    static NSInteger a = 0;
    
    float width = 50;
    float heiht = width;
    
    if (a % 2 == 0) {
        
        for (int j = 0; j < [self.manberarray count]; j ++) {
            
            NSInteger xn = j % 5;
            NSInteger yn = j / 5;
            
            int x = (20 + width) * xn + 20;
            int y = (20 + heiht) * yn + 17;
            
            UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(x - 5, y - 5, 20, 20)];
            imagev.image = [UIImage imageNamed:@"hongdianshanchu"];
            imagev.tag = 100 + j;
            [_manberview addSubview:imagev];
            
            UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + j];
            btn.userInteractionEnabled = YES;
        }
        
    }else{
        
        for (int j = 0; j < [self.manberarray count]; j ++) {
            
            UIImageView *imagev = (UIImageView *)[_manberview viewWithTag:100 + j];
            [imagev removeFromSuperview];
            
            UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + j];
            btn.userInteractionEnabled = NO;
        }
    
    }
    
    a++;
}

-(void)cancelbuttonclickl:(UIButton *)btn
{
    NSLog(@"12345");
    
    [self.manberarray removeObjectAtIndex:btn.tag - 10];
    [btn removeFromSuperview];
    
    NSLog(@"--self.manberarray.count:%ld",self.manberarray.count);
    
    [self addmanbers];

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

-(void)addGroupmanberbtn
{
    myclientMenberGroupArrayViewController *addmanber = [[myclientMenberGroupArrayViewController alloc] init];
    [self.navigationController pushViewController:addmanber animated:YES];
}

-(void)comebacksaaa
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark request

-(void)startrequest
{
    NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=serviced&toPage=1&Count_per_Page=15",HTTPREQUESTPDOMAIN,self.doctorsno];
    
    [self requstwithurl:string];
}

#pragma mark  request

-(void)requstwithurl:(NSString *)str
{
    NSURL *urlstr = [NSURL URLWithString:str];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:urlstr];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requst delegate:self];
    
    [connection start];
    
    NSLog(@"url--------%@",urlstr);
}

#pragma mark  requestdelegate
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求失败");
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"收到响应");
    
    [_data setData:[NSData data]];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"请求数据接收");
    [_data appendData:data];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    // NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    
    //NSLog(@"%@",str);
    
    //JSON解析器
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:nil];
    
    NSString *state = [dic objectForKey:@"state"];
    NSString *msg = [dic objectForKey:@"msg"];
    
    
    NSMutableArray *customerData = [dic objectForKey:@"customerData"];
    for (NSDictionary *mycusdiction in customerData) {
        mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
        [_mycustomerDataarray addObject:mycustom];
    }
    
    
    if ([state isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
}


@end
