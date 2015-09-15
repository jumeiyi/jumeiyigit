//
//  myclientMenberGroupArrayViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/9.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientMenberGroupArrayViewController.h"

#import "TopBarView.h"
#import "mycustomerdata.h"
#import "GetCustomerDetailByDoctorSno.h"
#import "PrefixHeader.pch"
#import "myclientManGroupCell.h"
#import "myclientdatasViewController.h"
#import "myclientmainsetgropViewController.h"

@interface myclientMenberGroupArrayViewController ()

@end

@implementation myclientMenberGroupArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebackk) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9",@"10",@"11",nil];
    
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9",@"10",@"11",nil];
    
    NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9",@"10",@"11",nil];
    
    NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9",@"10",@"11",nil];
    
    self.yemei = [[NSMutableArray alloc] initWithObjects: @"孙悟空" , @"猪八戒", @"牛魔王", @"蜘蛛精", nil];
    self.grouparray = [[NSMutableArray alloc] initWithObjects:array1,array2,array3,array4, nil];
    
    for (int i = 0; i < self.grouparray.count; i++) {
        
      NSArray *ary = [self.grouparray objectAtIndex:i];
        NSMutableArray *lengthary = [[NSMutableArray alloc] init];
        [lengthary addObject:@"y"];
        
    }
    
    
    UIImageView *gradimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 67 + 62, self.view.bounds.size.width, 22)];
    gradimage.backgroundColor = [self colorWithRGB:0xEEEEEE alpha:1];
    [self.view addSubview:gradimage];
    
    self.myscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 67 + 62 + 22, self.view.bounds.size.width, 68)];
    self.myscrollview.backgroundColor = [UIColor whiteColor];
    self.myscrollview.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 68);
    [self.view addSubview:self.myscrollview];
    
    
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,  67 + 62 + 22 + 68, self.view.bounds.size.width, self.view.bounds.size.height - ( 67 + 62 + 22 + 68))];
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
    

    
    UIImageView *shoosebtnimageback = [[UIImageView alloc] initWithFrame:CGRectMake(5, 75, self.view.bounds.size.width - 10, 42)];
    shoosebtnimageback.image = [UIImage imageNamed:@"sousuobian"];
    shoosebtnimageback.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shoosebtnimageback];
    
    _shoosebtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 75, 50, 37)];
    [_shoosebtn setTitle:@"姓名:" forState:UIControlStateNormal];
    [_shoosebtn setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
    [_shoosebtn addTarget:self action:@selector(shoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shoosebtn];
    
    UIImageView *shoosebtnimage = [[UIImageView alloc] initWithFrame:CGRectMake(52, 92, 15, 10)];
    shoosebtnimage.image = [UIImage imageNamed:@"图片2"];
    [self.view addSubview:shoosebtnimage];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(70.0f,77, self.view.frame.size.width - 80 , 37.0f)];
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
    
    _data = [[NSMutableData alloc] init];
    
    _shooesproject = [[NSMutableArray alloc] initWithObjects:@"姓名",@"项目", nil];
    
    self.isgroupes = NO;
    self.isproject = NO;
    
    [self startrequest];
    
    

    
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
        
        //[self soaprequstWithGetProTypePageData:searchBar.text];
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
    
}


-(void)comebackk
{
    [self.navigationController popViewControllerAnimated:YES];
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
        
        return 3;
        
    }else if (tableView.tag == 62){
        return _groups.count;
    }else{
        return 2;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 60) {
        
//        // 获取分区号
//        NSUInteger sectionNo = indexPath.section;
//        // 获取表格行的行号
//        NSUInteger rowNo = indexPath.row;
//        NSString* story = [_headnamearray objectAtIndex:sectionNo];
        
        static NSString *identifier = @"cell";
        
        myclientManGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[myclientManGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 8;
        //mycustomerdata *mycustom = [_mycustomerDataarray objectAtIndex:indexPath.row];
        
        cell.headimage.frame = CGRectMake(0, 0, 0, 0);
        cell.headimage.image = [UIImage imageNamed:@""];
        
        cell.shooseimage.frame = CGRectMake(0, 0, 0, 0);
        cell.shooseimage.image = [UIImage imageNamed:@""];
        
        cell.name.frame = CGRectMake(0, 0, 0, 0);
        cell.name.text = @" 名称X X";
        
        cell.project1.frame = CGRectMake(0, 0, 0, 0);
        cell.project1.text = @"";
        
        cell.project2.frame = CGRectMake(0, 0, 0, 0);
        cell.project2.text = @"";
        
        cell.project3.frame = CGRectMake(0, 0, 0, 0);
        cell.project3.text = @"";
        
        
//        if (indexPath.section == 0) {
//            
//            cell.headimage.frame = CGRectMake(15, 9, 50, 50);
//            cell.headimage.image = [UIImage imageNamed:@"图片4"];
//            
//            cell.name.frame = CGRectMake(80, 25, 100, 20);
//            cell.name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
//            cell.name.text = @"分组";
//            cell.name.textColor = [self colorWithRGB:0x00c5bb alpha:1];
//            
//        }else{
        
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
        
        
        cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 60, 22, 25, 25);
        cell.shooseimage.image = [UIImage imageNamed:@"sucaibaganger"];
//        }
        
        
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
        
    }else{
        
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
        
    }
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (tableView.tag == 60) {
//         return [_headnamearray objectAtIndex:section] ;
//    }else{
//        return nil;
//    }
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 22)];
        view.backgroundColor = [self colorWithRGB:0xeeeeee alpha:1];
        [tableView addSubview:view];
        
        UILabel *titlelable = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, 50, 20)];
        titlelable.text = [_headnamearray objectAtIndex:section];
        titlelable.font = [UIFont systemFontOfSize:13];
        titlelable.textColor = [self colorWithRGB:0x666666 alpha:1];
        [view addSubview:titlelable];
        
        return view;
        
    }else{
        
        return nil;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"我点击了%ld区，%ld行",indexPath.section,indexPath.row);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 62 || tableView.tag == 63) {
        return 30;
    }else{
        return 68;
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

// UITableViewDataSource协议中的方法，该方法的返回值用于在表格右边建立一列浮动的索引。
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
     _tableview.sectionIndexColor = [self colorWithRGB:0x666666 alpha:1];
    return _headnamearray;
}

// UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的页眉
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection
                      :(NSInteger)section
{
    return [_headnamearray objectAtIndex:section];
}

// UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的页脚
- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection
                       :(NSInteger)section
{
//    NSString* story = [_headnamearray objectAtIndex:section];
//    return [NSString stringWithFormat:@"一共有%d个人物"
//            , [[_headnamearray objectForKey:story] count]];
    return nil;
}
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
    
    if (self.istop == YES) {
        [_mycustomerDataarray removeAllObjects];
        self.istop = NO;
    }
    
    NSMutableArray *customerData = [dic objectForKey:@"data"];
    for (NSDictionary *mycusdiction in customerData) {
        mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
        [_mycustomerDataarray addObject:mycustom];
    }
    [_tableview reloadData];
    
    NSLog(@"customerData--%@",customerData);
    
    if ([state isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
}

@end
