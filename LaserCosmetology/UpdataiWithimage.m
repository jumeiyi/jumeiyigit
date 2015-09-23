//
//  UpdataiWithimage.m
//  聚美医
//
//  Created by fenghuang on 15/9/23.
//  Copyright © 2015年 huqijing. All rights reserved.
//

#import "UpdataiWithimage.h"
#import "AFNetworking.h"

@implementation UpdataiWithimage

+ (void)checkNetWorkStatus{
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     *  AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     *  AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     *  AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络Wifi
     */
    // 如果要检测网络状态的变化, 必须要用检测管理器的单例startMoitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            
            //            NSLog(@"网络连接已断开，请检查您的网络！");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络连接已断开，请检查您的网络！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器异常" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
        }
    }];
    
}

////上传病历图片
//+ (void)postModifyTheUserHeadRequestWitHUser:(NSString *)url medicalhistorysno:(NSString *)canshu1 doctorsno:(NSString *)canshu2 and:(NSData *)imagedata Completion:(dataBlcok)completion{
//
//    //配置文件上传
//    
//    //图片data 上传
//    //UIImage *upImage = [UIImage imageNamed:@"testImage.png"];
//    //NSData *imageData = UIImagePNGRepresentation(upImage);
//    
//    //文件file上传，上传mp3音乐文件
//    //NSString *theUpFilePath = [NSString stringWithFormat:@"%@testMusic.mp3",NSTemporaryDirectory()];
//    
//    //上传个图片文件；
//    NSString *theImagePath = [[NSBundle mainBundle] pathForResource:@"testImage" ofType:@"png"];
//    
//    self.uploadFileClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:kCOCOA_FileUPload]];
//    NSMutableURLRequest *fileUpRequest = [_uploadFileClient multipartFormRequestWithMethod:@"POST" path:@"" parameters:nil constructingBodyWithBlock:^(id formData) {
//        
//        //[formData appendPartWithFileData:imageData name:@"file" fileName:@"testImage" mimeType:@"image/png"];
//        
//        //[formData appendPartWithFileURL:[NSURL fileURLWithPath:theUpFilePath isDirectory:NO] name:@"file" fileName:@"testMusic.mp3" mimeType:@"audio/mpeg3" error:nil];
//        
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:theImagePath] name:@"file" error:nil];
//        
//    }];
//    
//    self.fileUploadOp = [[AFHTTPRequestOperation alloc]initWithRequest:fileUpRequest];
//    
//    
//    
//    
//}

//
/// 上传图片
//+ (AFHTTPRequestOperation *)uploadImageWithUrl:(NSString *)url
//                                         image:(UIImage *)image
//                                    completion:(HYBRequestCompletion)completion
//                                    errorBlock:(HYBErrorBlock)errorBlock {
////    url = [url addPrefix:@"/CosmetologyShop"];
////    if ([HYBUserInfoTool userToken]) {
////        url = [NSString stringWithFormat:@"%@?TOKEN=%@", url, [HYBUserInfoTool userToken]];
////    }
////    
////    AFHTTPRequestOperationManager *manager = [self operationManagerWithBaseUrl:kFileBaseUrl];
////    AFHTTPRequestOperation *op = [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
////        NSData *imageData = UIImageJPEGRepresentation(image, 1);
////        
////        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
////        formatter.dateFormat = @"yyyyMMddHHmmss";
////        NSString *str = [formatter stringFromDate:[NSDate date]];
////        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
////        
////        // 上传图片，以文件流的格式
////        [formData appendPartWithFileData:imageData name:@"myfiles" fileName:fileName mimeType:@"image/jpeg"];
////    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        completion(responseObject);
////    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        errorBlock(error);  
////    }];  
//    
//    return op;  
//}
    @end
