//
//  MapInfo.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayerInfo.h"

@interface MapInfo : NSObject

@property(nonatomic,strong)NSString *initialextent;

@property(nonatomic,strong)NSString *fullextent;

@property(nonatomic,strong)NSArray<LayerInfo *> *basemaps;

@property(nonatomic,strong)NSArray<LayerInfo *> *operationallayers;

@end
