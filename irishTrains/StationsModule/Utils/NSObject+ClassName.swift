//
//  NSObject+ClassName.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
