//
//  ConfigModel+AnalysisData.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/2/26.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "ConfigModel.h"

/**
 * @author Jeremy, 16-02-29 10:02:28
 *
 * 数据操作
 */
@interface ConfigModel (AnalysisData)

/**
 * @author Jeremy, 16-02-26 11:02:23
 *
 * 解析配置数据
 *
 * @param datas 配置数据
 */
- (void)analysisData:(id)datas;

/**
 * @author Jeremy, 16-02-29 10:02:55
 *
 * 数据持久化
 *
 * @param datas 需要保存的数据
 */
- (void)saveDataToArchiver:(NSDictionary *)datas;

/**
 * @author Jeremy, 16-02-29 10:02:45
 *
 * 读取数据
 *
 * @return 返回本地保存数据
 */
- (ConfigModel *)loadDataFromArchiver;

@end
