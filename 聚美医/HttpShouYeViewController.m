//
//  HttpShouYeViewController.m
//  聚美医
//
//  Created by fenghuang on 16/3/2.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import "HttpShouYeViewController.h"
#import "myCDVViewController.h"

@interface HttpShouYeViewController ()

@end

@implementation HttpShouYeViewController

- (id)init
{
    /** If you need to do any extra app-specific initialization, you can do it here
     *  -jm
     **/
    NSHTTPCookieStorage* cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    [cookieStorage setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    int cacheSizeMemory = 8 * 1024 * 1024; // 8MB
    int cacheSizeDisk = 32 * 1024 * 1024; // 32MB
#if __has_feature(objc_arc)
    NSURLCache* sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"];
#else
    NSURLCache* sharedCache = [[[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"] autorelease];
#endif
    [NSURLCache setSharedURLCache:sharedCache];
    
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
//    UIWebView *mywebview = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    mywebview.frame = CGRectMake(0, 200, self.view.bounds.size.width,self.view.bounds.size.height - 200);
//    mywebview.backgroundColor = [UIColor redColor];
//    [self.view addSubview:mywebview];
    
//    myCDVViewController *mycdview = [[myCDVViewController alloc] init];
//    mycdview.wwwFolderName=@"www";
//    mycdview.startPage = @"register.html";
//    [mywebview addSubview:mycdview.view];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // View defaults to full size. If you want to customize the view's size, or its subviews (e.g. webView),
    // you can do so here.
    //Lower screen 20px on ios 7
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
       // CGRect viewBounds = [self.webView bounds];
        
        CGRect viewBounds = self.view.bounds;
        viewBounds.origin.y = -20;
        viewBounds.size.height = self.view.bounds.size.height + 20;//viewBounds.size.height +40;
//        self.webView.superview.frame = CGRectMake(0,110, self.view.bounds.size.width, self.view.bounds.size.height + 20);
        self.webView.frame = CGRectMake(0,-20, self.view.bounds.size.width, self.view.bounds.size.height + 20);
        

        NSLog(@"self.webView.bounds.size.height:%f",self.webView.bounds.size.height);
        
        NSLog(@"self.view.bounds.size.height:%f",self.view.bounds.size.height);
        
    }
    
//    CGRect viewBounds = self.view.bounds;
//    viewBounds.origin.y = 200;
//    viewBounds.size.height = viewBounds.size.height - 200;
    
    [super viewWillAppear:animated];
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    
//    return UIStatusBarStyleLightContent;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
