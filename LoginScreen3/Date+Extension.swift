//
//  Date+Extension.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/27/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation


extension Date {
    func millisecondsTimestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970*1000)
    }
}
