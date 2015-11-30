//
//  PointViewController.m
//  聚美医
//
//  Created by fenghuang on 15/11/13.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "PointViewController.h"
#import "PointTableViewCell.h"
#import "TopBarView.h"
#import "mypointsmodle.h"
#import "wodejifen.h"
#import "PrefixHeader.pch"
@interface PointViewController ()

@end

@implementation PointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    background.image = [UIImage imageNamed:@"huidi"];
    background.userInteractionEnabled = YES;
    [self.view addSubview:background];
    
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"我的积分";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacka) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    [self.view addSubview:self.mytableview];
    
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.mypoints.go?doctorsno=%@&toPage=1&Count_per_Page=10",HTTPREQUESTPDOMAIN,self.doctorsno];
    NSLog(@"URL------%@-----",string);
    
    [wodejifen getTheDataWithULR:string AndBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        self.mypointsary = array1;
        self.points = string;
        
        [self.mytableview reloadData];
    }];
    
    
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
-(void)comebacka
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mypointsary.count + 2;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    PointTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PointTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    mypointsmodle *mypoint;
    if (indexPath.row >= 2) {
        mypoint = [self.mypointsary objectAtIndex:indexPath.row - 2];
    }
    
    
    cell.bgimage.frame = CGRectMake(0, 0, 0,0);
    cell.bgimage.image = [UIImage imageNamed:@""];
    cell.whiteview.frame = CGRectMake(0, 0, 0,0);
    cell.whiteview.backgroundColor = [UIColor clearColor];
    cell.jifen.frame = CGRectMake(0, 0, 0, 0);
    cell.jifen.text = @"";
    cell.jifennumber.frame = CGRectMake(0, 0, 0,0);
    cell.jifennumber.text = @"";
    cell.jifenmingxi.frame = CGRectMake(0, 0, 0, 0);
    cell.jifenmingxi.text =  @"";
    cell.celltitle.frame = CGRectMake(0, 0,0,0);
    cell.celltitle.text = @"";
    cell.celltime.frame = CGRectMake(0, 0,0,0);
    cell.celltime.text = @"";
    cell.cellnumber.frame = CGRectMake(0,0,0,0);
    cell.cellnumber.text = @"";
    

    if (indexPath.row == 0) {
        cell.bgimage.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
        cell.bgimage.image = [UIImage imageNamed:@"my_point.jpg"];
        
        cell.whiteview.frame = CGRectMake(self.view.bounds.size.width/2 - 60, 40, 120, 120);
        cell.whiteview.image = [UIImage imageNamed:@"whiteview"];
        cell.whiteview.layer.masksToBounds = YES;
        cell.whiteview.layer.cornerRadius = 60;
        
        cell.jifen.frame = CGRectMake(self.view.bounds.size.width/2 - 18, 70, 40, 20);
        cell.jifen.text = @"积分";
        cell.jifen.font = [UIFont systemFontOfSize:18];
        cell.jifen.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        cell.jifennumber.text = self.points;
        cell.jifennumber.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:28 str:cell.jifennumber.text]/2), 100, [self NSStringwithsize:28 str:cell.jifennumber.text], 20);
        cell.jifennumber.font = [UIFont systemFontOfSize:28];
        cell.jifennumber.textColor = [self colorWithRGB:0x22A49D alpha:1];
        
        
    }else if(indexPath.row == 1){
    
        cell.jifenmingxi.frame = CGRectMake(15, 20, self.view.bounds.size.width - 30, 20);
        cell.jifenmingxi.text =  @"积分明细";
        cell.jifenmingxi.font = [UIFont systemFontOfSize:20];
        cell.jifenmingxi.textColor = [self colorWithRGB:0x22A49D alpha:1];
    }else{
        cell.celltitle.frame = CGRectMake(15, 8, self.view.bounds.size.width - 30, 20);
        cell.celltitle.text = mypoint.reason;
        cell.celltitle.font = [UIFont systemFontOfSize:14];
        cell.celltitle.textColor = [self colorWithRGB:0x333333 alpha:1];
        
        cell.celltime.frame = CGRectMake(15, 30, self.view.bounds.size.width - 30, 20);
        cell.celltime.text = mypoint.createdt;
        cell.celltime.font = [UIFont systemFontOfSize:14];
        cell.celltime.textColor = [self colorWithRGB:0x999999 alpha:1];
        
        cell.cellnumber.text = [NSString stringWithFormat:@"+  %@",mypoint.points];
        cell.cellnumber.frame = CGRectMake(self.view.bounds.size.width - [self NSStringwithsize:16 str:cell.cellnumber.text] - 15, 20, [self NSStringwithsize:16 str:cell.cellnumber.text], 20);
        cell.cellnumber.font = [UIFont systemFontOfSize:16];
        cell.cellnumber.textColor = [self colorWithRGB:0x77D5BA alpha:1];
        
        }
    
    
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }else if(indexPath.row == 1){
        return 65;
    }else{
        return 55;
    }
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

@end
