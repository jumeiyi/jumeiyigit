//
//  CDVMyPlugin.h
//  聚美医
//
//  Created by fenghuang on 16/3/8.
//  Copyright © 2016年 huqijing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVMyPlugin : CDVPlugin

@property (nonatomic, copy) NSString* callbackID;

// Instance Method

- (void) print:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
