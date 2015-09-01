//
//  myclientobservedisease.m
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientobservedisease.h"
#import "TopBarView.h"
#import "myclientobservediseaseCell.h"
#import "UIImageView+WebCache.h"
#import "myclientdiseaseediting.h"
@interface myclientobservedisease ()

@end

@implementation myclientobservedisease

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"病历记录";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaaz) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [topbar addSubview:save];
    
    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 63)];
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    [self.view addSubview:self.mytableview];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingbtnnot:) name:@"diseaseeditingbtnclick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancellnot:) name:@"diseasequpingjia" object:nil];
}
-(void)editingbtnnot:(NSNotification *)noti
{
    NSLog(@"编辑  %@",[noti object]);
    
    myclientdiseaseediting *edting = [[myclientdiseaseediting alloc] init];
    [self.navigationController pushViewController:edting animated:YES];
    
}
-(void)cancellnot:(NSNotification *)noti
{
    NSLog(@"删除 %@",[noti object]);
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientobservediseaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[myclientobservediseaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.date.frame = CGRectMake(15, 19, 150, 20);
    cell.date.font = [UIFont systemFontOfSize:15];
    cell.date.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    cell.date.text = @"2015-09-01";
    
    
    cell.editingbtn.frame = CGRectMake(self.view.bounds.size.width - 120, 19, 44, 22);
    [cell.editingbtn setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
    cell.editingbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cell.editingbtn setBackgroundImage:[UIImage imageNamed:@"guanzhudi"] forState:UIControlStateNormal];
    [cell.editingbtn setTitle:@"编辑" forState:UIControlStateNormal];
    
    
    cell.cancell.frame = CGRectMake(self.view.bounds.size.width - 60, 19, 44, 22);
    [cell.cancell setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
    cell.cancell.titleLabel.font = [UIFont systemFontOfSize:15];
    [cell.cancell setBackgroundImage:[UIImage imageNamed:@"guanzhudi"] forState:UIControlStateNormal];
     [cell.cancell setTitle:@"删除" forState:UIControlStateNormal];
    
    cell.contents.frame = CGRectMake(15, 50, self.view.bounds.size.width - 30, [self contentsWithnsstring:@"cell.contents.frame = CGRectMake(15, 50, self.view.bounds.size.width - 30, 40)"]);
    cell.contents.numberOfLines = 0;
    cell.contents.font = [UIFont systemFontOfSize:15];
    cell.contents.textColor = [self colorWithRGB:0x999999 alpha:1];
    cell.contents.text = @"cell.contents.frame = CGRectMake(15, 50, self.view.bounds.size.width - 30, 40)";
    
    
    cell.image1.frame = CGRectMake(15, 90, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
    [cell.image1 sd_setImageWithURL:[NSURL URLWithString:@"http://car0.autoimg.cn/car/upload/2015/4/16/u_2015041609233799826411.jpg"]];
    
    cell.image2.frame = CGRectMake(15 + (self.view.bounds.size.width - 40)/3 + 5, 90, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
    [cell.image2 sd_setImageWithURL:[NSURL URLWithString:@"http://car0.autoimg.cn/car/upload/2015/4/16/u_2015041609233799826411.jpg"]];

    cell.image3.frame = CGRectMake(15 + ((self.view.bounds.size.width - 40)/3 * 2) + 10, 90, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
    [cell.image3 sd_setImageWithURL:[NSURL URLWithString:@"http://car0.autoimg.cn/car/upload/2015/4/16/u_2015041609233799826411.jpg"]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)comebacksaaaz
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

//计算字体长度
-(float)NSStringwithsize:(int)a str:(NSString *)string
{
    
    UIFont *font = [UIFont systemFontOfSize:a];
    
    CGSize size = [string sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    // 名字的H
    //CGFloat nameH = size.height;
    // 名字的W
    CGFloat strwidth = size.width;
    
    return strwidth;
}

//计算文字内容在规定宽度时候它的显示高度
-(CGFloat)contentsWithnsstring:(NSString *)str
{
    UIFont *font = [UIFont systemFontOfSize:17];
    CGSize size = CGSizeMake(self.view.bounds.size.width - 10,6000);
    CGRect labelRect = [str boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    CGFloat gaodu = labelRect.size.height;
    return gaodu;
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
