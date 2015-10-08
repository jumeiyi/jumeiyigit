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
        self.addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x, 170, btnwidth, btnwidth)];
        [self.addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [self.addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
        self.addimagebtn.tag = 10;
        [_editingview addSubview:self.addimagebtn];
   
    
    _imagearry = [[NSMutableArray alloc] initWithCapacity:0];
    self.imagedataary = [[NSMutableArray alloc] initWithCapacity:0];
    self.imageURLary = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray *imageurl = [self.imagelist componentsSeparatedByString:@","];
    for (NSString *str in imageurl) {
        if (str.length > 10) {
            [self.imageURLary addObject:str];
        }
    }

    [self creatimagebtn];
    
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
        
         [self addimageTothebutton];
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
        
        [self changimage];
    }];

}

//新增图片
-(void)upImageData{


    
    
    NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.savemedicalhistoryimage.go",HTTPREQUESTPDOMAIN];
    
    for (int i = 0; i < _imagearry.count; i ++) {
        
        NSData *imagedata = UIImageJPEGRepresentation([_imagearry objectAtIndex:i], 0.4f);
        
        [AFHTTPRequestOpeartionManagerOfme postModifyTheUserHeadRequestWitHUser:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno and:imagedata Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
            
        }];
    }
    
    //[self.navigationController popViewControllerAnimated:YES];
}

//上传修改图片
-(void)changimage
{
    
    NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.savemedicalhistoryimage.go",HTTPREQUESTPDOMAIN];
    NSLog(@"保存编辑url=%@",urlstr);
    
    
    if (self.isimage1 == YES) {
       
        NSDictionary *dic = [self.imageURLary objectAtIndex:0];
        NSString *str = [dic objectForKey:@"sno"];
        NSLog(@"sno=====%@",str);
        
        NSData *imagedata = UIImageJPEGRepresentation(self.image, 0.4f);
        
        NSLog(@"端口：%@ || self.medicalhistorysno= %@||self.doctorsno= %@|| sno %@",urlstr,self.medicalhistorysno,self.doctorsno,str);
        [AFHTTPRequestOpeartionManagerOfme posetUpdatatheChangeImage:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno medicalhistoryimagesno:str and:imagedata Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
        }];

    }
    
    if (self.isimage2 == YES) {
       
        NSDictionary *dic = [self.imageURLary objectAtIndex:1];
        NSString *str = [dic objectForKey:@"sno"];
        NSLog(@"sno=====%@",str);
        
        NSData *imagedata = UIImageJPEGRepresentation(self.image2, 0.4f);
        
        NSLog(@"端口：%@ || self.medicalhistorysno= %@||self.doctorsno= %@|| sno %@",urlstr,self.medicalhistorysno,self.doctorsno,str);
        [AFHTTPRequestOpeartionManagerOfme posetUpdatatheChangeImage:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno medicalhistoryimagesno:str and:imagedata Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
        }];

    }
    
    if (self.isimage3 == YES) {
      
        NSDictionary *dic = [self.imageURLary objectAtIndex:2];
        NSString *str = [dic objectForKey:@"sno"];
        NSLog(@"sno=====%@",str);
        
        NSData *imagedata = UIImageJPEGRepresentation(self.image3, 0.4f);
        
        NSLog(@"端口：%@ || self.medicalhistorysno= %@||self.doctorsno= %@|| sno %@",urlstr,self.medicalhistorysno,self.doctorsno,str);
        [AFHTTPRequestOpeartionManagerOfme posetUpdatatheChangeImage:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno medicalhistoryimagesno:str and:imagedata Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
        }];
    }
    


    
}


-(void)shooseimages{
    
    pickerimageViewController *picker = [[pickerimageViewController alloc] init];
    picker.delegate1 = self;
    [self.navigationController pushViewController:picker animated:YES];
}

-(void)sendimage:(UIImage *)imagess
{
    if (self.shoosebuttonindex == 0) {
         [_imagearry addObject:imagess];
    }
    
    
    if (self.shoosebuttonindex == 10) {
        self.image = imagess;
        self.isimage1 = YES;
    }
    
    if (self.shoosebuttonindex == 11) {
        self.image2 = imagess;
        self.isimage2 = YES;
    }
    
    if (self.shoosebuttonindex == 12) {
        self.image3 = imagess;
        self.isimage3 = YES;
    }
    
        NSData *_data = UIImageJPEGRepresentation(imagess, 0.4f);
        NSString *_encodedImageStr = [_data base64Encoding];
    
    if (_encodedImageStr.length > 10) {
        [_addimagebtn removeFromSuperview];
        _addimagebtn = nil;
    }
    [self.imagedataary addObject:_data];
    
    [self addimageTothebutton];
    
    NSLog(@"_imagearry.count=%ld-----",_imagearry.count);
}
-(void)creatimagebtn
{
    
    float width = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht = width;
    NSInteger xn = 0 % 3;
    NSInteger yn = 0 / 3;
    
    int x = (12 + width) * xn + 12;
    int y = (12 + heiht) * yn + 170;
    
    self.imagebtn1 = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
    self.imagebtn1.tag = 10;
    [self.imagebtn1 addTarget:self action:@selector(imageshoosebtnclicks:) forControlEvents:UIControlEventTouchUpInside];
    self.imagebtn1.backgroundColor = [UIColor clearColor];
    self.imagebtn1.userInteractionEnabled = NO;
    [_editingview addSubview:self.imagebtn1];
    

    float width2 = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht2 = width2;
    NSInteger xn2 = 1 % 3;
    NSInteger yn2 = 1 / 3;
    
    int x2 = (12 + width2) * xn2 + 12;
    int y2 = (12 + heiht2) * yn2 + 170;
    
    self.imagebtn2 = [[UIButton alloc] initWithFrame:CGRectMake(x2, y2, width2, heiht2)];
    self.imagebtn2.tag = 11;
    [self.imagebtn2 addTarget:self action:@selector(imageshoosebtnclicks:) forControlEvents:UIControlEventTouchUpInside];
    self.imagebtn2.backgroundColor = [UIColor clearColor];
    self.imagebtn2.userInteractionEnabled = NO;
    [_editingview addSubview:self.imagebtn2];
    
    
    float width3 = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht3 = width3;
    NSInteger xn3 = 2 % 3;
    NSInteger yn3 = 2 / 3;
    
    int x3 = (12 + width3) * xn3 + 12;
    int y3 = (12 + heiht3) * yn3 + 170;
    
    self.imagebtn3 = [[UIButton alloc] initWithFrame:CGRectMake(x3, y3, width3, heiht3)];
    self.imagebtn3.tag = 12;
    [self.imagebtn3 addTarget:self action:@selector(imageshoosebtnclicks:) forControlEvents:UIControlEventTouchUpInside];
    self.imagebtn3.backgroundColor = [UIColor clearColor];
    self.imagebtn3.userInteractionEnabled = NO;
    [_editingview addSubview:self.imagebtn3];
    
    
}
-(void)addimageTothebutton
{
    NSLog(@"self.imageURLary.count--%ld",self.imageURLary.count);
    
    if (self.imageURLary.count > 0) {
        NSDictionary *imageurdic = [self.imageURLary objectAtIndex:0];
        NSString *imageurl = [imageurdic objectForKey:@"url"];
        [self.imagebtn1 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,imageurl]] forState:UIControlStateNormal];
        self.imagebtn1.userInteractionEnabled = YES;
        
    }
    
    if (self.imageURLary.count > 1) {
    
        NSDictionary *imageurdic = [self.imageURLary objectAtIndex:1];
        NSString *imageurl = [imageurdic objectForKey:@"url"];
        [self.imagebtn2 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,imageurl]] forState:UIControlStateNormal];
        self.imagebtn2.userInteractionEnabled = YES;
        
    }
    
    if (self.imageURLary.count > 2){
        NSDictionary *imageurdic = [self.imageURLary objectAtIndex:2];
        NSString *imageurl = [imageurdic objectForKey:@"url"];
        [self.imagebtn2 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,imageurl]] forState:UIControlStateNormal];
        self.imagebtn2.userInteractionEnabled = YES;
    
    }
    
    
    
    float width0 = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht0 = width0;
    
    NSInteger aa = self.imageURLary.count;
    NSInteger bb = _imagearry.count;
    
    if (_imagearry.count > 0) {
        for (NSInteger i = aa; i < (aa + bb); i ++) {
            
            NSInteger xn1 = i % 3;
            NSInteger yn1 = i / 3;
            int x1 = (12 + width0) * xn1 + 12;
            int y1 = (12 + heiht0) * yn1 + 170;
            
            UIButton *imagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x1, y1, width0, heiht0)];
            imagebtn.backgroundColor = [UIColor brownColor];
            [imagebtn setBackgroundImage:[_imagearry objectAtIndex:i - aa] forState:UIControlStateNormal];
            [_editingview addSubview:imagebtn];

        }
        
        NSInteger xn2 = (aa + bb) % 3;
        NSInteger yn2 = (aa + bb) / 3;
        int x2 = (12 + width0) * xn2 + 12;
        int y2 = (12 + heiht0) * yn2 + 170;
        
        if ((aa + bb) < 3) {
            [self.addimagebtn removeFromSuperview];
            self.addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x2, y2, width0, heiht0)];
            [self.addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
            [self.addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
            self.addimagebtn.tag = 10;
            [_editingview addSubview:self.addimagebtn];

        }

        
    }else{
    
        NSInteger xn = self.imageURLary.count % 3;
        NSInteger yn = self.imageURLary.count / 3;
        int x = (12 + width0) * xn + 12;
        int y = (12 + heiht0) * yn + 170;
        
        [self.addimagebtn removeFromSuperview];
        self.addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width0, heiht0)];
        [self.addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [self.addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
        self.addimagebtn.tag = 10;
        [_editingview addSubview:self.addimagebtn];
    
    }
    
    
    if (self.shoosebuttonindex == 10) {
        [self.imagebtn1 setBackgroundImage:self.image forState:UIControlStateNormal];
        self.imagebtn1.userInteractionEnabled = YES;
    }

    
    if (self.shoosebuttonindex == 11) {
        [self.imagebtn2 setBackgroundImage:self.image2 forState:UIControlStateNormal];
        self.imagebtn2.userInteractionEnabled = YES;
    }
    
    if (self.shoosebuttonindex == 12) {
        [self.imagebtn3 setBackgroundImage:self.image3 forState:UIControlStateNormal];
        self.imagebtn3.userInteractionEnabled = YES;
    }
    

    
    
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
-(void)imageshoosebtnclicks:(UIButton *)button
{
    self.shoosebuttonindex = button.tag;
     [self shooseimages];
    
    
}

-(void)gobackbtnclick{
    
    [_imagebackview removeFromSuperview];
}
-(void)cancelclick{
    
    [_imagebackview removeFromSuperview];
    [_imagearry removeObjectAtIndex:self.cancelbtnindex];
    
    [self addimageTothebutton];
}

-(void)imageshoosebtnclick
{
    self.shoosebuttonindex = 0;
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
