//
//  RCTProxyTest.m
//  ReactTest
//
//  Created by Oleksandr Deundiak on 8/30/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "SomeObjcClass.h"
#import "RCTProxyTest.h"
#import <React/RCTLog.h>
#import "ReactTest-Swift.h"

@implementation RCTProxyTest
  
RCT_EXPORT_MODULE();

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeSwiftMethodDataSync)
{
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  SomeSwiftClass *nativeClass = [[SomeSwiftClass alloc] init];
  
  [nativeClass someFuncWithData:data];
  
  return @"TEST";
}

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeObjcSwiftProxyMethodDataSync)
{
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  SomeObjcClass *nativeClass = [[SomeObjcClass alloc] init];
  
  [nativeClass someFuncSwiftProxyWithData:data];
  
  return @"TEST";
}

RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeObjcMethodDataSync)
{
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  SomeObjcClass *nativeClass = [[SomeObjcClass alloc] init];
  
  [nativeClass someFuncWithData:data];
  
  return @"TEST";
}
  
RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeSwiftMethodStringSync)
{
  SomeSwiftClass *nativeClass = [[SomeSwiftClass alloc] init];
  
  NSString *string = [@"" stringByPaddingToLength:100*1024*1024 withString:@"a" startingAtIndex:0];
  
  [nativeClass someFuncWithString:string];
  
  return @"TEST";
}

RCT_EXPORT_METHOD(callNativeSwiftMethodCallbackWithCallback:(RCTResponseSenderBlock)callback)
{
  SomeSwiftClass *nativeClass = [[SomeSwiftClass alloc] init];
  
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  [nativeClass someFuncWithData:data];
  
  callback(@[[NSNull null], @"TEST"]);
}

RCT_REMAP_METHOD(callNativeSwiftMethodPromise,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  SomeSwiftClass *nativeClass = [[SomeSwiftClass alloc] init];
  
  NSData *data = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  [nativeClass someFuncWithData:data];
  
  resolve(@"TEST");
}

@end
