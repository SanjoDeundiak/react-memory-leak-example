//
//  SomeObjcClass.h
//  ReactTest
//
//  Created by Oleksandr Deundiak on 8/31/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SomeObjcClass : NSObject

- (void)someFuncWithData:(NSData *)data;
- (void)someFuncSwiftProxyWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
