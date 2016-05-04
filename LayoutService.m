//
//  LayoutService.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "LayoutService.h"

@implementation LayoutService

+ (nullable NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"fields" : [LayerField class]
             };
}

@end
