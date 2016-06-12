//
//  BFSSSharedUitl.m
//  友盟分享
//
//  Created by Shirley on 16/3/23.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFSSSharedUitl.h"
#import <UMSocial.h>
@interface BFSSSharedUitl()<UMSocialUIDelegate>

@end
@implementation BFSSSharedUitl
static BFSSSharedUitl * instance =nil;
+(instancetype)sharedUitl{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         instance =[[BFSSSharedUitl alloc]init];
    });
    return  instance;
}




- (void)SharedContentContriller:(UIViewController *)vc title:(NSString *)title shareText:(NSString *)shareText shareImage:(UIImage *)shareImage dataUrl:(NSString *)dataUrl{
    
    
    if (title==nil||title.length<1) {
        title =@"北附梦想教育";
    }
    if (shareText==nil||shareText.length<1) {
        shareText =@"北附梦想教育为您提供的分享内容,点击查看详情";
    }
    
    if (dataUrl==nil||dataUrl.length<1) {
        dataUrl =@"http://www.bfmxjy.com";
    }
    
    
    
    NSString *text =[NSString stringWithFormat:@"%@%@",shareText,dataUrl];
    [UMSocialSnsService presentSnsIconSheetView:vc
                                         appKey:@"wx6b5e771dca32f198"
                                      shareText:text
                                     shareImage:shareImage
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina]
                                       delegate:self];
    
    //配置微信的
    [UMSocialData defaultData].extConfig.wechatSessionData.url = dataUrl;
    [UMSocialData defaultData].extConfig.wechatSessionData.shareText =shareText;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = dataUrl;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareText =shareText;
}


-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{
  
}
@end
