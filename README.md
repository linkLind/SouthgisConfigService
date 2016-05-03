# SouthgisConfigService
Get Southgis ImapMobile Service configuration model.

#Requirements

  *pod 'YYModel'
  
  *pod 'SVProgressHUD'

  *ARC 

  *xcode 6.0 or higher

  *IOS 7.0 or higher


#Usage

  #import "ConfigModel.h"
  
  //this is singleton
  ConfigModel *model =[ConfigModel defaultConfigModel];
  
  //get the southgis imap configuration service model.
  -(void)getAppConfig:(NSString * _Nonnull)appId andURL:( NSString * _Nonnull )url success:(void (^)(ConfigModel *object))success
  
#Install 

  pod 'SouthgisConfigService'


