//
//  BirthDatePicker.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import UIKit

class BirthDatePicker: UIDatePicker {

    private let min : Int = 15
    private let max : Int = 99
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        self.locale = Locale(identifier: "ko_KR")
        self.datePickerMode = .date
        self.preferredDatePickerStyle = .wheels
        self.minimumDate = minimize(min)
        self.maximumDate = maximize(max)
    }
    
    private func minimize(_ min : Int) -> Date {
        var currnet = calendar.dateComponents([.year], from: date)
        currnet.year = calendar.component(.year, from: date) - min
        guard let minDate = calendar.date(from: currnet) else { return Date() }
        return minDate
    }
    
    private func maximize(_ max : Int) -> Date {
        var currnet = calendar.dateComponents([.year], from: date)
        currnet.year = calendar.component(.year, from: date) + max
        guard let maxDate = calendar.date(from: currnet) else { return Date() }
        return maxDate
    }
}

