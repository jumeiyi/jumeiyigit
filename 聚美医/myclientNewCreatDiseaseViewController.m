//
//  myclientNewCreatDiseaseViewController.m
//  聚美医
//
//  Created by fenghuang on 15/9/28.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "myclientNewCreatDiseaseViewController.h"
#import "TopBarView.h"
#import "AFHTTPRequestOpeartionManagerOfme.h"
#import "PrefixHeader.pch"
@interface myclientNewCreatDiseaseViewController ()

@end

@implementation myclientNewCreatDiseaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    image.image = [UIImage imageNamed:@"huisebeijing"];
    [self.view addSubview:image];
    
    TopBarView *topbar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topbar];
    
    UILabel *titilelable = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 120, 25)];
    titilelable.text = @"新建病历";
    titilelable.textColor = [UIColor whiteColor];
    titilelable.font = [UIFont systemFontOfSize:22];
    titilelable.center = CGPointMake(self.view.bounds.size.width/2, 40);
    titilelable.textAlignment = NSTextAlignmentCenter;
    [topbar addSubview:titilelable];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 27, 40, 30)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"gaoback"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(comebacksaaaza) forControlEvents:UIControlEventTouchUpInside];
    [topbar addSubview:backbtn];
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 20, 50, 40)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
    [save addTarget:self action:@selector(saveenewThedisease) forControlEvents:UIControlEventTouchUpInside];
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
    
    float btnwidth = (self.view.bounds.size.width - (12 * 4))/3;
    
    float x = (12 + btnwidth) * 0 + 12;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 170, btnwidth, btnwidth)];
    [btn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addImageToediting) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 10;
    [_editingview addSubview:btn];
    
    
    _imagearry = [[NSMutableArray alloc] initWithCapacity:0];
    self.imagedataary = [[NSMutableArray alloc] initWithCapacity:0];

    self.a = 0;
    self.isupdata = NO;
}


-(void)comebacksaaaza
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否保存编辑？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 20;
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 20) {
        if (buttonIndex == 0) {
          [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"我点击了什么");
            [self saveenewThedisease];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor *)colorWithRGB:(int)color alpha:(float)alpha{
    
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardShow:(NSNotification *)note
{
    
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        // self.view.transform=CGAffineTransformMakeTranslation(0, - deltaY);
//        NSLog(@"deltaY = %f",deltaY);
        if (self.a == 0) {
            _mytextview.text = @"";
        }
    
    }];
    
    self.a ++;
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)addImageToediting
{

    pickerimageViewController *picker = [[pickerimageViewController alloc] init];
    picker.delegate1 = self;
    [self.navigationController pushViewController:picker animated:YES];
}

-(void)addbutton
{
    
    for (int c = 0; c < _imagearry.count; c++) {
        UIButton *btn = (UIButton *)[_editingview viewWithTag:10 + c];
        [btn removeFromSuperview];
    }
    
    float width = (self.view.bounds.size.width - (12 * 4))/3;
    float heiht = width;
    
    for (int j = 0; j < [_imagearry count]; j ++) {
        
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
//        [button addTarget:self action:@selector(cancelimageclick:) forControlEvents:UIControlEventTouchUpInside];
        [_editingview addSubview:button];
        
    }
    
    NSInteger a1 = [_imagearry count];
    NSInteger xn1 = a1 % 3;
    NSInteger yn1 = a1 / 3;
    
    int x1 = (12 + width) * xn1 + 12;
    int y1 = (12 + heiht) * yn1 + 170;
    
    if (_addimagebtn == nil && _imagearry.count < 3) {
        _addimagebtn = [[UIButton alloc] initWithFrame:CGRectMake(x1, y1, width , heiht)];
        [_addimagebtn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [_addimagebtn addTarget:self action:@selector(imageshoosebtnclick) forControlEvents:UIControlEventTouchUpInside];
        _addimagebtn.tag = 30;
        [_editingview addSubview:_addimagebtn];
    }
    
}
-(void)imageshoosebtnclick
{
    [self addImageToediting];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//上传病历
-(void)saveenewThedisease
{
    if (self.imagedataary.count == 0) {
        NSLog(@"木有鱼丸，木有粗面");
        return;
    }else{
    
        NSString *contentstr = _mytextview.text;
        
        NSString *string = [NSString stringWithFormat:@"%@/doctor.savemedicalhistory.go?doctorsno=%@&customersno=%@&orderdetailsno=%@&content=%@",HTTPREQUESTPDOMAIN,self.doctorsno,self.customersno,self.orderDetailSno,contentstr];
        NSLog(@"上传病历前请求----%@",string);
        
        [AFHTTPRequestOpeartionManagerOfme postsEditingmedical:string withblock:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
            NSLog(@"新建病历返回来的-medicalhistorysnostring= %@",string);
            self.medicalhistorysno = string;
            
            [self updateWithmedicaldetailTwo];
        }];
    }
    

}
-(void)updateWithmedicaldetailTwo
{

    if (self.isupdata == YES) {
        return;
    }else{
        NSString *urlstr = [NSString stringWithFormat:@"%@/doctor.savemedicalhistoryimage.go",HTTPREQUESTPDOMAIN];
        self.isupdata = YES;
        for (int i = 0; i < self.imagedataary.count; i ++) {
            
            self.imagedat = [self.imagedataary objectAtIndex:i];
            
            [AFHTTPRequestOpeartionManagerOfme postModifyTheUserHeadRequestWitHUser:urlstr medicalhistorysno:self.medicalhistorysno doctorsno:self.doctorsno and:self.imagedat Completion:^(NSMutableArray *array1, NSMutableArray *array2, NSString *string) {
                
                self.isupdata = NO;
            }];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
