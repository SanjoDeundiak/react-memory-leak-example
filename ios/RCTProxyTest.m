//
//  RCTProxyTest.m
//  ReactTest
//
//  Created by Oleksandr Deundiak on 8/30/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTProxyTest.h"
#import <React/RCTLog.h>
@import ReactEmptyNativeFramework;

@implementation RCTProxyTest
  
RCT_EXPORT_MODULE();

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeMethodDataSync)
{
  RENSomeNativeClass *nativeClass = [[RENSomeNativeClass alloc] init];
  
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  NSString *result = [nativeClass someMethodWithData:data];
  
  return result;
}
  
RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeMethodStringSync)
{
  RENSomeNativeClass *nativeClass = [[RENSomeNativeClass alloc] init];
  
  NSString *string = [@"" stringByPaddingToLength:100*1024*1024 withString:@"a" startingAtIndex:0];
  
  NSString *result = [nativeClass someMethodWithString:string];
  
  return result;
}

RCT_EXPORT_METHOD(callNativeMethodCallbackWithCallback:(RCTResponseSenderBlock)callback)
{
  RENSomeNativeClass *nativeClass = [[RENSomeNativeClass alloc] init];
  
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  NSString *result = [nativeClass someMethodWithData:data];
  
  callback(@[[NSNull null], result]);
}

RCT_REMAP_METHOD(callNativeMethodPromise,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  RENSomeNativeClass *nativeClass = [[RENSomeNativeClass alloc] init];
  
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  NSString *result = [nativeClass someMethodWithData:data];
  
  resolve(result);
}

@end
