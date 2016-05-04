//
//  ConfigModel.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapInfo.h"
#import "LayoutService.h"
#import "Area.h"
/**
 * @author Jeremy, 16-02-26 10:02:58
 *
 * 初始化配置
 */
@interface ConfigModel : NSObject

/**=========移动配置后台返回参数解析后的变量==========**/

/**配置文件版本**/
@property(nonatomic,strong,nullable)NSString * configVersion;

@property(nonatomic,strong,nullable)NSArray<LayoutService *> *layerservice;

@property(nonatomic,strong,nullable)NSArray<LayoutService *> *layerservice_analysis;

@property(nonatomic,strong,nullable)MapInfo *map;

@property(nonatomic,strong,nullable)Area *area;

/**==============END============================**/

/**
 * @author Jeremy, 16-02-29 11:02:38
 *
 * 单例获取对象，同时会在本地读取配置信息
 *
 * @return 返回一个实体对象
 */
+ (nonnull instancetype )defaultConfigModel;



/**
 *  @author crash         crash_wu@163.com   , 16-05-03 17:05:51
 *
 *  @brief  获取APP配置信息
 *
 *  @param appId   APPID
 *  @param url     配置信息URL地址
 *  @param success 获取成功返回
 */
-(void)getAppConfig:(NSString * _Nonnull)appId andURL:( NSString * _Nonnull )url success:(void (^ _Nonnull)(ConfigModel *_Nullable object ))success;

@end
