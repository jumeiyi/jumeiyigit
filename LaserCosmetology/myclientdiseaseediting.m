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
    titilelable.text = @"病历记录";
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
    [save setTitle:@"发送" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:16];
    save.titleLabel.textColor = [self colorWithRGB:0xffffff alpha:1];
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
    //for (int a = 0; a < 3; a ++) {
      
        float x = (12 + btnwidth) * 0 + 12;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 170, btnwidth, btnwidth)];
        [btn setBackgroundImage:[UIImage imageNamed:@"fangxingjia"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(shooseimages) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 10;
        [_editingview addSubview:btn];
   // }
    
    _imagearry = [[NSMutableArray alloc] initWithCapacity:0];

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
    
     [self addbutton];
    
    NSLog(@"%ld------%@",_imagearry.count,imagess);
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
        [button addTarget:self action:@selector(cancelimageclick:) forControlEvents:UIControlEventTouchUpInside];
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
    [self shooseimages];
}
-(void)cancelimageclick:(UIButton *)btn
{

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
