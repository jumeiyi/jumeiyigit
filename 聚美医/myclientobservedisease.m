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
#import "PrefixHeader.pch"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "medicalrecord.h"
#import "myclientNewCreatDiseaseViewController.h"

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
    [save setTitle:@"新建" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(createnewThedisease) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];
    
    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 63)];
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    [self.view addSubview:self.mytableview];
    
    _refreshControl=[[RefreshControl alloc] initWithScrollView:self.mytableview delegate:self];
    _refreshControl.topEnabled=YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingbtnnot:) name:@"diseaseeditingbtnclick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancellnot:) name:@"diseasequpingjia" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pusimage:) name:@"pusimage" object:nil];
    
    _medicalrecorddata = [[NSMutableArray alloc] initWithCapacity:0];
    self.contentshightary = [[NSMutableArray alloc] initWithCapacity:0];
    
   
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"[super viewWillAppear:animated]");
     [self Getgetmedicalhistorylis];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"[super viewDidAppear:animated]--- ");
    
    [self Getgetmedicalhistorylis];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(torequest) userInfo:nil repeats:NO];
    
}
-(void)torequest{
    
    [_timer invalidate];
    _timer = nil;

    [self Getgetmedicalhistorylis];
}

-(void)Getgetmedicalhistorylis
{
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getmedicalhistorylist.go?beautitydetailsno=%@",HTTPREQUESTPDOMAIN,self.beautifydetailsno];
    
    NSLog(@"string-病历订单-URL：%@",string);
    [AFHTTPRequestOpeartionManagerOfme postsGetgetmedicalhistorylis:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
         [_medicalrecorddata removeAllObjects];
        
        _medicalrecorddata = array1;
        
        for (int i = 0; i < array1.count; i++) {
            
            medicalrecord *mymedical = [_medicalrecorddata objectAtIndex:i];
            NSString *str = [NSString stringWithFormat:@"%f",[self contentsWithnsstring:mymedical.content]];
            [self.contentshightary addObject:str];
        }
        NSLog(@"请求完毕----%ld",_medicalrecorddata.count);

      [self.mytableview reloadData];
        
    }];
    
}


-(void)editingbtnnot:(NSNotification *)noti
{
    NSLog(@"编辑  %@",[noti object]);
    NSInteger a = [[noti object] integerValue];
    medicalrecord *medi;
    if (_medicalrecorddata.count > 0) {
         medi = [_medicalrecorddata objectAtIndex:a];
    }
   
//    edting.orderDetailSno = self.beautifydetailsno;
//    edting.customersno = self.customerSno;
//    edting.doctorsno = self.doctorsno;

    
    myclientdiseaseediting *edting = [[myclientdiseaseediting alloc] init];
    edting.doctorsno = medi.doctorsno;
    edting.medicalhistorysno = medi.sno;
    [self.navigationController pushViewController:edting animated:YES];
    
    NSLog(@"self.doctorsno:%@===medi.doctorsno+%@",self.doctorsno,medi.doctorsno);
}

-(void)createnewThedisease{

    myclientNewCreatDiseaseViewController *myclient = [[myclientNewCreatDiseaseViewController alloc] init];
    myclient.orderDetailSno = self.beautifydetailsno;
    myclient.customersno = self.customerSno;
    myclient.doctorsno = self.doctorsno;
    [self.navigationController pushViewController:myclient animated:YES];
    
    NSLog(@"self.beautifydetailsno=%@==self.customerSno=%@==self.doctorsno=%@=",self.beautifydetailsno,self.customerSno,self.doctorsno);
}


- (void)refreshControl:(RefreshControl *)refreshControl didEngageRefreshDirection:(RefreshDirection)direction
{
    if (direction==RefreshDirectionTop)
    {
        NSLog(@"下拉刷新");
      [self Getgetmedicalhistorylis];
        
    }
    else if (direction==RefreshDirectionBottom)
    {
        NSLog(@"上拉刷新");
    }
    
    __weak typeof(self)weakSelf=self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf)strongSelf=weakSelf;
        [strongSelf reloadData];
    });
    
}

-(void)reloadData
{
    
    if (self.refreshControl.refreshingDirection==RefreshingDirectionTop)
    {
        [self.refreshControl finishRefreshingDirection:RefreshDirectionTop];
    }
    else if (self.refreshControl.refreshingDirection==RefreshingDirectionBottom)
    {
        [self.refreshControl finishRefreshingDirection:RefreshDirectionBottom];
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 150) {
        if (buttonIndex == 1) {
            [self deletemedicalrecords];
        }else{
        
        }
    }

}
-(void)cancellnot:(NSNotification *)noti
{
    NSLog(@"删除 %@",[noti object]);
    
    NSInteger a = arc4random() % 100;
    
    medicalrecord *mymedical = [_medicalrecorddata objectAtIndex:[[noti object] integerValue]];
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.deletemedicalhistory.go?medicalhistorysno=%@&%ld",HTTPREQUESTPDOMAIN,mymedical.sno,a];
    self.deleteurlstring = string;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否需要删除？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 150;
    [alert show];

    
}

-(void)deletemedicalrecords{

    
    [AFHTTPRequestOpeartionManagerOfme postscancellThemedicalhistory:self.deleteurlstring withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        NSLog(@"-返回--%@",string);
        
        if ([string isEqualToString:@"操作成功！"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"操作失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
        
        [self Getgetmedicalhistorylis];
    }];
}



-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     NSLog(@"表格区行数----%ld",_medicalrecorddata.count);
    return _medicalrecorddata.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    myclientobservediseaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[myclientobservediseaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSLog(@"UITableViewCell执行-indexPath.row--%ld------_medicalrecorddata.count-%ld",indexPath.row,_medicalrecorddata.count);
    medicalrecord *mymedical = [_medicalrecorddata objectAtIndex:indexPath.row];
    NSMutableArray *imageurl = [[NSMutableArray alloc] initWithCapacity:0];
   NSArray *imagestring = [mymedical.imagelist componentsSeparatedByString:@","];
    for (NSString *str in imagestring) {
        if (str.length > 10) {
            [imageurl addObject:str];
        }
    }
    NSLog(@"incell--mymedical.imagelist=%@",mymedical.imagelist);
    
    cell.btn1.frame = CGRectMake(0, 0, 0, 0);
    cell.btn1.userInteractionEnabled = NO;
    cell.btn2.frame = CGRectMake(0, 0, 0, 0);
    cell.btn2.userInteractionEnabled = NO;
    cell.btn3.frame = CGRectMake(0, 0, 0, 0);
    cell.btn3.userInteractionEnabled = NO;
    cell.date.frame = CGRectMake(0, 0, 0, 0);
    cell.date.text = @"";
    cell.editingbtn.frame = CGRectMake(0, 0, 0, 0);
    cell.cancell.frame = CGRectMake(0, 0, 0, 0);
    cell.contents.frame = CGRectMake(0, 0, 0, 0);
    cell.contents.text = @"";
    cell.image1.frame = CGRectMake(0, 0, 0, 0);
    [cell.image1 sd_setImageWithURL:[NSURL URLWithString:@""]];
    cell.image2.frame = CGRectMake(0, 0, 0, 0);
    [cell.image2 sd_setImageWithURL:[NSURL URLWithString:@""]];
    cell.image3.frame = CGRectMake(0, 0, 0, 0);
    [cell.image3 sd_setImageWithURL:[NSURL URLWithString:@""]];
    
    
    cell.date.frame = CGRectMake(15, 19, 150, 20);
    cell.date.font = [UIFont systemFontOfSize:15];
    cell.date.textColor = [self colorWithRGB:0x00c5bb alpha:1];
    cell.date.text = mymedical.createdt;
    
    
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
    
    cell.contents.frame = CGRectMake(15, 50, self.view.bounds.size.width - 30, [self contentsWithnsstring:mymedical.content]);
    cell.contents.numberOfLines = 0;
    cell.contents.font = [UIFont systemFontOfSize:15];
    cell.contents.textColor = [self colorWithRGB:0x999999 alpha:1];
    cell.contents.text = mymedical.content;
    


    
    NSString *contentshight = [self.contentshightary objectAtIndex:indexPath.row];
    float hight = [contentshight floatValue];
    
    if (imageurl.count > 0) {
        NSString *str1 = [imageurl objectAtIndex:0];
        NSString *imstring = [NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,str1];
        cell.image1.frame = CGRectMake(15, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        [cell.image1 sd_setImageWithURL:[NSURL URLWithString:imstring]];
        
        cell.btn1.frame = CGRectMake(15, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        cell.btn1.userInteractionEnabled = YES;
    }
    
    if (imageurl.count > 1){
    
        NSString *str2 = [imageurl objectAtIndex:1];
        NSString *imstring2 = [NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,str2];
        cell.image2.frame = CGRectMake(15 + (self.view.bounds.size.width - 40)/3 + 5, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        [cell.image2 sd_setImageWithURL:[NSURL URLWithString:imstring2]];

        
        cell.btn2.frame = CGRectMake(15 + (self.view.bounds.size.width - 40)/3 + 5, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        cell.btn2.userInteractionEnabled = YES;
    }
    
    if (imageurl.count > 2){
        NSString *str3 = [imageurl objectAtIndex:2];
        NSString *imstring3 = [NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,str3];
        cell.image3.frame = CGRectMake(15 + ((self.view.bounds.size.width - 40)/3 * 2) + 10, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        [cell.image3 sd_setImageWithURL:[NSURL URLWithString:imstring3]];

        
        cell.btn3.frame = CGRectMake(15 + ((self.view.bounds.size.width - 40)/3 * 2) + 10, 65 + hight, (self.view.bounds.size.width - 40)/3, (self.view.bounds.size.width - 40)/3);
        cell.btn3.userInteractionEnabled = YES;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *contentshight = [self.contentshightary objectAtIndex:indexPath.row];
    float hight = [contentshight floatValue];
    
    return 190 + hight;
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
    UIFont *font = [UIFont systemFontOfSize:15];
    CGSize size = CGSizeMake(self.view.bounds.size.width - 30,6000);
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

-(void)pusimage:(NSNotification *)notifier
{
    // NSInteger str = [[notifier object] integerValue];
    
    
    NSArray *str1 = [[notifier object] componentsSeparatedByString:@"/"];
    NSString *indexpathpistr = [str1 objectAtIndex:0];
    NSString *indexpathrow = [str1 objectAtIndex:1];
    
    
    medicalrecord *mymedical = [_medicalrecorddata objectAtIndex:[indexpathrow integerValue]];
    NSMutableArray *imageurl = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *imagestring = [mymedical.imagelist componentsSeparatedByString:@","];
    for (NSString *str in imagestring) {
        if (str.length > 10) {
            [imageurl addObject:str];
        }
    }

    
    if (_imagebackview == nil) {
        _imagebackview = [[UIView alloc] initWithFrame:self.view.bounds];
        _imagebackview.backgroundColor = [UIColor blackColor];
        _imagebackview.alpha = 0.9;
        [self.view addSubview:_imagebackview];
    }
    
    if (_imagetunningview == nil) {
        _imagetunningview = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width , self.view.bounds.size.width)];
        _imagetunningview.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_imagetunningview];
    }
    
    UIScrollView *imagescrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    imagescrollview.contentSize = CGSizeMake(imageurl.count * self.view.bounds.size.width, 0);
    imagescrollview.contentOffset = CGPointMake(self.view.bounds.size.width * ([indexpathpistr integerValue] - 120), 0);
    imagescrollview.pagingEnabled = YES;
    [_imagetunningview addSubview:imagescrollview];
    
    
    UIView *blackview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageurl.count * self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    blackview.backgroundColor = [UIColor blackColor];
    [imagescrollview addSubview:blackview];
    

    
    NSLog(@"图片数量--%ld----URL：%@",imageurl.count,imageurl);
    for (int i = 0; i < imageurl.count; i++) {//[picstrarray objectAtIndex:i]
        
        NSString *str2 = [imageurl objectAtIndex:i];
        NSString *imstring2 = [NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,str2];
        
        NSLog(@"imstring2 = %@",imstring2);
        UIImageView *scrollimagev2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0,self.view.bounds.size.width,100)];
        [scrollimagev2 sd_setImageWithURL:[NSURL URLWithString:imstring2] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            NSLog(@"scrollimagev2.image.size.height{%f",scrollimagev2.image.size.height);
            
            if (scrollimagev2.image.size.height > 0) {
               scrollimagev2.frame = CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, scrollimagev2.image.size.height/(scrollimagev2.image.size.width/self.view.bounds.size.width));
            }else{
            
            }
            
        }];
        
        scrollimagev2.userInteractionEnabled = YES;
        [imagescrollview addSubview:scrollimagev2];
        
        UIButton *scrollimagev = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
        // [scrollimagev sd_setBackgroundImageWithURL:[NSURL URLWithString:[picstrarray objectAtIndex:i]] forState:UIControlStateNormal];
        scrollimagev.backgroundColor = [UIColor clearColor];
        [scrollimagev addTarget:self action:@selector(imageoffbuttunclick:) forControlEvents:UIControlEventTouchUpInside];
        [imagescrollview addSubview:scrollimagev];
        
    }
    
    
        //关闭按钮
    UIButton *off = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    [off addTarget:self action:@selector(imageoffbuttunclick:) forControlEvents:UIControlEventTouchUpInside];
    [imagescrollview addSubview:off];
    
}
-(void)imageoffbuttunclick:(UIButton *)btn
{
    
    NSLog(@"关闭");
    [_imagebackview removeFromSuperview];
    _imagebackview = nil;
    [_imagetunningview removeFromSuperview];
    _imagetunningview = nil;
}

@end
