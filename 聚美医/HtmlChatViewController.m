//
//  HtmlChatViewController.m
//  聚美医
//
//  Created by fenghuang on 16/3/1.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import "HtmlChatViewController.h"

#import "cordova/CDVViewController.h"

@interface HtmlChatViewController ()

@end

@implementation HtmlChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CDVViewController *html = [CDVViewController new] ;
//    html.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 104);
//    html.wwwFolderName=@"www";
//    html.startPage = @"message.html";
//    [self.view addSubview:html.view];

 
    NSLog(@"先不确定、%F",self.view.superview.frame.size.height);
//    self.view.superview.frame.size.height
    
    
//     self.automaticallyAdjustsScrollViewInsets = NO;//取消状态栏,目前只取消底色
    
    // Do any additional setup after loading the view.
    
    
    NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
    //[userdf objectForKey:@"customerSno"];//这个实际上医生的索引

    
    self.wwwFolderName = @"www";
    self.startPage = [NSString stringWithFormat:@"message-list.html?drsno=%@",[userdf objectForKey:@"customerSno"]];
    NSLog(@"HtmlChatViewController页面-drsno:%@-------html.startPage=%@",[userdf objectForKey:@"customerSno"],self.startPage);
    
    self.webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height );

    
}

-(void)viewWillAppear:(BOOL)animated{
    

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
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

@end
