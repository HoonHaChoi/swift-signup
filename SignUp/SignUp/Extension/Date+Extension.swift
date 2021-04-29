//
//  Date+Extension.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation

extension Date {
    func conventString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
