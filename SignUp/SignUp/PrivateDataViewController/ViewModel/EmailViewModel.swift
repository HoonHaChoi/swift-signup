//
//  EmailViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation
import Combine

class EmailViewModel {
    @Published var emailText = ""
    
    var isValid : AnyPublisher<EmailState, Never> {
        let pattern = "^[A-Za-z0-9._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}$"
        return $emailText
            .dropFirst()
            .map { $0.range(of : pattern, options: .regularExpression) == nil }
            .map { $0 == true ? EmailState.notCorrect : EmailState.valid}
            .eraseToAnyPublisher()
    }
}
