//
//  LayoutService.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//


#import "LayerField.h"

@interface LayoutService : NSObject

@property(nonatomic,strong)NSString *label;

@property(nonatomic,strong)NSString *url;

@property(nonatomic,strong)NSArray<LayerField *> *fields;

@end
