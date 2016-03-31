//
//  NSString+JSON.h
//  聚美医
//
//  Created by fenghuang on 16/3/30.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

@end
