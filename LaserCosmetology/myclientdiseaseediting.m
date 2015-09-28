//
//  myclientdiseaseediting.m
//  聚美医
//
//  Created by fenghuang on 15/9/1.
//  Copyright (c) 2015年 huqijing. All rights reserved.
//

#import "myclientdiseaseediting.h"
#import "TopBarView.h"
#import "pickerimageViewController.h"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "PrefixHeader.pch"
#import "UIButton+WebCache.h"

@interface myclientdiseaseediting ()

@end

@implementation myclientdiseaseediting

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"病历编辑";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaazz) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(saverediting) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:save];
    
    _editingview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height/2 - 44)];
    _editingview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_editingview];
    
    NSLog(@"self.content,self.imagelist=%@=%@",self.content,self.imagelist);
    
    _mytextview = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160)];
    _mytextview.backgroundColor = [UIColor whiteColor];
    _mytextview.textColor = [self colorWithRGB:0x999999 alpha:1];
    _mytextview.font = [UIFont systemFontOfSize:15];
    _mytextview.text = @"点击编辑文字（不可空）";
    [_editingview addSubview:_mytextview];
    if (self.content.length > 2) {
         _mytextview.text = self.content;
    }
    
    float btnwidth = (self.view.bounds.size.width - (12 * 4))/3;
    
        float x = (12 + btnwidth) * 0 + 12;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 170, btnwidth, btnwidth)];
        [btn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(shooseimages) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 10;
        [_editingview addSubview:btn];
   
    
    _imagearry = [[NSMutableArray alloc] initWithCapacity:0];
    self.imagedataary = [[NSMutableArray alloc] initWithCapacity:0];
    self.imageURLary = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *imageurl = [self.imagelist componentsSeparatedByString:@","];
    for (NSString *str in imageurl) {
        if (str.length > 10) {
            [self.imageURLary addObject:str];
        }
    }

    [self getdatawithurl];
    
}
//获取单条病历
-(void)getdatawithurl
{
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getmedicalhistory.go?medicalhistorysno=%@",HTTPREQUESTPDOMAIN,self.medicalhistorysno];
    NSLog(@"保存编辑url=%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme posetgetAmedicalwithurl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        self.imageURLary = array1;
        _mytextview.text = string;
        
        [self addbutton];
    }];


}

//保存编辑
-(void)saverediting
{
    self.content = _mytextview.text;
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.savemedicalhistory.go?doctorsno=%@&medicalhistorysno=%@&content=%@",HTTPREQUESTPDOMAIN,self.doctorsno,self.medicalhistorysno,self.content];
    NSLog(@"保存编辑url=%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme postsEditingmedical:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        [self upImageData];
    }];

}

-(void)upImageData{

    NSDictionary *dic = [self.imageURLary objectAtIndex:0];
    NSString *str = [dic objectForKey:@"sno"];
    NSLog(@"sno=====%@",str);
    
        NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.savemedicalhistoryimage.go",HTTPREQUESTPDOMAIN];
    NSLog(@"保存编辑url=%@",urlstr);
    
    NSLog(@"urlstr==%@+self.medicalhistorysno==%@+self.medicalhistorysno==%@+self.medicalhistorysno==%@",urlstr,self.medicalhistorysno,self.doctorsno,str);
   
    [AFHTTPRequestOpeartionManagerOfme postModifyTheUserHeadRequestWitHUser:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno and:str and:[self.imagedataary objectAtIndex:0] Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
    }];
    
    //[self.navigationController popViewControllerAnimated:YES];
}

-(void)shooseimages{
    
    pickerimageViewController *picker = [[pickerimageViewController alloc] init];
    picker.delegate1 = self;
    [self.navigationController pushViewController:picker animated:YES];
}

-(void)sendimage:(UIImage *)imagess
{
        [_imagearry addObject:imagess];
    
        NSData *_data = UIImageJPEGRepresentation(imagess, 0.4f);
        NSString *_encodedImageStr = [_data base64Encoding];
    
    if (_encodedImageStr.length > 10) {
        [_addimagebtn removeFromSuperview];
        _addimagebtn = nil;
    }
    [self.imagedataary addObject:_data];
     [self addbutton];
    
    NSLog(@"_imagearry.count=%ld-----",_imagearry.count);
}

-(void)addbutton
{

    for (int c = 0; c < _imagearry.count; c++) {
        UIButton *btn = (UIButton *)[_editingview viewWithTag:10 + c];
        [btn removeFromSuperview];
    }
    
    float width = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht = width;
    
    for (int j = 0; j < [self.imageURLary count]; j ++) {
        NSDictionary *imageurdic = [self.imageURLary objectAtIndex:j];
        NSString *imageurl = [imageurdic objectForKey:@"url"];
        
        NSInteger xn = j % 3;
        NSInteger yn = j / 3;
        
        int x = (12 + width) * xn + 12;
        int y = (12 + heiht) * yn + 170;
        
        NSLog(@"x=%d",x);
        NSString *title = [NSString stringWithFormat:@"%d",j + 1];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,imageurl]] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = 10 + j;
       [button addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
        [_editingview addSubview:button];
    }
    
//    NSInteger a = self.imageURLary.count;
//    NSInteger b = _imagearry.count;
//    
//    if ([_imagearry count] + a > 3) {
//        b = 3 - a;
//    }
    
    for (int j = 0; j < _imagearry.count; j ++) {
        
        NSInteger xn = j % 3;
        NSInteger yn = j / 3;
        
    int x = (12 + width) * xn + 12;
        int y = (12 + heiht) * yn + 170;
        
        NSLog(@"x=%d",x);
        NSString *title = [NSString stringWithFormat:@"%d",j + 1];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        button.backgroundColor = [UIColor redColor];
        [button setBackgroundImage:[_imagearry objectAtIndex:j] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = 10 + j;
        [button addTarget:self action:@selector(cancelimageclick:) forControlEvents:UIControlEventTouchUpInside];
        [_editingview addSubview:button];
        
    }
//
//    NSInteger a1 = a + b;
//    NSInteger xn1 = a1 % 3;
//    NSInteger yn1 = a1 / 3;
//    
//    int x1 = (12 + width) * xn1 + 12;
//    int y1 = (12 + heiht) * yn1 + 170;
//    
//    if (_addimagebtn == nil && (a + b) < 3) {
//        _addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x1, y1, width , heiht)];
//        [_addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
//        [_addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
//        _addimagebtn.tag = 30;
//        [_editingview addSubview:_addimagebtn];
//    }
    
}

-(void)cancelimageclick:(UIButton *)btn{
    
//    NSLog(@"btn.tag-: %ld",btn.tag);
//    self.cancelbtnindex = btn.tag - 10;
//    
//    _imagebackview = [[UIView alloc] initWithFrame:self.view.bounds];
//    _imagebackview.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_imagebackview];
//    
//    UIImage *images = [_imagearry objectAtIndex:btn.tag - 10];
//    
//    NSLog(@"_imagearry .count : %ld---",_imagearry.count);
//    
//    UIButton *gobackbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 50, 50)];
//    [gobackbtn addTarget:self action:@selector(gobackbtnclick) forControlEvents:UIControlEventTouchUpInside];
//    [gobackbtn setBackgroundImage:[UIImage imageNamed:@"c"] forState:UIControlStateNormal];
//    [_imagebackview addSubview:gobackbtn];
//    
//    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 40, 38, 38)];
//    [cancel addTarget:self action:@selector(cancelclick) forControlEvents:UIControlEventTouchUpInside];
//    [cancel setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
//    [_imagebackview addSubview:cancel];
//    
//    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width,images.size.height/(images.size.width/self.view.bounds.size.width))];
//    imageview.image = images;
//    [_imagebackview addSubview:imageview];
    
}

-(void)gobackbtnclick{
    
    [_imagebackview removeFromSuperview];
}
-(void)cancelclick{
    
    [_imagebackview removeFromSuperview];
    [_imagearry removeObjectAtIndex:self.cancelbtnindex];
    
    [self addbutton];
}

-(void)imageshoosebtnclick
{
    [self shooseimages];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)comebacksaaazz
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
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
