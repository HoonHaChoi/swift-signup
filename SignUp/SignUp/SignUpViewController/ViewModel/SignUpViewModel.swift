//
//  ViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/29.
//

import Foundation
import Combine

class SignUpViewModel {
    
    var idViewModel : IdViewModel
    var passwordViewModel : PasswordViewModel
    var nameViewModel : NameViewModel
    
    var isIdMatchValid : AnyPublisher<IdState, Never>
    var isPasswordValid : AnyPublisher<PasswordState, Never>
    var isMatchPasswordValid : AnyPublisher<PasswordConfirmState, Never>
    var isNameValid : AnyPublisher<NameState, Never>
    
    init() {
        idViewModel = IdViewModel()
        passwordViewModel = PasswordViewModel()
        nameViewModel = NameViewModel()
        
        isIdMatchValid = idViewModel.isValid
        isPasswordValid = passwordViewModel.isValid
        isMatchPasswordValid = passwordViewModel.isMatchValid
        isNameValid = nameViewModel.isValid
    }
    
    var isInputValid : AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(idPasswordInputValid, passwordConfirmNameInputValid)
            .map { $0 && $1  }
            .eraseToAnyPublisher()
    }
    
    private var idPasswordInputValid : AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isIdMatchValid, isPasswordValid)
            .map { $0 == .valid && $1 == .valid }
            .eraseToAnyPublisher()
    }
    
    private var passwordConfirmNameInputValid : AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isMatchPasswordValid, isNameValid)
            .map { $0 == .valid && $1 == .valid }
            .eraseToAnyPublisher()
    }
}
