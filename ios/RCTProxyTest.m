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
  
RCT_EXPORT_SYNCHRONOUS_TYPED_METHOD(id, callNativeMethodWithArgument:(NSString *)argument)
{
  RENSomeNativeClass *nativeClass = [[RENSomeNativeClass alloc] init];
  
  NSString *result = [nativeClass someMethodWithString:argument];
  
  return result;
}

@end
