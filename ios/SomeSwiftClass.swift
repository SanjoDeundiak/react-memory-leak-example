//
//  SomeSwiftClass.swift
//  ReactTest
//
//  Created by Oleksandr Deundiak on 8/31/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

@objc class SomeSwiftClass: NSObject {
  @objc func someFunc(data: Data) {
    let data = Data(count: 10*1024*1024)
    
    let str = data.base64EncodedString()
    let index = str.index(str.startIndex, offsetBy: 10)
    
    print(str.substring(to: index))
  }
  @objc func someFunc(string: String) { }
}
