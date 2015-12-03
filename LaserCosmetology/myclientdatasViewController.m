//
//  myclientdatasViewController.m
//  聚美医
//
//  Created by fenghuang on 15/8/28.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientdatasViewController.h"
#import "myclientdatasViewCell.h"
#import "TopBarView.h"
#import "PrefixHeader.pch"

#import "myclientmenbergroupViewController.h"
#import "myclientobservedisease.h"
#import "myclientsetgropViewController.h"
#import "myclientTheConditionRecordViewController.h"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "mycustomerdata.h"
#import "UIImageView+WebCache.h"
#import "GuestbookChatVC.h"

@interface myclientdatasViewController ()

@end

@implementation myclientdatasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"客户资料";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaas) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    _myclienttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    _myclienttableview.dataSource = self;
    _myclienttableview.delegate = self;
    _myclienttableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_myclienttableview];
    
    _imageofhead = [[NSMutableArray alloc] initWithObjects:@"sucaiwu",@"sucailiu",@"sucaiyi", nil];
    _titleary = [[NSMutableArray alloc] initWithObjects:@"消息",@"电话",@"分组", nil];
    
    _data = [[NSMutableArray alloc] initWithCapacity:0];
    self.beautitylistdataary = [[NSMutableArray alloc] initWithCapacity:0];

    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self startrequest];
}

-(void)startrequest
{
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getcustomer.go?customersno=%@&doctorsno=%@",HTTPREQUESTPDOMAIN,self.customerSno,self.doctorsno];
    
    NSLog(@"获取客户资料---%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postsGetcustomerdata:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
       
        _data = array1;
        NSLog(@"获取客户资料---%@",_data);
        self.beautitylistdataary = array2;
        for (mycustomerdata *mydata in self.beautitylistdataary) {
            NSLog(@"mydata.beautitydetailsno = %@",mydata.beautitydetailsno);
        }
        
        [_myclienttableview reloadData];
        
    }];
    
    
    NSString *string2 = [NSString stringWithFormat:@"%@/doctor.isfollowed.go?customersno=%@&doctorsno=%@",HTTPREQUESTPDOMAIN,self.customerSno,self.doctorsno];
    NSLog(@"获取关注信息----》%@",string2);
    [AFHTTPRequestOpeartionManagerOfme postsattentionTOMe:string2 withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        self.payattention = string;
        [_myclienttableview reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)comebacksaaas
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }else{
        
        return self.beautitylistdataary.count + 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientdatasViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[myclientdatasViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    mycustomerdata *data;
    if (_data.count > 0) {
        data = [_data objectAtIndex:0];
    }
   
    
    self.customerphone = data.logincellphone;
    

    
    if (indexPath.section == 0) {
        
        cell.headimage.frame = CGRectMake(30, 25, 50, 50);
        [cell.headimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,data.picsrc]] placeholderImage:[UIImage imageNamed:@"图片4"]];
        cell.headimage.layer.masksToBounds = YES;
        cell.headimage.layer.cornerRadius = 25;
        
        cell.name.frame = CGRectMake(100, 25,[self NSStringwithsize:16 str:data.truename] , 20);
        cell.name.text = data.truename;
        cell.name.font = [UIFont systemFontOfSize:16];
        cell.name.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        if (data.sextype == 0) {
            cell.sex.frame = CGRectMake(100 + [self NSStringwithsize:16 str:data.truename] + 10, 26, 15, 15);
            cell.sex.image = [UIImage imageNamed:@"sucaisi"];
        }else{
            cell.sex.frame = CGRectMake(100 + [self NSStringwithsize:16 str:data.truename] + 10, 26, 15, 15);
            cell.sex.image = [UIImage imageNamed:@"sucaisiganger"];
        }

        
        cell.age.font = [UIFont systemFontOfSize:14];
        cell.age.textColor = [self colorWithRGB:0x868686 alpha:1];
        cell.age.text = [NSString stringWithFormat:@"%@",data.agecount];
        cell.age.frame = CGRectMake(100, 55, [self NSStringwithsize:14 str:cell.age.text], 20);

        
        cell.suxian.frame = CGRectMake(cell.age.frame.origin.x + cell.age.frame.size.width + 5, 55, 3, 20);
        cell.suxian.image = [UIImage imageNamed:@"zhuyefenge"];
        
        cell.city.frame = CGRectMake(cell.age.frame.origin.x + cell.age.frame.size.width + 20, 55, [self NSStringwithsize:14 str:[NSString stringWithFormat:@"城市:%@",data.address]], 20);
        cell.city.font = [UIFont systemFontOfSize:14];
        cell.city.textColor = [self colorWithRGB:0x868686 alpha:1];
        cell.city.text =[NSString stringWithFormat:@"城市:%@",data.address] ;
        
       
        
        cell.payattention.frame = CGRectMake(self.view.bounds.size.width - 68, 25, 50, 20);
        [cell.payattention setBackgroundImage:[UIImage imageNamed:@"guanzhudi"] forState:UIControlStateNormal];
        [cell.payattention setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
        cell.payattention.titleLabel.font = [UIFont systemFontOfSize:11];
        [cell.payattention setTitle:self.payattention forState:UIControlStateNormal];
        
    }else if (indexPath.section == 1){
        
        cell.titleimage.frame = CGRectMake(18, 12, 25, 25);
        cell.titleimage.image = [UIImage imageNamed:[_imageofhead objectAtIndex:indexPath.row]];
        
        cell.titles.frame = CGRectMake(50, 14, 40, 20);
        cell.titles.text = [_titleary objectAtIndex:indexPath.row];
        cell.titles.font = [UIFont systemFontOfSize:14];
        cell.titles.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        if (indexPath.row == 0) {

        }else if (indexPath.row == 1){
            cell.contents.frame = CGRectMake(self.view.bounds.size.width - 35 - [self NSStringwithsize:14 str:data.logincellphone], 14, [self NSStringwithsize:14 str:data.logincellphone], 20);
            cell.contents.text = data.logincellphone;
            cell.contents.font = [UIFont systemFontOfSize:14];
            cell.contents.textColor = [self colorWithRGB:0x666666 alpha:1];
        }else{
            cell.contents.frame = CGRectMake(self.view.bounds.size.width - 35 - [self NSStringwithsize:14 str:data.groupname], 14, [self NSStringwithsize:14 str:data.groupname], 20);
            cell.contents.text = data.groupname;
            cell.contents.font = [UIFont systemFontOfSize:14];
            cell.contents.textColor = [self colorWithRGB:0x666666 alpha:1];
        }

        
        cell.right.frame = CGRectMake(self.view.bounds.size.width - 25, 14, 10, 20);
        cell.right.image = [UIImage imageNamed:@"素材12"];
        
    
    }else{
        
        if (indexPath.row == 0) {
         
            cell.riliimage.frame = CGRectMake(18, 10, 25, 25);
            cell.riliimage.image = [UIImage imageNamed:@"sucaiqi"];
            
            cell.jilutext.frame = CGRectMake(50, 12, 60, 20);
            cell.jilutext.text = @"就诊记录";
            cell.jilutext.font = [UIFont systemFontOfSize:14];
            cell.jilutext.textColor = [self colorWithRGB:0x666666 alpha:1];
            
        }else{
            
            NSDictionary *prodctoer = [data.beautitylist objectAtIndex:indexPath.row - 1];

            cell.date.frame = CGRectMake(19, 15, 140, 20);
            cell.date.font = [UIFont systemFontOfSize:12];
            cell.date.textColor = [self colorWithRGB:0x999999 alpha:1];
            NSString *creatdt = [prodctoer objectForKey:@"createdt"];
            if (creatdt.length > 5) {
            
                NSArray *are = [[NSString stringWithFormat:@"%@",creatdt] componentsSeparatedByString:@" "];
                cell.date.text = [are objectAtIndex:0];
                
            }
            
            cell.projectname.frame = CGRectMake(100, 15, 120, 20);
            cell.projectname.text = [prodctoer objectForKey:@"productname"];
            cell.projectname.font = [UIFont systemFontOfSize:14];
            cell.projectname.textColor = [self colorWithRGB:0x00c5bb alpha:1];
            
            cell.inspect.frame = CGRectMake(self.view.bounds.size.width - 78, 13, 60, 23);
            [cell.inspect setTitle:@"查看病历" forState:UIControlStateNormal];
            [cell.inspect setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
            [cell.inspect setBackgroundImage:[UIImage imageNamed:@"guanzhudi"] forState:UIControlStateNormal];
            cell.inspect.userInteractionEnabled = NO;
            cell.inspect.titleLabel.font = [UIFont systemFontOfSize:14];
        }

    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 19;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 50;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 2) {
                myclientsetgropViewController *myclient = [[myclientsetgropViewController alloc] init];
            myclient.doctorsno = self.doctorsno;
            myclient.customersno = self.customerSno;
                [self.navigationController pushViewController:myclient animated:YES];
        }else if (indexPath.row == 1){
            
            [self callphone];
        }else{
        
            GuestbookChatVC *chat = [[GuestbookChatVC alloc] init];
            chat.doctorsno = self.doctorsno;
            chat.customerSno = self.customerSno;
            [self.navigationController pushViewController:chat animated:YES];
        }
        
    }else if (indexPath.section == 2){

        
        if (indexPath.row != 0) {
            mycustomerdata *mydata = [self.beautitylistdataary objectAtIndex:indexPath.row - 1];
            
            myclientobservedisease *myclient = [[myclientobservedisease alloc] init];
            myclient.beautifydetailsno = mydata.beautitydetailsno;
            myclient.customerSno = self.customerSno;
            myclient.doctorsno = self.doctorsno;
            [self.navigationController pushViewController:myclient animated:YES];
            NSLog(@"myclient.beautifydetailsno=%@",myclient.beautifydetailsno);
        }

    }
//
//    myclientTheConditionRecordViewController *myclient = [[myclientTheConditionRecordViewController alloc] init];
//    [self.navigationController pushViewController:myclient animated:YES];
   
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

-(void)callphone
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",self.customerphone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
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


@end
