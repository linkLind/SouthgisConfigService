//
//  ConfigModel.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "ConfigModel.h"
#import "ConfigModel+AnalysisData.h"
#import "SVProgressHUD.h"

@implementation ConfigModel

+ (instancetype)defaultConfigModel{

    static ConfigModel *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
        ConfigModel *configFile =[instance loadDataFromArchiver];
        if (configFile)
            [instance analysisData:configFile];
   
    });
    
    return instance;
}


/**
 *  @author crash         crash_wu@163.com   , 16-05-03 17:05:51
 *
 *  @brief  获取APP配置信息
 *
 *  @param appId   APPID
 *  @param url     配置信息URL地址
 *  @param success 获取成功返回
 */
-(void)getAppConfig:(NSString * _Nonnull)appId andURL:( NSString * _Nonnull )url success:(void (^)(ConfigModel *_Nullable object))success{
    
    NSString *urlHttp=[NSString stringWithFormat:@"%@?appId=%@",url,appId];
    [SVProgressHUD showWithStatus:@"正在加载配置信息..."];
    
    __weak typeof(self) weak =self;
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlHttp] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error ||data.length==0 ||!data) {
            [SVProgressHUD showErrorWithStatus:@"配置信息加载失败!"];
            return ;
        }
        
        id json = data;
        if ([json isKindOfClass:[NSData class]]) {
            json = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        }
        
        //解析数据
        [self analysisData:json];
        //保存数据
        [self saveDataToArchiver:json];
        
        success(weak);
        [SVProgressHUD dismiss];
        
        
    }]resume];
    
}

@end
