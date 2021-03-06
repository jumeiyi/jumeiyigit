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

#import "myclientdatasViewController.h"
#import "myclientmainsetgropViewController.h"
#import "UIImageView+WebCache.h"

@interface MyClientViewController ()

@end

@implementation MyClientViewController

-(void)viewWillAppear:(BOOL)animated

{
    
    [super viewWillAppear:animated];
    
    
    self.group = @"serviced";
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getgrouplist.go?doctorsno=%@",HTTPREQUESTPDOMAIN,self.doctorsno];
    
    [AFHTTPRequestOpeartionManagerOfme postSetgroups:string withBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSMutableArray *array3) {
        
//        _groups = [[NSMutableArray alloc] initWithObjects:@"已服务",@"关注我",@"专属客户",@"休眠客户", nil];
//        _groupIDarray = [[NSMutableArray alloc] initWithObjects:@"serviced",@"focusme",@"Exclusive",@"sleep",nil];
        
        [_groups removeAllObjects];
        _groups = nil;
        [_groupIDarray removeAllObjects];
        _groupIDarray = nil;
        
        NSLog(@"_groups.count-1--%ld",_groups.count);
        
        _groups = [[NSMutableArray alloc] initWithObjects:@"我的患者", nil];
        _groupIDarray = [[NSMutableArray alloc] initWithObjects:@"serviced",nil];
        
        for (int i = 0; i < array1.count; i++) {
            [_groups addObject:[array1 objectAtIndex:i]];
        }
        [_groupbtn setTitle:[_groups objectAtIndex:0] forState:UIControlStateNormal];
        _groupbtn.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:0]]/2 + 10), _groupbtn.frame.origin.y, [self NSStringwithsize:17 str:[_groups objectAtIndex:0]] + 20, _groupbtn.frame.size.height);
        _imagebtn.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
        
        for (int i = 0; i < array3.count; i++) {
            [_groupIDarray addObject:[array3 objectAtIndex:i]];
        }
        
        NSLog(@"_groups--2-: %ld",_groups.count);
       
    }];
    
    
    [AFHTTPRequestOpeartionManagerOfme getTheGroupOfNumberWith:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        _numberofmanber = array1;
        
    }];
    
}


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
    
    
    _groupbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:@"我的患者"]/2 + 10) , 27, [self NSStringwithsize:17 str:@"我的患者"] + 20, 20)];
    [_groupbtn  addTarget:self action:@selector(groupsbuttonclick) forControlEvents:UIControlEventTouchUpInside];
    [_groupbtn setTitle:@"我的患者" forState:UIControlStateNormal];
    [topbar addSubview:_groupbtn];
    
    
    _imagebtn = [[UIButton alloc] initWithFrame:CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10)];
    [_imagebtn setBackgroundImage:[UIImage imageNamed:@"yishengwdkhx"] forState:UIControlStateNormal];
    [_imagebtn addTarget:self action:@selector(groupsbuttonclick) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:_imagebtn];
    
//    //搜索边框
//    UIImageView *shoosebtnimageback = [[UIImageView alloc] initWithFrame:CGRectMake(15, 75, self.view.bounds.size.width - 30, 42)];
//    shoosebtnimageback.image = [UIImage imageNamed:@"sousuobian"];
//    shoosebtnimageback.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:shoosebtnimageback];
//    
//    
//    _shoosebtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 77, 50, 37)];
//    [_shoosebtn setTitle:@"姓名 " forState:UIControlStateNormal];
//    [_shoosebtn setTitleColor:[self colorWithRGB:0x00c5bb alpha:1] forState:UIControlStateNormal];
//    [_shoosebtn addTarget:self action:@selector(shoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_shoosebtn];
//    
//    UIImageView *shoosebtnimage = [[UIImageView alloc] initWithFrame:CGRectMake(62, 90, 15, 10)];
//    shoosebtnimage.image = [UIImage imageNamed:@"图片2"];
//    [self.view addSubview:shoosebtnimage];
//    
//    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f)];
//    self.searchBar.delegate =self;
//    self.searchBar.placeholder = @"搜索项目，客户";
//    self.searchBar.tintColor = [UIColor lightGrayColor];
//    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
//    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    self.searchBar.keyboardType = UIKeyboardTypeDefault;
//    [self.view addSubview:self.searchBar];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baisebeijing"]];
    imageView.backgroundColor = [UIColor clearColor];
    self.searchBar.backgroundImage = imageView.image;
    
//    self.searchDisplay = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//    _searchDisplay.searchResultsDataSource = self;
//    _searchDisplay.searchResultsDelegate =self;
    
    
    
    _refreshControl=[[RefreshControl alloc] initWithScrollView:_tableview delegate:self];
    _refreshControl.topEnabled=YES;
    //_refreshControl.bottomEnabled=YES;//会崩
    
    _headnamearray = [[NSMutableArray alloc] initWithCapacity:0];
    _allgroup = [[NSMutableArray alloc] initWithCapacity:0];

    
    _mycustomerDataarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.typeInfo = @"name";  self.a = 1;
    
      _data = [[NSMutableData alloc] init];
    
    _shooesproject = [[NSMutableArray alloc] initWithObjects:@"姓名",@"项目", nil];
    
    
    self.isgroupes = NO;
    self.isproject = NO;
    self.IsServiced = YES;
    self.group = @"serviced";
    self.AllowRefresh = NO;
    self.didselector = 0;
    
    [self startrequest];
    
}


-(void)creattableview
{
    
    NSLog(@"creattableview");
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.layer.cornerRadius = 8;
        _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.tag = 60;
        [self.view addSubview:_tableview];
    }else{
        
        [_tableview reloadData];
    }
    
    
    if (_allgroup.count > 0) {
        _tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    }else{
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
        

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
    self.searchcontents = searchBar.text;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    if ([searchBar.text isEqual:nil]) {
        return;
    }else if ([searchBar.text isEqual:@""]){
        return;
    }else{
        
    }
    
    self.searchBar.frame = CGRectMake(80.0f,77, self.view.frame.size.width - 110 , 37.0f);
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    NSLog(@"MMMMMMMM");
    [self.view endEditing:YES];
//    [self searchdata];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    self.isgroupes = YES;
    [self groupsbuttonclick];
    
    self.isproject = YES;
    [self shoosebtnclick];
    
    [_tableview endEditing:YES];
   
}

//表格滑动时候调用UIScrollView的方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"将要活动---------");
    [self.view endEditing:YES];
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

    NSLog(@"_groups.count --3- %ld",_groups.count);
    
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
        
        [_imagebtn setBackgroundImage:[UIImage imageNamed:@"yishengwdkhs"] forState:UIControlStateNormal];
        
        _tableview.userInteractionEnabled = NO;
        self.isgroupes = YES;
        
    }else{
        
        [btnview removeFromSuperview];
        btnview = nil;
        [grouptableview removeFromSuperview];
        grouptableview = nil;
        
        _tableview.userInteractionEnabled = YES;
        self.isgroupes = NO;
        [_imagebtn setBackgroundImage:[UIImage imageNamed:@"yishengwdkhx"] forState:UIControlStateNormal];
    }

}

-(void)shoosebtnclick
{
    
    [_imagebtn setBackgroundImage:[UIImage imageNamed:@"yishengwdkhx"] forState:UIControlStateNormal];
    UITableView *projectandname;
    
    if (self.isproject == NO) {
        
        if (btnview) {
            [btnview removeFromSuperview];
            btnview = nil;
            self.isgroupes = NO;
        }
        shoosebtnview = [[UIView alloc] initWithFrame:CGRectMake( 8 , 110, 70, 91)];
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
        _tableview.userInteractionEnabled = NO;
        
    }else{
        
            [shoosebtnview removeFromSuperview];
            shoosebtnview = nil;
       
        
        [projectandname removeFromSuperview];
        projectandname = nil;
        
        self.isproject = NO;
        _tableview.userInteractionEnabled = YES;
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


-(void)comeback
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
        if (self.IsServiced == YES) {
//            return _headnamearray.count + 1;
            return 2;
        }else{
            NSLog(@"numberOfSectionsInTableView--_headnamearray.count:%ld",_headnamearray.count);
        //return _headnamearray.count;
            return 1;
        }
        
    }else if (tableView.tag == 62){
     return 1;
    }else{
        return 1;
    }
    
   
    
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView.tag == 60) {

        if (self.IsServiced == YES) {
            
            if (section == 0) {
                return 1;
            }else{
//                 NSMutableArray *ary1 = [_allgroup objectAtIndex:section - 1];
//                return ary1.count;
              return _allgroup.count;
            }
            
            
        }else{
//            
//            NSLog(@"self.IsServiced == NO B %ld",_allgroup.count);
//            
//              NSMutableArray *ary1 = [_allgroup objectAtIndex:section];
//            return ary1.count;
            return _allgroup.count;
        }
        
        
    }else if (tableView.tag == 62){
        NSLog(@"_groups.count------3-:%ld",_groups.count);
        return _groups.count;
    }else {
        
        return 2;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    if (tableView.tag == 60 && self.AllowRefresh == YES) {
        
        
        static NSString *identifier = @"cell";
        
        myClientCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[myClientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 8;

        
        cell.headimage.frame = CGRectMake(0, 0, 0, 0);
        cell.headimage.image = [UIImage imageNamed:@""];
        
        cell.name.frame = CGRectMake(0, 0, 0, 0);
        cell.name.text = @" ";
        
        cell.project1.frame = CGRectMake(0, 0, 0, 0);
        cell.project1.backgroundColor = [UIColor whiteColor];
        cell.project1.text = @"";
        
        cell.project2.frame = CGRectMake(0, 0, 0, 0);
        cell.project2.backgroundColor = [UIColor redColor];
        cell.project2.text = @"";
        

        

        if (self.IsServiced == YES) {
            if (indexPath.section == 0) {
                
                cell.headimage.frame = CGRectMake(15, 9, 50, 50);
                cell.headimage.image = [UIImage imageNamed:@"图片4"];
                
                cell.name.frame = CGRectMake(80, 25, 100, 20);
                //cell.name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                cell.name.font = [UIFont systemFontOfSize:14];
                cell.name.text = @"患者分组";
                cell.name.textColor = [self colorWithRGB:0x00c5bb alpha:1];
                
            }else{
                
                //NSMutableArray *mycustomary = [_allgroup objectAtIndex:indexPath.section - 1];
                //mycustomerdata *customer = [mycustomary objectAtIndex:indexPath.row];
                mycustomerdata *customer = [_allgroup objectAtIndex:indexPath.row];
                
                NSArray *proudctorary = [customer.buyproductnames componentsSeparatedByString:@","];
                NSLog(@"项目-----%@",proudctorary);
                
                cell.headimage.frame = CGRectMake(15, 9, 50, 50);
                [cell.headimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HTTPREQUESTPDOMAIN,customer.picsrc]] placeholderImage:[UIImage imageNamed:@"图片4"]];
                cell.headimage.layer.masksToBounds = YES;
                cell.headimage.layer.cornerRadius = 25;
                
                cell.name.frame = CGRectMake(80, 9, self.view.bounds.size.width - 100, 20);
                cell.name.font = [UIFont systemFontOfSize:14];
                cell.name.text = [NSString stringWithFormat:@" %@",customer.truename];
                cell.name.textColor = [self colorWithRGB:0x666666 alpha:1];
                
                if (proudctorary.count == 1) {
                    cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                    
                    cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                    cell.project1.font = [UIFont systemFontOfSize:11];
                    cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project1.layer.masksToBounds = YES;
                    cell.project1.layer.cornerRadius = 3;
                    if (cell.project1.text.length > 4) {
                        cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    }else{
                        cell.project1.backgroundColor = [UIColor whiteColor];
                    }
                    
                }else if (proudctorary.count == 2){
                    cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                    cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                    
                    cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                    cell.project1.font = [UIFont systemFontOfSize:11];
                    cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project1.layer.masksToBounds = YES;
                    cell.project1.layer.cornerRadius = 3;
                    
                    cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                    cell.project2.font = [UIFont systemFontOfSize:11];
                    cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project2.layer.masksToBounds = YES;
                    cell.project2.layer.cornerRadius = 3;
                    
                }else if (proudctorary.count == 3){
                    cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                    cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                    
                    cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                    cell.project1.font = [UIFont systemFontOfSize:11];
                    cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project1.layer.masksToBounds = YES;
                    cell.project1.layer.cornerRadius = 3;
                    
                    cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                    cell.project2.font = [UIFont systemFontOfSize:11];
                    cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project2.layer.masksToBounds = YES;
                    cell.project2.layer.cornerRadius = 3;
                    

                    
                }else if (proudctorary.count > 3){
                    cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                    cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                    
                    cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                    cell.project1.font = [UIFont systemFontOfSize:11];
                    cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project1.layer.masksToBounds = YES;
                    cell.project1.layer.cornerRadius = 3;
                    
                    cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                    cell.project2.font = [UIFont systemFontOfSize:11];
                    cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                    cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                    cell.project2.layer.masksToBounds = YES;
                    cell.project2.layer.cornerRadius = 3;
                    

                }

            }
 
        }else{
            
            NSLog(@"cellForRowAtIndexPath");
            

            
//            NSMutableArray *mycustomary = [_allgroup objectAtIndex:indexPath.section];
//            mycustomerdata *customer = [mycustomary objectAtIndex:indexPath.row];

            mycustomerdata *customer = [_allgroup objectAtIndex:indexPath.row];
            
            NSArray *proudctorary = [customer.buyproductnames componentsSeparatedByString:@","];
             NSLog(@"项目-----%@",proudctorary);
            
                cell.headimage.frame = CGRectMake(15, 9, 50, 50);
                //cell.headimage.image = [UIImage imageNamed:@"图片4"];
            [cell.headimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HTTPREQUESTPDOMAIN,customer.picsrc]] placeholderImage:[UIImage imageNamed:@"图片4"]];
            cell.headimage.layer.masksToBounds = YES;
            cell.headimage.layer.cornerRadius = 25;
            
                cell.name.frame = CGRectMake(80, 9, self.view.bounds.size.width - 100, 20);
                cell.name.font = [UIFont systemFontOfSize:14];
                cell.name.text = [NSString stringWithFormat:@" %@",customer.truename];
                cell.name.textColor = [self colorWithRGB:0x666666 alpha:1];
                
            if (proudctorary.count == 1) {
                cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                cell.project1.font = [UIFont systemFontOfSize:11];
                cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project1.layer.masksToBounds = YES;
                cell.project1.layer.cornerRadius = 3;
                if (cell.project1.text.length > 4) {
                cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                }else{
                cell.project1.backgroundColor = [UIColor whiteColor];
                }
                
            }else if (proudctorary.count == 2){
                cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                
                cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                cell.project1.font = [UIFont systemFontOfSize:11];
                cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project1.layer.masksToBounds = YES;
                cell.project1.layer.cornerRadius = 3;
                
                cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                cell.project2.font = [UIFont systemFontOfSize:11];
                cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project2.layer.masksToBounds = YES;
                cell.project2.layer.cornerRadius = 3;
                
            }else if (proudctorary.count == 3){
                cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                
                cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                cell.project1.font = [UIFont systemFontOfSize:11];
                cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project1.layer.masksToBounds = YES;
                cell.project1.layer.cornerRadius = 3;
                
                cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                cell.project2.font = [UIFont systemFontOfSize:11];
                cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project2.layer.masksToBounds = YES;
                cell.project2.layer.cornerRadius = 3;
                

                
            }else if (proudctorary.count > 3){
                cell.project1.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:0]];
                cell.project2.text = [NSString stringWithFormat:@"  %@",[proudctorary objectAtIndex:1]];
                
                cell.project1.frame = CGRectMake(80, 39, [self NSStringwithsize:11 str:cell.project1.text] + 10, 21);
                cell.project1.font = [UIFont systemFontOfSize:11];
                cell.project1.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project1.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project1.layer.masksToBounds = YES;
                cell.project1.layer.cornerRadius = 3;
                
                cell.project2.frame = CGRectMake(cell.project1.frame.origin.x + [self NSStringwithsize:11 str:cell.project1.text] + 15, 39, [self NSStringwithsize:11 str:cell.project2.text] + 10, 21);
                cell.project2.font = [UIFont systemFontOfSize:11];
                cell.project2.backgroundColor = [self colorWithRGB:0x80e2dd alpha:1];
                cell.project2.textColor = [self colorWithRGB:0xffffff alpha:1];
                cell.project2.layer.masksToBounds = YES;
                cell.project2.layer.cornerRadius = 3;
                

            }
            
            
        }
        
       
        return cell;
        

    }else if (tableView.tag == 62){
        NSLog(@"_groups.count--- 4 ---%ld",_groups.count);
        NSLog(@"indexPath.row-%ld-----_numberofmanber.count-%ld",indexPath.row,_numberofmanber.count);
        static NSString *ident = @"cell2";
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell2) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        if (indexPath.row < 1) {
            cell2.textLabel.text = [_groups objectAtIndex:indexPath.row];
        }else{
            NSString *str = [NSString stringWithFormat:@"%@     (%@)",[_groups objectAtIndex:indexPath.row],[_numberofmanber objectAtIndex:indexPath.row - 1]];
            cell2.textLabel.text = str;
        }
        
        
        cell2.textLabel.font = [UIFont systemFontOfSize:15];
        cell2.textLabel.textColor = [UIColor whiteColor];
        cell2.backgroundColor = [UIColor clearColor];
        
        if (self.didselector == indexPath.row) {
            cell2.textLabel.textColor = [self colorWithRGB:0x00c5bb alpha:1];
        }else{
            cell2.textLabel.textColor = [UIColor whiteColor];
        }
        
        return cell2;
        
    }else {
    
        static NSString *ident = @"cell3";
        UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell3) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        NSLog(@"_shooesproject.count : %ld",_shooesproject.count);
        if (self.AllowRefresh == YES) {
            cell3.textLabel.text = [_shooesproject objectAtIndex:indexPath.row];
            cell3.textLabel.font = [UIFont systemFontOfSize:15];
            cell3.textLabel.textColor = [UIColor whiteColor];
            cell3.backgroundColor = [UIColor clearColor];
        }

        
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
        
        if (self.IsServiced == YES) {
            if (section == 0) {
                return nil;
            }else{
                UILabel *titlelable = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, 50, 20)];
                titlelable.text = [_headnamearray objectAtIndex:section  - 1];
                titlelable.font = [UIFont systemFontOfSize:13];
                titlelable.textColor = [self colorWithRGB:0x666666 alpha:1];
                [view addSubview:titlelable];
            }
        }else{
            NSLog(@"--开始-viewForHeaderInSection---_headnamearray--%ld--section:-%ld",_headnamearray.count,section);
            UILabel *titlelable = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, 50, 20)];
            titlelable.text = [_headnamearray objectAtIndex:section];
            titlelable.font = [UIFont systemFontOfSize:13];
            titlelable.textColor = [self colorWithRGB:0x666666 alpha:1];
            [view addSubview:titlelable];
        }

         return view;
        
    }else{
        
    return nil;
    }
    


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView.tag == 60) {
        
        if (self.IsServiced == YES) {
            if (indexPath.section == 0) {
                myclientmainsetgropViewController *myclient = [[myclientmainsetgropViewController alloc] init];
                myclient.doctorsno = self.doctorsno;
                [self.navigationController pushViewController:myclient animated:YES];
            }else{
               // NSMutableArray *mycustomary = [_allgroup objectAtIndex:indexPath.section - 1];
                mycustomerdata *customer = [_allgroup objectAtIndex:indexPath.row];
                
                myclientdatasViewController *myclient = [[myclientdatasViewController alloc] init];
                myclient.customerSno = customer.sno;
                myclient.doctorsno = self.doctorsno;
                [self.navigationController pushViewController:myclient animated:YES];
              }
        }else{
           // NSMutableArray *mycustomary = [_allgroup objectAtIndex:indexPath.section];
            mycustomerdata *customer = [_allgroup objectAtIndex:indexPath.row];
            
            myclientdatasViewController *myclient = [[myclientdatasViewController alloc] init];
            myclient.customerSno = customer.sno;
            myclient.doctorsno = self.doctorsno;
            [self.navigationController pushViewController:myclient animated:YES];
        }
        
        self.isproject = YES;
        [self shoosebtnclick];

        }else if (tableView.tag == 62){
            
            self.AllowRefresh = NO;
            self.didselector = indexPath.row;
            
        if (indexPath.row != 0) {
            self.IsServiced = NO;
            [_groupbtn setTitle:[_groups objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            _groupbtn.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]]/2 + 10), _groupbtn.frame.origin.y, [self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]] + 20, _groupbtn.frame.size.height);
            self.group = [_groupIDarray objectAtIndex:indexPath.row];
            
            _imagebtn.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
            
            [self groupsbuttonclick];
            [self startrequest];
            
            _tableview.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
            
        }else{
           self.IsServiced = YES;
            
            [_groupbtn setTitle:[_groups objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            _groupbtn.frame = CGRectMake(self.view.bounds.size.width/2 - ([self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]]/2 + 10), _groupbtn.frame.origin.y, [self NSStringwithsize:17 str:[_groups objectAtIndex:indexPath.row]] + 20, _groupbtn.frame.size.height);
            self.group = [_groupIDarray objectAtIndex:indexPath.row];
            
            _imagebtn.frame = CGRectMake(_groupbtn.frame.origin.x + _groupbtn.frame.size.width, 32, 15, 10);
            
            [self groupsbuttonclick];
            [self startrequest];
            
            
        }
        self.group = [_groupIDarray objectAtIndex:indexPath.row];
        
    }else {
       
        NSString *str = [NSString stringWithFormat:@"%ld",indexPath.row];
        
        if ([str isEqualToString:@"0"]) {
            self.typeInfo = @"name";
            [_shoosebtn setTitle:@"姓名" forState:UIControlStateNormal];
        }else{
            [_shoosebtn setTitle:@"项目" forState:UIControlStateNormal];
            self.typeInfo = @"product";
        }
        
         [self shoosebtnclick];

    }

}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 62 || tableView.tag == 63) {
        return 43;
    }else {
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
        _tableview.sectionIndexBackgroundColor = [UIColor clearColor];//设置索引背景颜色
        _tableview.sectionIndexColor = [self colorWithRGB:0x666666 alpha:1];//设置字体颜色
        return _headnamearray;
    }else{
        return nil;
    }

}

// UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的页眉
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection
                      :(NSInteger)section
{
    if (self.IsServiced == YES) {
        if (section == 0) {
            return nil;
        }else{
            return [_headnamearray objectAtIndex:section];
        }
    }else{
        return [_headnamearray objectAtIndex:section - 1];
    }
    
}
////搜索得到的数据
//-(void)searchdata{
//
//    
//    NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=%@&toPage=1&Count_per_Page=15&querytype=%@&condition=%@",HTTPREQUESTPDOMAIN,self.doctorsno,self.group,self.typeInfo,self.searchcontents];
//    
//        NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                                                         (CFStringRef)string,
//                                                                                                         NULL,
//                                                                                                         NULL,
//                                                                                                         kCFStringEncodingUTF8));
//    
//    NSLog(@"客户数据搜索--%@",string);
////    [self requstwithurl:string];
//    
//    [AFHTTPRequestOpeartionManagerOfme postmanberplistandurl:encodedString withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
//        
//        _headnamearray = array1;
//        _allgroup = array2;
//        
//        self.AllowRefresh = YES;
//        [self creattableview];
//    }];
//
//}

-(void)startrequest
{
    NSLog(@"开始startrequest");
    NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=%@&toPage=1&Count_per_Page=15",HTTPREQUESTPDOMAIN,self.doctorsno,self.group];
    
    NSLog(@"获取客户列表，及排列的名单，接口和参数-：%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postmanberplistandurl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        [_allgroup removeAllObjects];
        _headnamearray = array1;
        _allgroup = array2;
        


        NSLog(@"_headnamearray : %@------_allgroup-%@",_headnamearray,_allgroup);
        

        self.AllowRefresh = YES;
        [self creattableview];
        
    }];
    NSLog(@"结束startrequest");
}


//页面数据
//-(void)startrequest
//{
//    
//    NSString *string = [NSString stringWithFormat:@"%@/doctor.customerlist.go?docsno=%@&group=%@&toPage=1&Count_per_Page=15",HTTPREQUESTPDOMAIN,self.doctorsno,self.group];
//    
//    NSLog(@"startrequest");
//    [self requstwithurl:string];
//    
//}

#pragma mark  request

//-(void)requstwithurl:(NSString *)str
//{
//    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                                                     (CFStringRef)str,
//                                                                                                     NULL,
//                                                                                                     NULL,
//                                                                                                     kCFStringEncodingUTF8));
//    
//    NSURL *urlstr = [NSURL URLWithString:encodedString];
//    
//    NSURLRequest *requst = [NSURLRequest requestWithURL:urlstr];
//    
//    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requst delegate:self];
//    
//    [connection start];
//    
//    
//}
//
//#pragma mark  requestdelegate
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"请求失败");
//}
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"收到响应");
//    
//    [_data setData:[NSData data]];
//}
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSLog(@"请求数据接收");
//    [_data appendData:data];
//    
//}
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    
////     NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
////    
////    NSLog(@"str------》%@",str);
//    
//    //JSON解析器
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:nil];
//    
//   // NSLog(@"000000------------%@",dic);
//    
//    NSString *state = [dic objectForKey:@"state"];
//    
//    NSString *msg = [dic objectForKey:@"msg"];
//    
//    
//        [_mycustomerDataarray removeAllObjects];
//    
//    NSLog(@"connectionDidFinishLoading");
//    NSDictionary *customerData = [dic objectForKey:@"Content"];
//    NSMutableArray *dataary = [customerData objectForKey:@"data"];
//    
//    
//     _headnamearray = [[NSMutableArray alloc] initWithCapacity:0];//表格右边的索引
//    NSString *stra;
//    for (NSDictionary *mycusdiction in dataary) {
//        mycustomerdata *mycustom = [mycustomerdata mycustomerdataWithdiction:mycusdiction];
//            if (![stra isEqualToString:mycustom.firstsearchword]) {
//                 [_headnamearray addObject:mycustom.firstsearchword];
//            }
//        stra = mycustom.firstsearchword;
//        [_mycustomerDataarray addObject:mycustom];
//        }
//    
//    
//    [_allgroup removeAllObjects];
//    _allgroup = [[NSMutableArray alloc] initWithCapacity:0];//每一个区的数据
//        for (NSString *str in _headnamearray) {
//             NSMutableArray *indexary = [[NSMutableArray alloc] initWithCapacity:0];
//            for (mycustomerdata *mydata in _mycustomerDataarray) {
//                if ([mydata.firstsearchword isEqualToString:str]) {
//                    [indexary addObject:mydata];
//                }
//            }
//           [_allgroup addObject:indexary];
//        }
//    
//    
//    if ([state isEqualToString:@"0"]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alert show];
//    }
//    
//    [self creattableview];
//    
//}
//

@end
