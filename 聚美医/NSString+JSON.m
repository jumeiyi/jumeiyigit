//
//  NSString+JSON.m
//  聚美医
//
//  Created by fenghuang on 16/3/30.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

@end
