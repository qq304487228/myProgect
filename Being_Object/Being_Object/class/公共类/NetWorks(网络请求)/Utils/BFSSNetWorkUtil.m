//
//  BFSSNetWorkUtil.m
//  BFMX-Teacher-APP
//
//  Created by Shirley on 16/2/20.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//

#import "BFSSNetWorkUtil.h"
#import "AFNetworking.h"
@implementation BFSSNetWorkUtil
+ (void)post:(BFSSRequestBase *)request success:(void (^)(BFSSResponseBase *))success failure:(void (^)(NSError *))failure{
//    //1.判断请求是否合理
//    if (!request) {
//        NSLog(@"[ERROR] request cannot be NULL");
//        if (failure) {
//            failure([NSError errorWithDomain:@"" code:-1 userInfo:nil]);
//        }
//        return;
//    }
//    NSDictionary *dic =request.paramDic;
//    NSArray *arr =[dic allKeys];
//    NSString *string=[NSString string];
//    for (int i =0;i<arr.count;i++) {
//        NSString *str =arr[i];
//        NSString *value =dic[str];
//        NSString *strr =[NSString stringWithFormat:@"%@=%@",str,value];
//        if (i==0) {
//           string = [string stringByAppendingString:strr];
//        }else{
//             string = [string stringByAppendingString:@"&"];
//            string = [string stringByAppendingString:strr];
//        }
//    }
//    
//    NSLog(@"####GET\n\n%@\n\n",[NSString stringWithFormat:@"%@?%@",[request stringOfApiURLString],string]);
//  //  NSLog(@"%@,%@",[request stringOfApiURLString],request.paramDic);
//    //2.判断 发网络请求服务器
//    AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] init];
//        
////#warning 不同的端口要配置不同的 请求头
//    
//      //设置请求头
//        //登录用户的token必须要填写
//    //朱亚宁
////        if ([BFSSUserManager isLogin]) {
////            [manager.requestSerializer setValue:[BFSSUserManager getUserToken] forHTTPHeaderField:@"token"]; //设备类型
////        }
//    
//        //设备类型
//        [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"dType"]; //设备类型
//       //获取版本号
//        NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//        [manager.requestSerializer setValue:version forHTTPHeaderField:@"version"];// 版本号
//        
//        //端分别
//        [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"softtype"];//端区分 1老师端2家长端3学生端
//        
//        //设备id
//        NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
//        [manager.requestSerializer setValue:identifierForVendor forHTTPHeaderField:@"deviceId"];
//        //safeCode
//         [manager.requestSerializer setValue:@"BFMXJY2016" forHTTPHeaderField:@"safeCode"];
//        // pushId
//         [manager.requestSerializer setValue:@"12121" forHTTPHeaderField:@"pushId"];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager POST:request.stringOfApiURLString parameters:request.paramDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        //3.处理回掉的数据
//        NSDictionary *dic = responseObject;
//        //   1.1 判断返回的数据是否有值
//        if (dic) {
//            // 崩 溃 收 集
//            @try{
//                //  1.2 判断code是不是有值 或者没有数据返回
//                NSString *code =[dic objectForKey:@"code"];
//                
//                if (!code) {
//                    failure([NSError errorWithDomain:ServerBusy code:6227 userInfo:nil]);
//                    return ;
//                }
//                
//                //  1.3 判断code的值等于  200 //只有这样才成功
//                if ([code intValue] == 200) {
//                    NSString *responseClassName =  [self replaceCharacter:@"Request" withString:@"Response" inString:NSStringFromClass([request class])];
//                    BFSSResponseBase *response=[NSClassFromString(responseClassName) mj_objectWithKeyValues:dic];
//                    success(response);
//                    
//                    return;
//                }else{  //失败的处理
//                    //  2 600 10102 9999
//                    if ([code intValue] == 2||[code intValue] == 600||[code intValue] == 99999||[code intValue] == 10102) {
//                        failure([NSError errorWithDomain:@"出现异常,请稍后重试!" code:[[dic objectForKey:@"code"] integerValue] userInfo:nil]);
//                        return;
//                    }
//                    //601
//                    if ([code intValue] == 601) {
//                        failure([NSError errorWithDomain:@"重复添加" code:601 userInfo:nil]);
//                        return ;
//                    }
//                    //1002
//                    if ([code intValue] == 10002) {
//                        failure([NSError errorWithDomain:@"没有可显示的内容!" code:10002 userInfo:nil]);
//                        return ;
//                    }
//                    //1007
//                    if ([code intValue] == 10007) {
//                        failure([NSError errorWithDomain:@"此手机号已有用户使用,不能修改为此手机号" code:10007 userInfo:nil]);
//                        return;
//                    }
//                    if ([code intValue] == 10103) {
//                        failure([NSError errorWithDomain:@"删除身份失败,请稍后重试!" code:10103 userInfo:nil]);
//                        return ;
//                    }
//                    if ([code intValue] == 10101) {
//                        failure([NSError errorWithDomain:@"身份已存在,不能重复添加!" code:10101 userInfo:nil]);
//                        return;
//                    }
//                    if ([code intValue] == 10200) {
//                        failure([NSError errorWithDomain:@"暂无法发送,请稍后重试" code:10200 userInfo:nil]);
//                        return ;
//                    }
//                    if ([code intValue] == 10002) {
//                        failure([NSError errorWithDomain:[dic objectForKey:@"msg"] code:10002 userInfo:nil]);
//                        return ;
//                    }
//                    
//                    failure([NSError errorWithDomain:[dic objectForKey:@"msg"] code:[[dic objectForKey:@"code"] integerValue] userInfo:nil]);
//                    return;
//                }
//            }@catch(NSException *exception) {
//                NSLog(@"exception:%@",exception);
//              //  failure([NSError errorWithDomain:@"请求数据处理的时候出现错误" code:-1 userInfo:nil]);
//            }
//        }else if (failure) {
//            
//            failure([NSError errorWithDomain:@"接口出错,没有返回数据" code:-1 userInfo:nil]);
//            
//        }else{
//            NSLog(@"[ERROR] failure not exist!");
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@",error);
//        if (failure) {
//            failure([NSError errorWithDomain:@"网络连接失败,请检查网络连接" code:-1 userInfo:nil]);
//        }else{
//            NSLog(@"[ERROR] failure not exist!");
//        }
//        
//        
//    }];
    
}

+ (void)postImage:(BFSSRequestBase *)request success:(void (^)(BFSSResponseBase *responseObject))success progress:(void (^)(NSProgress *progress))progress failure:(void (^)(NSError *error))failure{
    
    
//    if (request.imageDatas.count<1) {
//        [self post:request success:success failure:failure];
//        return;
//    }
//    //1.判断请求是否合理
//    if (!request) {
//        NSLog(@"[ERROR] request cannot be NULL");
//        if (failure) {
//            failure([NSError errorWithDomain:@"请求错误" code:-1 userInfo:nil]);
//        }
//        return;
//    }
//    NSDictionary *dic =request.paramDic;
//    NSArray *arr =[dic allKeys];
//    NSString *string=[NSString string];
//    for (int i =0;i<arr.count;i++) {
//        NSString *str =arr[i];
//        NSString *value =dic[str];
//        NSString *strr =[NSString stringWithFormat:@"%@=%@",str,value];
//        if (i==0) {
//            string = [string stringByAppendingString:strr];
//        }else{
//            string = [string stringByAppendingString:@"&"];
//            string = [string stringByAppendingString:strr];
//        }
//    }
//    
//    NSLog(@"####GET\n\n%@\n\n",[NSString stringWithFormat:@"%@?%@",[request stringOfApiURLString],string]);
//    
//    //2.判断 发网络请求服务器
//    AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] init];
//    
////#warning 不同的端口要配置不同的 请求头
//    
//    //设置请求头
//    //登录用户的token必须要填写
//    //朱亚宁
////    if ([BFSSUserManager isLogin]) {
////        [manager.requestSerializer setValue:[BFSSUserManager getUserToken] forHTTPHeaderField:@"token"]; //设备类型
////    }
//    
//    //设备类型
//    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"dType"]; //设备类型
//    //获取版本号
//    NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    [manager.requestSerializer setValue:version forHTTPHeaderField:@"version"];// 版本号
//    
//    //端分别
//    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"softtype"];//端区分 1老师端2家长端3学生端
//    
//    //设备id
//    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
//    [manager.requestSerializer setValue:identifierForVendor forHTTPHeaderField:@"deviceId"];
//    //safeCode
//    [manager.requestSerializer setValue:@"BFMXJY2016" forHTTPHeaderField:@"safeCode"];
//    // pushId
//    [manager.requestSerializer setValue:@"12121" forHTTPHeaderField:@"pushId"];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager POST:request.stringOfApiURLString parameters:request.paramDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (int i =0; i<request.imageDatas.count; i++) {
//            NSData *data =request.imageDatas[i];
//            [formData appendPartWithFileData:data name:request.fileName fileName:[NSString stringWithFormat:@"image%d.jpg",i] mimeType:@"image/jpeg"];
//        }
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSDictionary *dic = responseObject;
//        //   1.1 判断返回的数据是否有值
//        if (dic) {
//            // 崩 溃 收 集
//            @try{
//                //  1.2 判断code是不是有值 或者没有数据返回
//                if ( ![dic objectForKey:@"code"]) {
//                    failure([NSError errorWithDomain:@"接口返回数据格式出错" code:-1 userInfo:nil]);
//                    return ;
//                }
//                
//                if([[dic objectForKey:@"code"] intValue] ==200){
//                    NSString *responseClassName =  [self replaceCharacter:@"Request" withString:@"Response" inString:NSStringFromClass([request class])];
//                    BFSSResponseBase *response=[NSClassFromString(responseClassName) mj_objectWithKeyValues:dic];
//                    success(response);
//                    
//                    return;
//
//                    
//                }else{
//                   failure([NSError errorWithDomain:[dic objectForKey:@"msg"] code:[[dic objectForKey:@"code"] integerValue] userInfo:nil]);
//                }
//                
//            }@catch(NSException *exception) {
//                NSLog(@"exception:%@",exception);
//               // failure([NSError errorWithDomain:@"请求数据处理的时候出现错误" code:-1 userInfo:nil]);
//            }
//        }else if (failure) {
//            
//            failure([NSError errorWithDomain:@"接口出错,没有返回数据" code:888 userInfo:nil]);
//            
//        }else{
//            NSLog(@"[ERROR] failure not exist!");
//        }
//  
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure([NSError errorWithDomain:@"网络连接失败,请检查网络连接" code:-1 userInfo:nil]);
//    }];
    
    
    
    
}





/**
 *  用一个字符串代替另一个字符
 */
+ (NSString *)replaceCharacter:(NSString *)oStr withString:(NSString *)nStr inString:(NSString *)string
{
    if (oStr && nStr) {
        NSMutableString *_str = [NSMutableString stringWithString:string];
        [_str replaceOccurrencesOfString:oStr withString:nStr options:NSCaseInsensitiveSearch range:NSMakeRange(0, _str.length)];
        return _str;
    }
    else
        return oStr;
}

@end
