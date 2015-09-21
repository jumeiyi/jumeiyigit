//
//  myclientsetgropViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/2.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientsetgropViewController.h"
#import "myclientsetgropCell.h"
#import "TopBarView.h"
#import "mycustomerdata.h"
#import "PrefixHeader.pch"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "newcreatgroupViewController.h"
@interface myclientsetgropViewController ()

@end

@implementation myclientsetgropViewController

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
    [save setTitle:@"保存" forState:UIControlStateNormal];
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
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    self.doctorsno =  [userdf objectForKey:@"customerSno"];//这个实际上医生的索引
    
    NSMutableArray *Yary  = [[NSMutableArray alloc] initWithCapacity:0];
    for (int a = 0; a < _groupname.count; a++) {
        [Yary addObject:@"y"];
    }
    
   
}

-(void)viewWillAppear:(BOOL)animated
{
    _shooseindexs = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getgrouplist.go?doctorsno=%@",HTTPREQUESTPDOMAIN,self.doctorsno];
    
    [AFHTTPRequestOpeartionManagerOfme postSetgroups:string withBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSMutableArray *array3) {
        
        _groupname = array1;
        _groupman = array2;
        [self.mytableview reloadData];
        NSLog(@"array1:%@----array2:%@",array1,array2);
        
        for (int i = 0; i < _groupname.count; i++) {
            [_shooseindexs addObject:@"y"];
        }
        
    }];
    
}

-(void)setgroupwithary:(NSMutableArray *)ary
{
    //    _groupname = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
    //    NSString *stra;
    //    for (NSDictionary *mycusdiction in dataary) {
    //        mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
    //        if (![stra isEqualToString:mycustom.firstsearchword]) {
    //            [_groupname addObject:mycustom.firstsearchword];
    //        }
    //        stra = mycustom.firstsearchword;
    //        [_mycustomerDataarray addObject:mycustom];
    //    }
    //
    //
    //
    //    _groupname = [[NSMutableArray alloc] initWithCapacity:0];//指定区的数据
    //    for (NSString *str in _headnamearray) {
    //        NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
    //        for (mycustomerdata *mydata in _mycustomerDataarray) {
    //            if ([mydata.firstsearchword isEqualToString:str]) {
    //                [indexary addObject:mydata];
    //            }
    //        }
    //        [_allgroup addObject:indexary];
    //    }
    
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
    myclientsetgropCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[myclientsetgropCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *str1 = [_groupname objectAtIndex:indexPath.row];
    NSArray *str2 = [_groupman objectAtIndex:indexPath.row];
    NSString *str3 = [NSString stringWithFormat:@"%@      (%ld)",str1,str2.count];
    
    cell.grouplable.frame = CGRectMake(15, 15, self.view.bounds.size.width - 35, 20);
    cell.grouplable.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    cell.grouplable.font = [UIFont systemFontOfSize:15];
    cell.grouplable.text = str3;
    
    NSString *object = [_shooseindexs objectAtIndex:indexPath.row];
    if ([object isEqualToString:@"y"]) {
        cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 35, 15, 20, 20);
        cell.shooseimage.image = [UIImage imageNamed:@"sucaibaganger"];
    
    }else{
        
        cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 35, 15, 20, 20);
        cell.shooseimage.image = [UIImage imageNamed:@"sucaiba"];

    }

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *object = [_shooseindexs objectAtIndex:indexPath.row];
    if ([object isEqualToString:@"y"]) {
        [_shooseindexs replaceObjectAtIndex:indexPath.row withObject:@"x"];
    }else{
    [_shooseindexs replaceObjectAtIndex:indexPath.row withObject:@"y"];
    }
    
    [self.mytableview reloadData];
    
}

-(void)creatnewagroupww{

    NSLog(@"保存URL");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}


@end
