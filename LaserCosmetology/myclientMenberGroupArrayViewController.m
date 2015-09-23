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
#import "AFHTTPRequestOpeartionManagerOfme.h"

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
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(startrequestaaa) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];
    
    _groups = [[NSMutableArray alloc] initWithObjects:@"已服务",@"关注我",@"专属客户",@"休眠客户", nil];
    _groupIDarray = [[NSMutableArray alloc] initWithObjects:@"serviced",@"focusme",@"Exclusive",@"sleep",nil];
    
    _groupbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:0]]/2 + 10) , 27, [self NSStringwithsize:17 str:[_groups objectAtIndex:0]] + 20, 20)];
    [_groupbtn  addTarget:self action:@selector(groupsbuttonclick) forControlEvents:UIControlEventTouchUpInside];
    [_groupbtn setTitle:[_groups objectAtIndex:0] forState:UIControlStateNormal];
    [topbar addSubview:_groupbtn];
    
    
    _btnimage = [[UIImageView alloc] initWithFrame:CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10)];
    _btnimage.image = [UIImage imageNamed:@"yishengwdkhx"];
    [topbar addSubview:_btnimage];
    
    
    
    UIImageView *gradimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 67 + 62, self.view.bounds.size.width, 22)];
    gradimage.backgroundColor = [self colorWithRGB:0xEEEEEE alpha:1];
    [self.view addSubview:gradimage];
    
    
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
    
    
    self.typeInfo = @"";  self.a = 1;
    

    
    UIImageView *shoosebtnimageback = [[UIImageView alloc] initWithFrame:CGRectMake(5, 75, self.view.bounds.size.width - 10, 42)];
    shoosebtnimageback.image = [UIImage imageNamed:@"sousuobian"];
    shoosebtnimageback.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shoosebtnimageback];
    
    _shoosebtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 75, 50, 37)];
    [_shoosebtn setTitle:@"姓名 " forState:UIControlStateNormal];
    [_shoosebtn setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
    [_shoosebtn addTarget:self action:@selector(shoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shoosebtn];
    
    UIImageView *shoosebtnimage = [[UIImageView alloc] initWithFrame:CGRectMake(52, 92, 15, 10)];
    shoosebtnimage.image = [UIImage imageNamed:@"图片2"];
    [self.view addSubview:shoosebtnimage];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f)];
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
    self.group = [_groupIDarray objectAtIndex:0];
    
    _sectionindex = [[NSMutableArray alloc] initWithCapacity:0];
    _insectionofrow = [[NSMutableArray alloc] initWithCapacity:0];
    _getmanberary = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    self.doctorsno =  [userdf objectForKey:@"customerSno"];//这个实际上医生的索引
    

    [self startrequest];
    
}

-(void)viewWillAppear:(BOOL)animated

{
    
    [super viewWillAppear:animated];
    [_groups removeAllObjects];
    _groups = nil;
    [_groupIDarray removeAllObjects];
    _groupIDarray = nil;
    
    self.group = @"serviced";
    
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getgrouplist.go?doctorsno=%@",HTTPREQUESTPDOMAIN,self.doctorsno];
    
    [AFHTTPRequestOpeartionManagerOfme postSetgroups:string withBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSMutableArray *array3) {
        
        _groups = [[NSMutableArray alloc] initWithObjects:@"已服务",@"关注我",@"专属客户",@"休眠客户", nil];
        _groupIDarray = [[NSMutableArray alloc] initWithObjects:@"serviced",@"focusme",@"Exclusive",@"sleep",nil];
        
        for (int i = 0; i < array1.count; i++) {
            [_groups addObject:[array1 objectAtIndex:i]];
        }
        [_groupbtn setTitle:[_groups objectAtIndex:0] forState:UIControlStateNormal];
        _groupbtn.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:0]]/2 + 10), _groupbtn.frame.origin.y, [self NSStringwithsize:17 str:[_groups objectAtIndex:0]] + 20, _groupbtn.frame.size.height);
        _btnimage.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
        
        for (int i = 0; i < array3.count; i++) {
            [_groupIDarray addObject:[array3 objectAtIndex:i]];
        }
        
        [_grouptableview reloadData];
        
    }];
    
}


-(void)savebtnclickg
{
    NSString *strinf;
    for (mycustomerdata *mydata in _getmanberary) {
      NSString *str = [NSString stringWithFormat:@"%@",mydata.sno];
        NSLog(@"mydata.nickname--str:%@",str);
        strinf = [NSString stringWithFormat:@"%@,%@",strinf,str];
        
    }
    self.customersIDs = strinf;
    
    NSLog(@"mydata.nickname--strself.doctorsno:%@---self.groupid:%@-----self.groupname:%@",self.doctorsno,self.groupid,self.groupname);
    self.groupid = @"";
    
    NSString *string = [NSString stringWithFormat:@"%@//doctor.savegroup.go?groupid=%@&groupname=%@&doctorsno=%@&customers=%@",HTTPREQUESTPDOMAIN,self.groupid,self.groupname,self.doctorsno,self.customersIDs];
    
    NSLog(@"string-保存URL-%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postsavegroupplist:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
       
    }];
//
//    
//    /doctor.savegroup.go
//    {groupid:'',groupname:'',doctorsno:'',customers:''} （分组，新增，保存）
}

-(void)addmanberToscrollview
{
    
        [self.myscrollview removeFromSuperview];
        self.myscrollview = nil;
    
        self.myscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 67 + 62 + 22, self.view.bounds.size.width, 68)];
        self.myscrollview.backgroundColor = [UIColor whiteColor];
        self.myscrollview.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 68);
        [self.view addSubview:self.myscrollview];

    for (int i = 0; i < _getmanberary.count; i++) {
        float x = (20 + 50) * i + 20;
        UIImageView *manberimage = [[UIImageView alloc] initWithFrame:CGRectMake(x, 10, 50, 50)];
        manberimage.image = [UIImage imageNamed:@"图片4"];
        manberimage.tag = i;
        [self.myscrollview addSubview:manberimage];
    }


}

-(void)startrequest
{

    NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=%@&toPage=1&Count_per_Page=15",HTTPREQUESTPDOMAIN,self.doctorsno,self.group];
    
    NSLog(@"url---string-:%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postmanberplistandurl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        _sectionindex = array1;
        _insectionofrow = array2;
        
       
         _sectionary = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i < _insectionofrow.count; i++) {
            
            NSMutableArray *rowary = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableArray *romnumber = [_insectionofrow objectAtIndex:i];
            for (int j = 0; j <  romnumber.count;j++) {
                [rowary addObject:@"y"];
            }
            [_sectionary addObject:rowary];
        }
        
         [_tableview reloadData];
    }];

}

#pragma mark --UISearchBar
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setText:@""];
    self.searchBar.frame = CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f);
    return;
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchBar.frame = CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f);
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
    
    self.searchBar.frame = CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f);
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
        
        _grouptableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10,btnview.bounds.size.width, btnview.bounds.size.height - 10)];
        _grouptableview.tag = 62;
        _grouptableview.delegate = self;
        _grouptableview.dataSource = self;
        _grouptableview.backgroundColor = [UIColor clearColor];
        _grouptableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [btnview addSubview:_grouptableview];
        
        _btnimage.image = [UIImage imageNamed:@"yishengwdkhs"];
        
        self.isgroupes = YES;
        
    }else{
        [btnview removeFromSuperview];
        btnview = nil;
        [_grouptableview removeFromSuperview];
        _grouptableview = nil;
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
        return _sectionindex.count;
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 60) {
        NSMutableArray *rownumber = [_insectionofrow objectAtIndex:section];
        return  rownumber.count;
        
    }else if (tableView.tag == 62){
        return _groups.count;
    }else{
        return 2;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 60) {
        

        
        static NSString *identifier = @"cell";
        
        myclientManGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[myclientManGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 8;
        
        NSMutableArray *mycustomary = [_insectionofrow objectAtIndex:indexPath.section];
        mycustomerdata *mycustom = [mycustomary objectAtIndex:indexPath.row];
        
        cell.headimage.frame = CGRectMake(0, 0, 0, 0);
        cell.headimage.image = [UIImage imageNamed:@""];
        
        cell.shooseimage.frame = CGRectMake(0, 0, 0, 0);
        cell.shooseimage.image = [UIImage imageNamed:@""];
        
        cell.name.frame = CGRectMake(0, 0, 0, 0);
        cell.name.text = @"";
        
        cell.project1.frame = CGRectMake(0, 0, 0, 0);
        cell.project1.text = @"";
        
        cell.project2.frame = CGRectMake(0, 0, 0, 0);
        cell.project2.text = @"";
        
        cell.project3.frame = CGRectMake(0, 0, 0, 0);
        cell.project3.text = @"";
        

        
            cell.headimage.frame = CGRectMake(15, 9, 50, 50);
            cell.headimage.image = [UIImage imageNamed:@"图片4"];
            
            cell.name.frame = CGRectMake(80, 9, self.view.bounds.size.width - 100, 20);
            cell.name.font = [UIFont systemFontOfSize:14];
            cell.name.text = [NSString stringWithFormat:@" %@",mycustom.nickname];
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
        
        
        NSMutableArray *rowary = [_sectionary objectAtIndex:indexPath.section];
        NSString *strary = [rowary objectAtIndex:indexPath.row];
        
        if ([strary isEqualToString:@"y"]) {
            cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 60, 22, 25, 25);
            cell.shooseimage.image = [UIImage imageNamed:@"sucaibaganger"];
        }else{
            cell.shooseimage.frame = CGRectMake(self.view.bounds.size.width - 60, 22, 25, 25);
            cell.shooseimage.image = [UIImage imageNamed:@"sucaiba"];
        }


        
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
            titlelable.text = [_sectionindex objectAtIndex:section];
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
    
    if (tableView.tag == 62) {
        self.group = [_groupIDarray objectAtIndex:indexPath.row];
        
        [self startrequest];
        [self groupsbuttonclick];
        
            [_groupbtn setTitle:[_groups objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            _groupbtn.frame = CGRectMake(_groupbtn.frame.origin.x, _groupbtn.frame.origin.y, [self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]] + 20, _groupbtn.frame.size.height);
            self.group = [_groupIDarray objectAtIndex:indexPath.row];
            
            _btnimage.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
       
    }else if (tableView.tag == 63){
        [self shoosebtnclick];
    }else{
        
        
        NSMutableArray *rowary = [_sectionary objectAtIndex:indexPath.section];
        NSString *str = [rowary objectAtIndex:indexPath.row];
        if ([str isEqualToString:@"y"]) {
            [rowary replaceObjectAtIndex:indexPath.row withObject:@"x"];
            
        }else{
            [rowary replaceObjectAtIndex:indexPath.row withObject:@"y"];
        }
        
        NSIndexPath *indexPath_1=[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        NSArray *indexArray=[NSArray arrayWithObject:indexPath_1];
        [_tableview reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [_getmanberary removeAllObjects];
        
        for (int a = 0; a < _insectionofrow.count; a ++) {
            NSMutableArray *sectionary = [_insectionofrow objectAtIndex:a];
            NSMutableArray *rowary = [_sectionary objectAtIndex:a];
            
            for (int j = 0; j < sectionary.count; j++) {
                 NSString *str = [rowary objectAtIndex:j];
                mycustomerdata *mydt = [sectionary objectAtIndex:j];
                if ([str isEqualToString:@"x"]) {
                    [_getmanberary addObject:mydt];
                }
            }
        }
        
        [self addmanberToscrollview];
        NSLog(@"_getmanberary.count-: %ld",_getmanberary.count);
        
    }
    
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
    if (tableView.tag == 60) {
        _tableview.sectionIndexColor = [self colorWithRGB:0x666666 alpha:1];
        return _sectionindex;
    }else{
        return nil;
    }

}

// UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的页眉
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection
                      :(NSInteger)section
{
    if (tableView.tag == 60) {
         return [_sectionindex objectAtIndex:section];
    }else{
        return nil;
    }
   
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

-(void)startrequestaaa
{
    NSString *strinf = @"";
    for (mycustomerdata *mydata in _getmanberary) {
        NSString *str = [NSString stringWithFormat:@"%@",mydata.sno];
        if ([strinf isEqualToString:@""]) {
            strinf = [NSString stringWithFormat:@"%@",str];
        }else{
        strinf = [NSString stringWithFormat:@"%@,%@",strinf,str];
        }
        
    }
    
    self.customersIDs = strinf;
    
    NSString *string = [NSString stringWithFormat:@"%@//doctor.savegroup.go?groupid=%@&groupname=%@&doctorsno=%@&customers=%@",HTTPREQUESTPDOMAIN,self.groupid,self.groupname,self.doctorsno,self.customersIDs];
    
    NSLog(@"string-保存URL-%@",string);
    
    [self requstwithurl:string];
}

#pragma mark  request

-(void)requstwithurl:(NSString *)str
{
    
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                   (CFStringRef)str,
                                                                                   NULL,
                                                                                   NULL,
                                                                                   kCFStringEncodingUTF8));
    NSURL *urlstr = [NSURL URLWithString:encodedString];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:urlstr];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requst delegate:self];
    
    [connection start];
    
    NSLog(@"url--------%@",str);
}

#pragma mark  requestdelegate
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求失败  _ %@",error);
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
    
    //     NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    //    NSLog(@"str------》%@",str);
    
    //JSON解析器
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"000000------------%@",dic);
    
    
    NSDictionary *customerData = [dic objectForKey:@"Content"];

    NSString *masdiction = [NSString stringWithFormat:@"%@",[customerData objectForKey:@"state"]];
     NSString *msgdictions = [NSString stringWithFormat:@"%@",[customerData objectForKey:@"msg"]];
    
    NSLog(@"masdiction:%@--msgdictions:%@",masdiction,msgdictions);
 
    if ([msgdictions isEqualToString:@"操作成功！"]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msgdictions delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
        [self.navigationController popViewControllerAnimated:YES];
    }else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msgdictions delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }

    
    
}



@end
