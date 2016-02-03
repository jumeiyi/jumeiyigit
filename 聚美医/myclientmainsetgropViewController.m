//
//  myclientmainsetgropViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/8.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientmainsetgropViewController.h"
#import "TopBarView.h"
#import "myclientgroupTableViewCell.h"
#import "myclientmenbergroupViewController.h"
#import "mycustomerdata.h"
#import "PrefixHeader.pch"
#import "newcreatgroupViewController.h"

@interface myclientmainsetgropViewController ()

@end

@implementation myclientmainsetgropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"设置分组";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaazzza) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"新建" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(creatnewagroupww) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];
    
    
    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    [self.view addSubview:self.mytableview];
    
    _groupname = [[NSMutableArray alloc] initWithCapacity:0];
    _groupman = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableArray *Yary  = [[NSMutableArray alloc] initWithCapacity:0];
    for (int a = 0; a < _groupname.count; a++) {
        [Yary addObject:@"y"];
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated
{

    NSString *string = [NSString stringWithFormat:@"%@/doctor.getgrouplist.go?doctorsno=%@",HTTPREQUESTPDOMAIN,self.doctorsno];
//        NSString *string = [NSString stringWithFormat:@"%@/doctor.getDoctorGroup.go?doctorsno=%@",HTTPREQUESTPDOMAIN,self.doctorsno];
    
    [AFHTTPRequestOpeartionManagerOfme postSetgroups:string withBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSMutableArray *array3) {
        
        _groupname = array1;
        _groupman = array2;
        [self.mytableview reloadData];
        
    }];
    
//    [AFHTTPRequestOpeartionManagerOfme getDoctorGroupWithUrl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
//        
//        
//    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)comebacksaaazzza{
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

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groupname.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientgroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[myclientgroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    mycustomerdata *mydata = [_groupman objectAtIndex:indexPath.row];
    NSString *str3 = [NSString stringWithFormat:@"%@      (%@)",mydata.groupname,mydata.groupnum];
    
    cell.grouplable.frame = CGRectMake(19, 15, self.view.bounds.size.width - 35, 20);
    cell.grouplable.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    cell.grouplable.font = [UIFont systemFontOfSize:15];
    cell.grouplable.text = str3;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    mycustomerdata *mydata = [_groupman objectAtIndex:indexPath.row];
    
    myclientmenbergroupViewController *myclient = [[myclientmenbergroupViewController alloc] init];
    myclient.groupstr = mydata.groupname;
    myclient.groupid = mydata.groupid;
    myclient.doctorsno = self.doctorsno;
    NSLog(@"mydata.groupname,mydata.groupid,self.doctorsno1{%@%@%@",mydata.groupname,mydata.groupid,self.doctorsno);
    [self.navigationController pushViewController:myclient animated:YES];
}

-(void)creatnewagroupww{
    newcreatgroupViewController *myclient = [[newcreatgroupViewController alloc] init];
    myclient.doctorsno = self.doctorsno;
    [self.navigationController pushViewController:myclient animated:YES];
}



@end
