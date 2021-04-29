//
//  PasswordViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/31.
//

import Foundation
import Combine

class PasswordViewModel {
    
    @Published var passwordText = ""
    @Published var passwordConfirmText = ""
    
    var isValid : AnyPublisher<PasswordState, Never> {
        Publishers.Zip4(isPasswordCount, isPasswordUpperword, isPasswordNumber, isPasswordSymbol)
            .map {
                if $0 { return PasswordState.notEnoughCount }
                if $1 { return PasswordState.notUpperWord }
                if $2 { return PasswordState.notNumber }
                if $3 { return PasswordState.notSymbol }
                return PasswordState.valid
            }
            .eraseToAnyPublisher()
    }
    
    var isMatchValid : AnyPublisher<PasswordConfirmState, Never> {
        $passwordConfirmText
            .dropFirst()
            .combineLatest(self.$passwordText){
            return $0 == $1 ? PasswordConfirmState.valid : PasswordConfirmState.notEqual
        }.eraseToAnyPublisher()
    }
    
    private var isPasswordUpperword : AnyPublisher<Bool, Never> {
        let pattern = "[A-Z]+"
        return $passwordText
            .dropFirst()
            .map{ $0.range(of: pattern, options: .regularExpression) == nil }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordNumber : AnyPublisher<Bool, Never> {
        let pattern = "[0-9]+"
        return $passwordText
            .dropFirst()
            .map{ $0.range(of: pattern, options: .regularExpression) == nil }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordSymbol : AnyPublisher<Bool, Never> {
        let pattern = "[!@#$%]+"
        return $passwordText
            .dropFirst()
            .map{ $0.range(of: pattern, options: .regularExpression) == nil }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordCount : AnyPublisher<Bool, Never> {
        $passwordText
            .dropFirst()
            .map{ $0.count < 7 || $0.count > 16 }
            .eraseToAnyPublisher()
    }
    
}
