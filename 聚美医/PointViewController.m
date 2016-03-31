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
#import "NSString+JSON.h"
#import "ZipArchive.h"
#import "HtmlChatViewController.h"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#define PATH_UPDATE_WWW   [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/www/index.html"]


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
    titilelable.text = @"美币商城";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];

    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacka) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];

//    self.mytableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
//    self.mytableview.delegate = self;
//    self.mytableview.dataSource = self;
//    [self.view addSubview:self.mytableview];
//    
//    
//    NSString *string = [NSString stringWithFormat:@"%@/doctor.mypoints.go?doctorsno=%@&toPage=1&Count_per_Page=10",HTTPREQUESTPDOMAIN,self.doctorsno];
//    NSLog(@"URL------%@-----",string);
//    
//    [wodejifen getTheDataWithULR:string AndBlock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
//        self.mypointsary = array1;
//        self.points = string;
//        
//        [self.mytableview reloadData];
//    }];
//    
//    
    
    NSString *urlstr = [NSString stringWithFormat:@"%@/HTML/Weixin/jumi_store.html?drsno=%@&environment=2",HTTPREQUESTPDOMAIN,self.doctorsno];

    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width , self.view.bounds.size.height - 64)];
    webview.delegate = self;
    [self.view addSubview:webview];
    NSURLRequest * req=[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
    [webview loadRequest:req];
    
    
//    HtmlChatViewController *mywebview = [HtmlChatViewController new] ;
//    mywebview.wwwFolderName = @"www";
//    mywebview.startPage = [NSString stringWithFormat:@"file://%@?drsno=%@",PATH_UPDATE_WWW,self.doctorsno];
//    mywebview.webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    [self.view addSubview:mywebview.view];
//    
//    
//    _data = [[NSMutableData alloc] initWithCapacity:0];
//    
//    NSString *urlstr2 = [NSString stringWithFormat:@"http://10.5.2.100:40082/appfile/version.json"];
//    
//    NSLog(@"下载的网站-----%@",urlstr2);
//    
//    [self requstwithurl:urlstr2];
//    
//    [self dataPath:@"3www"];
//    
//    
//    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
//    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
//
//    NSString *FileName=[ourDocumentPath stringByAppendingPathComponent:@"Documentswww"];//fileName就是保存文件的文件名
//    
//    NSData *datas=[NSData dataWithContentsOfFile:FileName options:0 error:NULL];
//    NSString *str1 = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
////    NSLog(@"datas2##:%@",str1);
//    
//    
//    
//    NSData *da= [str1 dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error = nil;
//     NSDictionary *dictionnary = [NSJSONSerialization JSONObjectWithData:da options:NSJSONReadingAllowFragments error:&error];
//    NSLog(@"本地转化的JSON-%@",dictionnary);
//
//    NSString *sandboxPath = NSHomeDirectory();
//    NSLog(@"沙盒路径：%@",sandboxPath);
//
////    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingAllowFragments error:nil];
////    NSDictionary *dictin = [NSString parseJSONStringToNSDictionary:str1];
////    NSLog(@"dictin:%@",dic);
//    
//    
//    [AFHTTPRequestOpeartionManagerOfme getvs:urlstr2 withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
//        
//    }];
//    
//#pragma mark //解压
//    
//    documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
//    NSString *myicon =[documentPaths objectAtIndex:0];
//    NSString *zipPath = [myicon stringByAppendingPathComponent:@"我的多级菜单.zip"];
//    
//    ZipArchive *za = [[ZipArchive alloc] init];
//    if ([za UnzipOpenFile: zipPath]) {
//        BOOL ret = [za UnzipFileTo: myicon overWrite: YES];
//        if (NO == ret){} [za UnzipCloseFile];
//        
//        NSString *imageFilePath = [myicon stringByAppendingPathComponent:@"wogai.png"];
//        NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath options:0 error:nil];
//        UIImage *img = [UIImage imageWithData:imageData];
//        
////        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
////        image.image = img;
////        [self.view addSubview:image];
//    }

    
}

- (NSString *)dataPath:(NSString *)file{
    
    NSString *mafilename = [[NSBundle mainBundle] pathForResource:@"Feedback" ofType:@"html"];
    
    NSString *path = [[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"myfile"] stringByAppendingPathComponent:@"www"];
    BOOL bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSAssert(bo,@"创建目录失败");
    
    NSData *data = [mafilename dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:path atomically:YES];
    
    NSString *result = [path stringByAppendingPathComponent:file];
    
    return result;
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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


-(void)requstwithurl:(NSString *)str
{
    NSURL *urlstr = [NSURL URLWithString:str];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:urlstr];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:requst delegate:self];
    
    [connection start];
    
    
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求失败");
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
//    NSLog(@"收到响应--%@",response);
    
    [_data setData:[NSData data]];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"请求数据接收");
    [_data appendData:data];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    //NSLog(@"----%@",str);
    
    
    NSString *str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
//
//    NSLog(@"下载的东西：%@--str:%@",_data,str);
//    
//
    NSDictionary *dict = [NSString parseJSONStringToNSDictionary:str];
    NSString *aabb = [dict objectForKey:@"publishdt"];
     NSLog(@"string-aabb:%@",aabb);
//
//    //JSON解析器
//     NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
//   
//    NSString *string = [dic objectForKey:@"serverrootpath"];
//    NSLog(@"从字典取出的东西serverrootpath : %@ ",dic);
    
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    
    
    NSString *FileName=[ourDocumentPath stringByAppendingPathComponent:@"Documentswww"] ;//fileName就是保存文件的文件名
    
    NSLog(@"保存自己创建的的文件：Documentswww:%@",FileName);
    
    [_data writeToFile:FileName atomically:YES];
    
    NSData *datas=[NSData dataWithContentsOfFile:FileName options:0 error:NULL];
    NSString *str1 = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
    NSLog(@"datas:%@",str1);
    
    
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *createPath = [NSString stringWithFormat:@"%@/Image/1456/AA", pathDocuments];
    NSString *createDir = [NSString stringWithFormat:@"%@/MessageQueueImage/123/多级", pathDocuments];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
    
}

@end
