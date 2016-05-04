//
//  ConfigModel+AnalysisData.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "ConfigModel+AnalysisData.h"
#import "YYModel.h"
@implementation ConfigModel (AnalysisData)


- (void)analysisData:(id)datas{
   
    self.configVersion = [datas objectForKey:@"paramsConfigVersion"];
    
    NSDictionary *configFile = [datas objectForKey:@"configFile"];
    NSDictionary *configuration = [configFile objectForKey:@"configuration"];
    ConfigModel *cModel = [ConfigModel yy_modelWithJSON:configuration];
    
    self.layerservice = cModel.layerservice;
    self.layerservice_analysis = cModel.layerservice_analysis;
    self.map = cModel.map;
    self.area = cModel.area;
    cModel.configVersion =self.configVersion;
    NSDictionary *dictionary= [cModel yy_modelToJSONObject];
    [self saveDataToArchiver:dictionary];
}

- (void)saveDataToArchiver:(NSDictionary *)datas{
    
    NSString *filePath = [self getSavePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件
    BOOL res=[fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    if (res) {
        //文件创建成功，则写数据到文件中
        [datas writeToFile:filePath atomically:YES];
        
    }

}

- (ConfigModel *)loadDataFromArchiver{
    
    NSString *filePath = [self getSavePath];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath] ) {
        NSDictionary *dic= [[NSDictionary alloc]initWithContentsOfFile:filePath];
        ConfigModel *model=[ConfigModel yy_modelWithJSON:dic];
        return model;
    }
    else{
        return nil;
    }
}

/**
 * @author Jeremy, 16-02-29 10:02:09
 *
 * 获取数据保存地址
 *
 * @return 数据保存地址
 */
- (NSString *)getSavePath{
//    NSString* tempPath = NSTemporaryDirectory();
//    NSString* tempFile = [tempPath stringByAppendingPathComponent:@"southgisconfig.plist"];
    
    
    NSArray *cacheArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacheArray objectAtIndex:0];
    cachePath =[cachePath stringByAppendingPathComponent:@"southgisconfig.plist"];
    
    return cachePath;
}


@end
