//
//  Area.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/31.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Area : NSObject

@property(nonatomic,strong)NSString *extent;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *state;
@property(nonatomic,strong)NSArray *children;
@property(nonatomic,strong)NSString *code;
@property(nonatomic,strong)NSString *_parentId;

@end
