//
//  PhoneViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation
import Combine

class PhoneViewModel {
    @Published var phoneText = ""
    
    var isValid : AnyPublisher<PhoneState, Never> {
        let pattern = "^010([0-9]{3,4}([0-9]{4}))$"
        return $phoneText
            .dropFirst()
            .map { $0.range(of : pattern, options: .regularExpression) == nil }
            .map { $0 == true ? PhoneState.notCorrect : PhoneState.valid}
            .eraseToAnyPublisher()
    }
}
