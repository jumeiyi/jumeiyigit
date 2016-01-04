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
        _addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x, 170, btnwidth, btnwidth)];
        [_addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [_addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
        _addimagebtn.tag = 10;
        [_editingview addSubview:_addimagebtn];
   
    
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
    self.a = 0;
    
    self.cansaver = YES;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)keyboardShow:(NSNotification *)note
{
    
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        // self.view.transform=CGAffineTransformMakeTranslation(0, - deltaY);
        //        NSLog(@"deltaY = %f",deltaY);
        if (self.a == 0) {
            
            if ([_mytextview.text isEqualToString:@"点击编辑文字（不可空）"]) {
                _mytextview.text = @"";
                
            }
            _mytextview.textColor = [UIColor blackColor];
            self.cansaver = YES;
        }
        
    }];
    
    self.a++;
}

//获取单条病历
-(void)getdatawithurl
{
    
    NSString *string = [NSString stringWithFormat:@"%@/doctor.getmedicalhistory.go?medicalhistorysno=%@",HTTPREQUESTPDOMAIN,self.medicalhistorysno];
    NSLog(@"获取单条病历url=%@",string);
    
    [AFHTTPRequestOpeartionManagerOfme posetgetAmedicalwithurl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
        self.imageURLary = array1;
        _mytextview.text = string;
        
         [self addimageTothebutton];
        
        //[self deleteTheImage];
    }];

}

//保存编辑
-(void)saverediting
{
    
    if (self.cansaver == YES) {
        
        self.content = _mytextview.text;
        
        NSString *string = [NSString stringWithFormat:@"%@/doctor.savemedicalhistory.go?doctorsno=%@&medicalhistorysno=%@&content=%@",HTTPREQUESTPDOMAIN,self.doctorsno,self.medicalhistorysno,self.content];
        NSLog(@"保存编辑url=%@",string);
        
        [AFHTTPRequestOpeartionManagerOfme savermediclhistoryWithurl:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
            [self upImageData];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    }else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入描述内容！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }


}

//新增图片
-(void)upImageData{
    
    NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.savemedicalhistoryimage.go",HTTPREQUESTPDOMAIN];
    
    for (int i = 0; i < _imagearry.count; i ++) {
        
        NSData *imagedata = UIImageJPEGRepresentation([_imagearry objectAtIndex:i], 0.4f);
        
        [AFHTTPRequestOpeartionManagerOfme postModifyTheUserHeadRequestWitHUser:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno and:imagedata Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            
        }];
    }
    
}


-(void)deleteTheImage{

    NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.delmedicalhistoryimage.go?doctorsno=%@&medicalhistorysno=%@&medicalhistoryimagesno=%@",HTTPREQUESTPDOMAIN,self.doctorsno,self.medicalhistorysno,@"922dc839-1e6c-479b-a0f9-bb034bbf43ab"];
    NSLog(@"修改编辑url=%@",urlstr);
    
    [AFHTTPRequestOpeartionManagerOfme deleteThemadicleimaheWithURL:urlstr withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
        
    }];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 10) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    if (alertView.tag == 11) {
        
        if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
        }else{
        [self saverediting];
        }
    }
    
    if (alertView.tag == 12) {
        
    }

    if (alertView.tag == 13) {
        
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self saverediting];
        }
   
     
        NSLog(@"我选择了%ld",buttonIndex);
    }
    
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
    
//    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:encodeResult options:0];
//    NSString* _encodedImageStr = [[NSString alloc] initWithData:_data encoding:NSASCIIStringEncoding];
    
    if (_encodedImageStr.length > 10) {
        [_addimagebtn removeFromSuperview];
        _addimagebtn = nil;
    }
    [self.imagedataary addObject:_data];
    
    [self addimageTothebutton];
    
    NSLog(@"_imagearry.count=%ld-----",_imagearry.count);
}



-(void)addimageTothebutton
{

    NSLog(@"创建图片按钮-----self.imageURLary.count-%ld---_imagearry.count-%ld",self.imageURLary.count,_imagearry.count);
    
    for (int c = 0; c < self.imageURLary.count + 1 + _imagearry.count; c++) {
        UIButton *btn = (UIButton *)[_editingview viewWithTag:20 + c];
        [btn removeFromSuperview];
    }

    float width = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht = width;

   
    for (int j = 0; j < [self.imageURLary count]; j ++) {
        NSDictionary *imageurdic = [self.imageURLary objectAtIndex:j];
        NSString *imageurl = [imageurdic objectForKey:@"url"];
        
        NSInteger xn = j % 3;
        NSInteger yn = j / 3;
        
        float x = (12 + width) * xn + 12;
        float y = (12 + heiht) * yn + 170;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        button.backgroundColor = [UIColor redColor];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",HTTPREQUESTPDOMAIN,imageurl]]  forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        [button addTarget:self action:@selector(cancelbuttonclickl:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 20 + j;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        [_editingview addSubview:button];
    }
    
    for (NSInteger j = 0; j < [_imagearry count]; j ++) {
        
        NSInteger a = j + [self.imageURLary count];
        NSInteger xn = a % 3;
        NSInteger yn = a / 3;
        
        float x = (12 + width) * xn + 12;
        float y = (12 + heiht) * yn + 170;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, heiht)];
        [button setBackgroundImage:[_imagearry objectAtIndex:j] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(cancelbuttonclickl:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 20 + self.imageURLary.count;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        [_editingview addSubview:button];
    }
    
    NSInteger a1 = [self.imageURLary count] + [_imagearry count];
    NSInteger xn1 = a1 % 4;
    NSInteger yn1 = a1 / 4;
    
    int x1 = (12 + width) * xn1 + 12;
    int y1 = (12 + heiht) * yn1 + 170;
    
    
    NSLog(@"x1:%d-----y1:%d-------a1:%ld",x1,y1,a1);
    
    UIButton *btn = (UIButton *)[_editingview viewWithTag:10];
    [btn removeFromSuperview];
    
    UIButton *btna = [[UIButton alloc] initWithFrame:CGRectMake(x1, y1, width, heiht)];
    btna.tag = 10;
    [btna setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
    [btna addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
    [_editingview addSubview:btna];
  
    
}

-(void)cancelbuttonclickl:(UIButton *)btn{
  
#pragma 有待解决
//    self.cancelbtnindex = btn.tag - 20;
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否删除这张图片？" delegate:self cancelButtonTitle:@"删除" otherButtonTitles:@"取消", nil];
//    alert.tag = 13;
//    [alert show];
    
}

-(void)imageshoosebtnclicks:(UIButton *)button
{
     [self shooseimages];
    
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否需要保存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 11;
    [alert show];
    
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
