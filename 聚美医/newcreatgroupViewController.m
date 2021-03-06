//
//  newcreatgroupViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/21.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "newcreatgroupViewController.h"
#import "TopBarView.h"
#import "myclientMenberGroupArrayViewController.h"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "mycustomerdata.h"
#import "PrefixHeader.pch"
#import "UIButton+WebCache.h"
@interface newcreatgroupViewController ()

@end

@implementation newcreatgroupViewController

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
    [save addTarget:self action:@selector(savebtnclickqq) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];
    
    UILabel *groupname = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12, [self NSStringwithsize:15 str:@"分组名字"], 25)];
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
    
    
    UILabel *groupmanber = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 90 + 12, [self NSStringwithsize:15 str:@"分组名字"], 25)];
    groupmanber.text = @"分组成员";
    groupmanber.textColor = [self colorWithRGB:0x999999 alpha:1];
    groupmanber.font = [UIFont systemFontOfSize:15];
    groupmanber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:groupmanber];
    
    _manberview = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 90 + 45, self.view.bounds.size.width, self.view.bounds.size.height - (64 + 90 + 45))];
    _manberview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_manberview];
    
    
    _addbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 17, 60, 60)];
    [_addbtn setBackgroundImage:[UIImage imageNamed:@"yuanxingjia"] forState:UIControlStateNormal];
    [_addbtn addTarget:self action:@selector(addGroupmanberbtn) forControlEvents:UIControlEventTouchUpInside];
    [_manberview addSubview:_addbtn];
    
    _subtraction = [[UIButton alloc] initWithFrame:CGRectMake(90, 17, 60, 60)];
    [_subtraction setBackgroundImage:[UIImage imageNamed:@"yuanxingjian"] forState:UIControlStateNormal];
    [_subtraction addTarget:self action:@selector(cancelbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [_manberview addSubview:_subtraction];
    
    
    self.gentmanberarrays = [[NSMutableArray alloc] initWithCapacity:0];
    self.manberarray = [[NSMutableArray alloc] initWithCapacity:0];
    self.getmanberarrayIDs = [[NSMutableArray alloc] initWithCapacity:0];
    self.customersnikenames = [[NSMutableArray alloc] initWithCapacity:0];
    
    if (self.manberarray.count > 0) {
        mycustomerdata *data = [self.manberarray objectAtIndex:0];
        self.groupid = data.groupid;
    }
    
   
    self.groupid = @"";   self.customersIDs = @"";
    
    [self addmanbers];

}

-(void)viewWillAppear:(BOOL)animated
{
    
    for (mycustomerdata *mydata in self.gentmanberarrays) {
        NSLog(@"把选择到的客户ID添加%@",mydata.sno);
        [self.manberarray addObject:mydata];
        [self.getmanberarrayIDs addObject:mydata.sno];
        [self.customersnikenames addObject:mydata.nickname];
    }
    [self.gentmanberarrays removeAllObjects];
    [self addmanbers];
}

-(void)getManberarrayWithary:(NSArray *)ary{
    
    NSLog(@"返回来的数组 %ld",ary.count);
    for (mycustomerdata *myda in ary) {
        [self.gentmanberarrays addObject:myda];
    }
    
    NSLog(@"new返回来之后的self.gentmanberarrays== %ld",self.gentmanberarrays.count);
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
    NSLog(@"将要新建 self.manberarray.count:%ld",self.manberarray.count);
    
    for (int c = 0; c < self.manberarray.count + 1; c++) {
        UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + c];
        [btn removeFromSuperview];
    }
    
    for (int c = 0; c < self.manberarray.count + 1; c++) {
        UILabel *btn = (UILabel *)[_manberview viewWithTag:20 + c];
        [btn removeFromSuperview];
    }
    
    float width = 60;
    float heiht = width;
    
    NSLog(@"self.manberarray.count-:%ld",self.manberarray.count);
    
    for (int j = 0; j < [self.manberarray count]; j ++) {
        mycustomerdata *mydata = [self.manberarray objectAtIndex:j];
        
        NSInteger xn = j % 4;
        NSInteger yn = j / 4;
        
        int x = (20 + width) * xn + 20;
        int y = (20 + heiht) * yn + 17;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        button.backgroundColor = [UIColor redColor];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HTTPREQUESTPDOMAIN,mydata.picsrc]]  forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"图片4"]];
        [button addTarget:self action:@selector(cancelbuttonclickl:) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = NO;
        button.tag = 10 + j;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 30;
        [_manberview addSubview:button];
        
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(x + width/2 - ([self NSStringwithsize:12 str:[self.customersnikenames objectAtIndex:j]]/2), y + heiht, [self NSStringwithsize:12 str:[self.customersnikenames objectAtIndex:j]], 20)];
        lable.tag = 20 + j;
        lable.font = [UIFont systemFontOfSize:12];
        lable.text = [self.customersnikenames objectAtIndex:j];
        [_manberview addSubview:lable];
    }
    
    NSInteger a1 = [self.manberarray count];
    NSInteger xn1 = a1 % 4;
    NSInteger yn1 = a1 / 4;
    
    int x1 = (20 + width) * xn1 + 20;
    int y1 = (20 + heiht) * yn1 + 17;
    
    _addbtn.frame = CGRectMake(x1, y1, width , heiht);
    
    NSInteger a2 = [self.manberarray count] + 1;
    NSInteger xn2 = a2 % 4;
    NSInteger yn2 = a2 / 4;
    
    int x2 = (20 + width) * xn2 + 20;
    int y2 = (20 + heiht) * yn2 + 17;
    
    _subtraction.frame = CGRectMake(x2, y2, width , heiht);
    
}

-(void)cancelbtnclick
{
    
    
    float width = 60;
    float heiht = width;
    
    if (self.iscancel == NO) {
        
        for (int j = 0; j < [self.manberarray count]; j ++) {
            
            NSInteger xn = j % 4;
            NSInteger yn = j / 4;
            
            int x = (20 + width) * xn + 20;
            int y = (20 + heiht) * yn + 17;
            
            UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(x - 5, y - 5, 20, 20)];
            imagev.image = [UIImage imageNamed:@"hongdianshanchu"];
            imagev.tag = 100 + j;
            [_manberview addSubview:imagev];
            
            UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + j];
            btn.userInteractionEnabled = YES;
            
            self.iscancel = YES;
        }
        
    }else{
        
        for (int j = 0; j < [self.manberarray count]; j ++) {
            
            UIImageView *imagev = (UIImageView *)[_manberview viewWithTag:100 + j];
            [imagev removeFromSuperview];
            
            UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + j];
            btn.userInteractionEnabled = NO;
            
            self.iscancel = NO;
        }
    }
    
    
}

-(void)cancelbuttonclickl:(UIButton *)btn
{
    NSLog(@"12345");
    
    [self.manberarray removeObjectAtIndex:btn.tag - 10];
    [self.getmanberarrayIDs removeObjectAtIndex:btn.tag - 10];
    [btn removeFromSuperview];
    
    NSLog(@"--self.manberarray.count:%ld",self.manberarray.count);
    
    [self addmanbers];
    
    for (int j = 0; j < [self.manberarray count] + 1; j ++) {
        
        UIImageView *imagev = (UIImageView *)[_manberview viewWithTag:100 + j];
        [imagev removeFromSuperview];
        
        UIButton *btn = (UIButton *)[_manberview viewWithTag:10 + j];
        btn.userInteractionEnabled = NO;
        
        self.iscancel = NO;
    }
    
    [self cancelbtnclick];
    
}
-(void)savebtnclickqq
{
    
     self.groupname = _grouptitle.text;
    
    self.customersIDs = @"";
    for (mycustomerdata *data in self.manberarray) {
        if ([self.customersIDs isEqualToString:@""]) {
            self.customersIDs = [NSString stringWithFormat:@"%@",data.sno];
        }else{
            self.customersIDs = [NSString stringWithFormat:@"%@,%@",self.customersIDs,data.sno];
        }
        
    }

    
    NSString *string = [NSString stringWithFormat:@"%@//doctor.savegroup.go?groupid=%@&groupname=%@&doctorsno=%@&customers=%@",HTTPREQUESTPDOMAIN,self.groupid,self.groupname,self.doctorsno,self.customersIDs];
    
    NSLog(@"string-:%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postsavegroupplist:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        NSLog(@"完成请求---%@",string);
        if ([string isEqualToString:@"请输入组名称"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }else{
        [self.navigationController popViewControllerAnimated:YES];
        }
        
    }];

    
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.iscancel = YES;
    [self cancelbtnclick];
    NSLog(@"---self.getmanberarrayIDs----%@------",self.getmanberarrayIDs);
    
    myclientMenberGroupArrayViewController *addmanber = [[myclientMenberGroupArrayViewController alloc] init];
    addmanber.doctorsno = self.doctorsno;
    addmanber.groupname = _grouptitle.text;
    addmanber.groupid = self.groupid;
    addmanber.OriginalManberary = self.getmanberarrayIDs;
    addmanber.newmanberary = self;
    NSLog(@"self.doctorsno,_grouptitle.text,self.groupid-%@-%@-%@",self.doctorsno,_grouptitle.text,self.groupid);
    [self.navigationController pushViewController:addmanber animated:YES];
}

-(void)comebacksaaa
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
