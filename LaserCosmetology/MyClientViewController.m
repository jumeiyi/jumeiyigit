//
//  MyClientViewController.m
//  LaserCosmetology
//
//  Created by fenghuang on 15/3/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//
#define UID @"wdc001"
#define PSW @"dcg658"

#import "MyClientViewController.h"
#import "TopBarView.h"
#import "myClientCell.h"
#import "mycustomerdata.h"
#import "GetCustomerDetailByDoctorSno.h"
#import "PrefixHeader.pch"

//
#import "myclientmenbergroupViewController.h"
#import "myclientdatasViewController.h"

//

@interface MyClientViewController ()

@end

@implementation MyClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
        
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];

    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comeback) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    
    _groups = [[NSMutableArray alloc] initWithObjects:@"已服务",@"关注我",@"专属客户",@"休眠客户", nil];
    
    _groupbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:0]]/2 + 10) , 27, [self NSStringwithsize:17 str:[_groups objectAtIndex:0]] + 20, 20)];
    [_groupbtn  addTarget:self action:@selector(groupsbuttonclick) forControlEvents:UIControlEventTouchUpInside];
    [_groupbtn setTitle:[_groups objectAtIndex:0] forState:UIControlStateNormal];
    [topbar addSubview:_groupbtn];
    
    
    _btnimage = [[UIImageView alloc] initWithFrame:CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10)];
    _btnimage.image = [UIImage imageNamed:@"yishengwdkhx"];
    [topbar addSubview:_btnimage];
    

    
    _headnamearray = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];

    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 44, self.view.bounds.size.width, self.view.bounds.size.height - (64 + 44))];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.layer.cornerRadius = 8;
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.tag = 60;
    [self.view addSubview:_tableview];
    
    _refreshControl=[[RefreshControl alloc] initWithScrollView:_tableview delegate:self];
    _refreshControl.topEnabled=YES;
    //_refreshControl.bottomEnabled=YES;//会崩
    
    _mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.typeInfo = @"";  self.a = 1;
    [self soaprequst2WithdoctorSno:self.doctorsno typeInfo:self.typeInfo firstWord:@"" strPageindex:@"1" strPagesize:@"15"];
    
    
    UITableView *headnametableview = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 40, 64 + 44, 40, self.view.bounds.size.height - 108 )];
    headnametableview.delegate = self;
    headnametableview.dataSource = self;
    headnametableview.rowHeight = 20;
    headnametableview.tag = 61;
    headnametableview.backgroundColor = [UIColor clearColor];
    headnametableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:headnametableview];
    
    UIImageView *shoosebtnimageback = [[UIImageView alloc] initWithFrame:CGRectMake(5, 65, self.view.bounds.size.width - 10, 45)];
    shoosebtnimageback.image = [UIImage imageNamed:@"sousuobian"];
    shoosebtnimageback.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shoosebtnimageback];
    
    _shoosebtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 64, 50, 44)];
    [_shoosebtn setTitle:@"姓名:" forState:UIControlStateNormal];
    [_shoosebtn setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
    [_shoosebtn addTarget:self action:@selector(shoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shoosebtn];
    
    UIImageView *shoosebtnimage = [[UIImageView alloc] initWithFrame:CGRectMake(52, 82, 15, 10)];
    shoosebtnimage.image = [UIImage imageNamed:@"图片2"];
    [self.view addSubview:shoosebtnimage];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(70.0f,67, self.view.frame.size.width - 80 , 40.0f)];
    self.searchBar.delegate =self;
    self.searchBar.placeholder = @"搜索项目，医生";
    self.searchBar.tintColor = [UIColor lightGrayColor];
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:self.searchBar];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baisebeijing"]];
    imageView.backgroundColor = [UIColor clearColor];
    self.searchBar.backgroundImage = imageView.image;
    
//    self.searchDisplay = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//    _searchDisplay.searchResultsDataSource = self;
//    _searchDisplay.searchResultsDelegate =self;
    
    _shooesproject = [[NSMutableArray alloc] initWithObjects:@"姓名",@"项目", nil];
    
    self.isgroupes = NO;
    self.isproject = NO;
    
}

#pragma mark --UISearchBar
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setText:@""];
     self.searchBar.frame = CGRectMake(70.0f,67, self.view.frame.size.width - 100 , 40.0f);
    return;
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchBar.frame = CGRectMake(70.0f,67, self.view.frame.size.width - 80 , 40.0f);
    NSLog(@"%@",searchBar.text);
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    if ([searchBar.text isEqual:nil]) {
        return;
    }else if ([searchBar.text isEqual:@""]){
        return;
    }else{
        
//        [self soaprequstWithGetProTypePageData:searchBar.text];
        NSLog(@"searchBar.text---> %@",searchBar.text);
    }
    
    self.searchBar.frame = CGRectMake(70.0f,67, self.view.frame.size.width - 80 , 40.0f);
}


- (void)refreshControl:(RefreshControl *)refreshControl didEngageRefreshDirection:(RefreshDirection)direction
{
    if (direction==RefreshDirectionTop)
    {
        NSLog(@"下拉刷新");
        self.a = 1;
        self.istop = YES;
         [self soaprequst2WithdoctorSno:self.doctorsno typeInfo:self.typeInfo firstWord:@"" strPageindex:@"1" strPagesize:@"15"];
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

-(void)groupsbuttonclick
{
   
    UITableView *grouptableview;
    
    if (self.isgroupes == NO) {
        
        if (shoosebtnview) {
            [shoosebtnview removeFromSuperview];
            shoosebtnview = nil;
            self.isproject = NO;
        }
        
        btnview = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 75 , 50, 150, 200)];
        [self.view addSubview:btnview];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnview.bounds.size.width, btnview.bounds.size.height)];
        image.image = [UIImage imageNamed:@"yishengwdkh"];
        [btnview addSubview:image];
        
        grouptableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10,btnview.bounds.size.width, btnview.bounds.size.height - 10)];
        grouptableview.tag = 62;
        grouptableview.delegate = self;
        grouptableview.dataSource = self;
        grouptableview.backgroundColor = [UIColor clearColor];
        grouptableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [btnview addSubview:grouptableview];
        
         _btnimage.image = [UIImage imageNamed:@"yishengwdkhs"];
        
        self.isgroupes = YES;
        
    }else{
        [btnview removeFromSuperview];
        btnview = nil;
        [grouptableview removeFromSuperview];
        grouptableview = nil;
        self.isgroupes = NO;
        _btnimage.image = [UIImage imageNamed:@"yishengwdkhx"];
    }

}

-(void)shoosebtnclick
{
    
    _btnimage.image = [UIImage imageNamed:@"yishengwdkhx"];
    UITableView *projectandname;
    
    if (self.isproject == NO) {
        
        if (btnview) {
            [btnview removeFromSuperview];
            btnview = nil;
            self.isgroupes = NO;
        }
        shoosebtnview = [[UIView alloc] initWithFrame:CGRectMake( 8 , 60 + 40, 60, 70)];
        [self.view addSubview:shoosebtnview];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, shoosebtnview.bounds.size.width, shoosebtnview.bounds.size.height)];
        image.image = [UIImage imageNamed:@"yishengwdkh"];
        [shoosebtnview addSubview:image];
        
        projectandname = [[UITableView alloc] initWithFrame:CGRectMake(0, 5,shoosebtnview.bounds.size.width, shoosebtnview.bounds.size.height  - 5)];
        projectandname.delegate = self;
        projectandname.dataSource = self;
        projectandname.tag = 63;
        projectandname.separatorStyle = UITableViewCellSeparatorStyleNone;
        projectandname.backgroundColor = [UIColor clearColor];
        [shoosebtnview addSubview:projectandname];
        
        self.isproject = YES;
        
    }else{
        [shoosebtnview removeFromSuperview];
        shoosebtnview = nil;
        [projectandname removeFromSuperview];
        projectandname = nil;
        
        self.isproject = NO;
    }
    
   
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 假设偏移表格高度的20%进行刷新
    if (!_isLoading) { // 判断是否处于刷新状态，刷新中就不执行
        // 取内容的高度：
        //    如果内容高度大于UITableView高度，就取TableView高度
        //    如果内容高度小于UITableView高度，就取内容的实际高度
        float height = scrollView.contentSize.height > _tableview.frame.size.height ?_tableview.frame.size.height : scrollView.contentSize.height;
        if ((height - scrollView.contentSize.height + scrollView.contentOffset.y) / height > 0.2) {
            // 调用上拉刷新方法
            NSLog(@"到底了");
            _isLoading = YES;
            self.a++;
            _timer1 = [NSTimer scheduledTimerWithTimeInterval:2.50 target:self selector:@selector(shuaxins) userInfo:nil repeats:NO];

             [self soaprequst2WithdoctorSno:self.doctorsno typeInfo:self.typeInfo firstWord:@"" strPageindex:[NSString stringWithFormat:@"%ld",self.a] strPagesize:@"15"];
            
            NSLog(@"a的值：%ld",self.a);
        }
        if (- scrollView.contentOffset.y / _tableview.frame.size.height > 0.2) {
            //            _isLoading = YES;
            //            self.a = 0;
            //            // 调用下拉刷新方法
            //            NSLog(@"到顶了");
            //
            //             _timer1 = [NSTimer scheduledTimerWithTimeInterval:2.50 target:self selector:@selector(shuaxins) userInfo:nil repeats:NO];
        }
    }
    
}
-(void)shuaxins
{
    _isLoading = NO;
    [_timer1 invalidate];
    _timer1 = nil;
    NSLog(@"到底了8899");
}


-(void)comeback
{
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void)xuanxaing:(UIButton *)button
//{
//    NSLog(@"button.tag-%ld",button.tag);
//    
//    if (button.tag == 20) {
//        self.typeInfo = @"1";
//        UIButton *butn1 = (UIButton *)[self.view viewWithTag:21];
//        UIButton *butn2 = (UIButton *)[self.view viewWithTag:22];
//        [butn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [butn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        
//    }else if (button.tag == 21){
//        
//        UIButton *butn1 = (UIButton *)[self.view viewWithTag:20];
//        UIButton *butn2 = (UIButton *)[self.view viewWithTag:22];
//        [butn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [butn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    
//        self.typeInfo = @"2";
//    }else{
//    self.typeInfo = @"3";
//        
//        UIButton *butn1 = (UIButton *)[self.view viewWithTag:20];
//        UIButton *butn2 = (UIButton *)[self.view viewWithTag:21];
//        [butn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [butn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    }
//    
//    [self soaprequst2WithdoctorSno:self.doctorsno typeInfo:self.typeInfo firstWord:@"" strPageindex:@"1" strPagesize:@"15"];
//
//    
//}

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
-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

#pragma mark tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 60) {
        return _headnamearray.count;
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
        return _mycustomerDataarray.count;
    }else if (tableView.tag == 62){
        return _groups.count;
    }else if (tableView.tag == 63){
        return 2;
    }else{
        return _headnamearray.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 60) {
        
        static NSString *identifier = @"cell";
        
        myClientCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[myClientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 8;
//        mycustomerdata *mycustom = [_mycustomerDataarray objectAtIndex:indexPath.row];
        
        cell.headimage.frame = CGRectMake(15, 9, 50, 50);
        cell.headimage.image = [UIImage imageNamed:@"图片4"];
        
        cell.name.frame = CGRectMake(80, 9, 100, 20);
        cell.name.font = [UIFont systemFontOfSize:14];
        cell.name.text = @" 名称X X";
        cell.name.textColor = [self colorWithRGB:0x666666 alpha:1];
        
        cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str: @"项目1"] + 20, 21);
        cell.project1.text = @"   项目1";
        cell.project1.font = [UIFont systemFontOfSize:11];
        cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
        cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
        cell.project1.layer.masksToBounds = YES;
        cell.project1.layer.cornerRadius = 3;
        
        cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 20, 39, [self NSStringwithsize:11 str: @"项目2"] + 20, 21);
        cell.project2.text = @"   项目2";
        cell.project2.font = [UIFont systemFontOfSize:11];
        cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
        cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
        cell.project2.layer.masksToBounds = YES;
        cell.project2.layer.cornerRadius = 3;
        
        cell.project3.frame = CGRectMake(cell.project2.frame.origin.x + [self NSStringwithsize:11 str:cell.project2.text] + 20, 39, [self NSStringwithsize:11 str:@"项目3"] + 20, 21);
        cell.project3.text = @"  项目3";
        cell.project3.font = [UIFont systemFontOfSize:11];
        cell.project3.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
        cell.project3.textColor = [self colorWithRGB:0xffffff alpha:1];
        cell.project3.layer.masksToBounds = YES;
        cell.project3.layer.cornerRadius = 3;
        
        
        
        return cell;

    }else if (tableView.tag == 62){
        
        static NSString *ident = @"cell2";
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell2) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        cell2.textLabel.text = [_groups objectAtIndex:indexPath.row];
        cell2.textLabel.font = [UIFont systemFontOfSize:15];
        cell2.textLabel.textColor = [UIColor whiteColor];
        cell2.backgroundColor = [UIColor clearColor];
        
        return cell2;
        
    }else if (tableView.tag == 63){
    
        static NSString *ident = @"cell3";
        UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell3) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        cell3.textLabel.text = [_shooesproject objectAtIndex:indexPath.row];
        cell3.textLabel.font = [UIFont systemFontOfSize:15];
        cell3.textLabel.textColor = [UIColor whiteColor];
        
        cell3.backgroundColor = [UIColor clearColor];
        
        return cell3;
        
    }else{
    
        static NSString *ident = @"cell1";
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell1) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        cell1.textLabel.text = [_headnamearray objectAtIndex:indexPath.row];
        cell1.textLabel.font = [UIFont systemFontOfSize:12];
        cell1.textLabel.textColor = [self colorWithRGB:0x00c5bb alpha:1];
        cell1.backgroundColor = [UIColor clearColor];
    
        return cell1;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
         return [_headnamearray objectAtIndex:section];
    }else{
        return nil;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 22)];
        view.backgroundColor = [self colorWithRGB:0xeeeeee alpha:1];
        [tableView addSubview:view];
        
        UILabel *titlelable = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, 50, 20)];
        titlelable.text = [_headnamearray objectAtIndex:section];
        [view addSubview:titlelable];
        
         return view;
        
    }else{
        
    return nil;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    myclientmenbergroupViewController *myclient = [[myclientmenbergroupViewController alloc] init];
//    [self.navigationController pushViewController:myclient animated:YES];
    
    myclientdatasViewController *myclient = [[myclientdatasViewController alloc] init];
    [self.navigationController pushViewController:myclient animated:YES];
    
//    if (tableView.tag == 60) {
//        
//        mycustomerdata *mycustom = [_mycustomerDataarray objectAtIndex:indexPath.row];
//        self.customersno = mycustom.Sno;
//        
//        GetCustomerDetailByDoctorSno *getcustomdetail = [[GetCustomerDetailByDoctorSno alloc] init];
//        getcustomdetail.mydoctorsno = self.doctorsno;
//        getcustomdetail.mycustomersno = self.customersno;
//        [self.navigationController pushViewController:getcustomdetail animated:YES];
//        
//    }else if (tableView.tag == 62){
//    
//        _groupbtn.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:0]]/2 + 5) , 27, [self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]] + 20, 20);
//        _btnimage.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
//        [_groupbtn  addTarget:self action:@selector(groupsbuttonclick) forControlEvents:UIControlEventTouchUpInside];
//        [_groupbtn setTitle:[_groups objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//        [btnview removeFromSuperview];
//        self.isgroupes = NO;
//        _btnimage.image = [UIImage imageNamed:@"yishengwdkhx"];
//        
//       
//    
//    }else if (tableView.tag == 63){
//        [_shoosebtn setTitle:[_shooesproject objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//        [shoosebtnview removeFromSuperview];
//        self.isproject = NO;
//    }else{
//    
//        self.firstWord = [_headnamearray objectAtIndex:indexPath.row];
//        [self soaprequst2WithdoctorSno:self.doctorsno typeInfo:self.typeInfo firstWord:self.firstWord strPageindex:@"1" strPagesize:@"40"];
//    }

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 62 || tableView.tag == 63) {
        return 30;
    }else if (tableView.tag == 60){
        return 68;
    }else{
        return 20;
    }

}

//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
        return 22;
    }else{
        return 0;
    }
    
}

#pragma mark -- soap请求
//我的客户
-(void)soaprequst2WithdoctorSno:(NSString *)doctorSno typeInfo:(NSString *)typeInfo firstWord:(NSString *)firstWord strPageindex:(NSString *)strPageindex strPagesize:(NSString *)strPagesize
{
    //封装soap请求消息
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>\n"
                             "<GetCustomerByDoctorSno xmlns=\"Doc\">\n"
                             "<uid>%@</uid>\n"
                             "<pwd>%@</pwd>\n"
                             "<doctorSno>%@</doctorSno>\n"
                             "<typeInfo>%@</typeInfo>\n"
                             "<firstWord>%@</firstWord>\n"
                             "<strPageindex>%@</strPageindex>\n"
                             "<strPagesize>%@</strPagesize>\n"
                             "</GetCustomerByDoctorSno>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>\n",UID,PSW,doctorSno,typeInfo,firstWord,strPageindex,strPagesize];
    
    //NSLog(@"soapMessage");
    //请求发送到的路径
    NSURL *url = [NSURL URLWithString:HTTPREQUESTER];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    //以下对请求信息添加属性前四句是必有的，第五句是soap信息。
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"Doc/GetCustomerByDoctorSno" forHTTPHeaderField:@"SOAPAction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"post"];//这个有时候可以换一下一种请求方式，不然请求方式错了返回的是HTML格式的代码而且得不到返回值
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    //如果连接已经建好，则初始化data
    if( theConnection )
    {
        //webData = [[NSMutableData data] retain];
        webData = [NSMutableData data];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
}

#pragma mark SOAP请求方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
    NSHTTPURLResponse *urlresponse = (NSHTTPURLResponse *)response;
    NSLog(@"状态码----》%ld",(long)[urlresponse statusCode]);
    NSLog(@"响应头部信息---》%@",[urlresponse allHeaderFields]);
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
    //NSLog(@"connection: didReceiveData:2");
    
}

//如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConenction");
    
    // NSLog(@"ERROR with theConenction");
    UIAlertView * alert =
    [[UIAlertView alloc]
     initWithTitle:@"提示"
     message:@"链接超时或无网络!"
     delegate:self
     cancelButtonTitle:nil
     otherButtonTitles:@"OK", nil];
    [alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // NSLog(@"3 DONE. Received Bytes: %ld", [webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"我的客户的数据--%@",theXML);
    
    //        NSString *str = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
    //
    //
    //             NSLog(@"请求回来的数据-2--%@",str);
    
    //重新加載xmlParser
    //    if( xmlParser )
    //    {
    //       // [xmlParser release];
    //    }
    
    xmlParser = [[NSXMLParser alloc] initWithData: webData];
    [xmlParser setDelegate: self];
    [xmlParser setShouldResolveExternalEntities: YES];
    [xmlParser parse];
    
    // [connection release];
    //[webData release];
}

#pragma mark - XML数据接收
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"GetCustomerByDoctorSnoResult"]) {
        
        [_soapResults setString:@""];//把它置空，准备接收新值。
    }
    

}

// 找到内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // 如果内容太长,会分多次去读,这里需要拼接(追加)
    [_soapResults appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"GetCustomerByDoctorSnoResult"]) {
        
        
        
        NSData *jsonData = [_soapResults dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"我的客户的数据：dic%@",dic);
        
        NSString *state = [dic objectForKey:@"state"];
        
        NSString *msg = [dic objectForKey:@"msg"];
        
        if (self.istop == YES) {
            [_mycustomerDataarray removeAllObjects];
            self.istop = NO;
        }
        
        NSMutableArray *customerData = [dic objectForKey:@"customerData"];
        for (NSDictionary *mycusdiction in customerData) {
            mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
            [_mycustomerDataarray addObject:mycustom];
        }
        [_tableview reloadData];
        
        if ([state isEqualToString:@"0"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }
    
    
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"-------------------start--------------");
    // 创建一个可变字符串
    _soapResults = [[NSMutableString alloc] initWithCapacity:0];//解析开始了，创建空字符串来存
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"-------------------end--------------");
}

@end
