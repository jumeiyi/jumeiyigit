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
#import "myclientmenbergroupViewController.h"
#import "mycustomerdata.h"
#import "PrefixHeader.pch"
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
    [backbtn addTarget:self action:@selector(comebacksaaazzz) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"新建" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(creatnewagroup) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];

    
    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    [self.view addSubview:self.mytableview];
    
    _titleary = [[NSMutableArray alloc] initWithObjects:@"今年组 （40） ",@"美女第一组 （30） ",@"帅哥二组 （10）",@"帅哥又美女组 （100）", nil];
    
    NSMutableArray *Yary  = [[NSMutableArray alloc] initWithCapacity:0];
    for (int a = 0; a < _titleary.count; a++) {
        [Yary addObject:@"y"];
    }
    
    _data = [[NSMutableData alloc] init];
    _mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self startrequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)comebacksaaazzz
{
    [self.navigationController popViewControllerAnimated:YES];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleary.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientsetgropCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[myclientsetgropCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.grouplable.frame = CGRectMake(15, 15, self.view.bounds.size.width - 35, 20);
    cell.grouplable.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    cell.grouplable.font = [UIFont systemFontOfSize:15];
    cell.grouplable.text = [_titleary objectAtIndex:indexPath.row];
    
    cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 35, 15, 20, 20);
    cell.shooseimage.image = [UIImage imageNamed:@"sucaiba"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)creatnewagroup{

    
        myclientmenbergroupViewController *myclient = [[myclientmenbergroupViewController alloc] init];
        [self.navigationController pushViewController:myclient animated:YES];
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
    
    NSLog(@"000000------------%@",dic);
    
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