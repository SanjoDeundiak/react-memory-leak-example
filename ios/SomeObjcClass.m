//
//  SomeObjcClass.m
//  ReactTest
//
//  Created by Oleksandr Deundiak on 8/31/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "SomeObjcClass.h"
#import "ReactTest-Swift.h"

@implementation SomeObjcClass

- (void)someFuncSwiftProxyWithData:(NSData *)data {
  SomeSwiftClass *nativeClass = [[SomeSwiftClass alloc] init];
  
  NSData *data1 = [[NSMutableData alloc] initWithLength:100*1024*1024];
  
  [nativeClass someFuncWithData:data1];
}

- (void)someFuncWithData:(NSData *)data { }

@end
