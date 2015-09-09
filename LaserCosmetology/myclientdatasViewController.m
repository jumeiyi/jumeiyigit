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
    titilelable.text = @"客户姓名";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaas) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UITableView *myclienttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    myclienttableview.dataSource = self;
    myclienttableview.delegate = self;
    myclienttableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:myclienttableview];
    
    _imageofhead = [[NSMutableArray alloc] initWithObjects:@"sucaiwu",@"sucailiu",@"sucaiyi", nil];
    _titleary = [[NSMutableArray alloc] initWithObjects:@"消息",@"电话",@"分组", nil];
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    self.doctorSno =  [userdf objectForKey:@"customerSno"];
    
    _data = [[NSMutableData alloc] init];

    [self startrequest];
    
}

-(void)startrequest
{
        NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=serviced&toPage=1&Count_per_Page=15",HTTPREQUESTPDOMAIN,self.doctorSno];
    
    [self requstwithurl:string];
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
        return 5;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientdatasViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[myclientdatasViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.section == 0) {
        
        cell.headimage.frame = CGRectMake(30, 25, 50, 50);
        cell.headimage.image = [UIImage imageNamed:@"图片4"];
        
        cell.name.frame = CGRectMake(100, 25, 50, 20);
        cell.name.text = @"蒙蒙";
        cell.name.font = [UIFont systemFontOfSize:16];
        cell.name.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        cell.sex.frame = CGRectMake(150, 26, 15, 15);
        cell.sex.image = [UIImage imageNamed:@"sucaisiganger"];
        
        cell.age.frame = CGRectMake(100, 55, 50, 20);
        cell.age.font = [UIFont systemFontOfSize:14];
        cell.age.textColor = [self colorWithRGB:0x868686 alpha:1];
        cell.age.text = @"年龄:25";
        
        cell.suxian.frame = CGRectMake(cell.age.frame.origin.x + cell.age.frame.size.width + 5, 55, 3, 20);
        cell.suxian.image = [UIImage imageNamed:@"zhuyefenge"];
        
        cell.city.frame = CGRectMake(cell.age.frame.origin.x + cell.age.frame.size.width + 20, 55, 70, 20);
        cell.city.font = [UIFont systemFontOfSize:14];
        cell.city.textColor = [self colorWithRGB:0x868686 alpha:1];
        cell.city.text = @"城市:武汉";
        
        cell.payattention.frame = CGRectMake(self.view.bounds.size.width - 60, 25, 50, 20);
        [cell.payattention setBackgroundImage:[UIImage imageNamed:@"guanzhudi"] forState:UIControlStateNormal];
        [cell.payattention setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
        cell.payattention.titleLabel.font = [UIFont systemFontOfSize:11];
        [cell.payattention setTitle:@"已关注我" forState:UIControlStateNormal];
        
    }else if (indexPath.section == 1){
        
        cell.titleimage.frame = CGRectMake(15, 10, 25, 25);
        cell.titleimage.image = [UIImage imageNamed:[_imageofhead objectAtIndex:indexPath.row]];
        
        cell.titles.frame = CGRectMake(50, 12, 40, 20);
        cell.titles.text = [_titleary objectAtIndex:indexPath.row];
        cell.titles.font = [UIFont systemFontOfSize:14];
        cell.titles.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        cell.contents.frame = CGRectMake(self.view.bounds.size.width - 100, 12, 70, 20);
        cell.contents.text = @"123456";
        cell.contents.font = [UIFont systemFontOfSize:14];
        cell.contents.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        cell.right.frame = CGRectMake(self.view.bounds.size.width - 20, 12, 10, 20);
        cell.right.image = [UIImage imageNamed:@"素材12"];
        
    
    }else{
        
        if (indexPath.row == 0) {
         
            cell.riliimage.frame = CGRectMake(15, 10, 25, 25);
            cell.riliimage.image = [UIImage imageNamed:@"sucaiqi"];
            
            cell.jilutext.frame = CGRectMake(50, 12, 60, 20);
            cell.jilutext.text = @"就诊记录";
            cell.jilutext.font = [UIFont systemFontOfSize:14];
            cell.jilutext.textColor = [self colorWithRGB:0x666666 alpha:1];
            
        }else{
            cell.date.frame = CGRectMake(15, 12, 140, 20);
            cell.date.text = @"2015-09-01 16:40 ";
            cell.date.font = [UIFont systemFontOfSize:12];
            cell.date.textColor = [self colorWithRGB:0x999999 alpha:1];

            
            cell.projectname.frame = CGRectMake(140, 12, 120, 20);
            cell.projectname.text = @"项目AB";
            cell.projectname.font = [UIFont systemFontOfSize:14];
            cell.projectname.textColor = [self colorWithRGB:0x00c5bb alpha:1];
            
            cell.inspect.frame = CGRectMake(self.view.bounds.size.width - 80, 10, 60, 23);
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
                [self.navigationController pushViewController:myclient animated:YES];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row != 0) {
            myclientobservedisease *myclient = [[myclientobservedisease alloc] init];
            [self.navigationController pushViewController:myclient animated:YES];
        }

    }
    
    

    
//
//    myclientTheConditionRecordViewController *myclient = [[myclientTheConditionRecordViewController alloc] init];
//    [self.navigationController pushViewController:myclient animated:YES];
   
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
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
    
     NSLog(@"000000------------%@",dic);
    
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

@end
