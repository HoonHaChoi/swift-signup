//
//  PrivateDataViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation
import Combine

class PrivateDataViewModel {
    
    @Published var birthDateText : String? = ""
    var emailViewModel : EmailViewModel
    var phoneViewModel : PhoneViewModel
    
    var isEmailMatchValid : AnyPublisher<EmailState, Never>
    var isPhoneMatchValid : AnyPublisher<PhoneState, Never>
    
    init() {
        emailViewModel = EmailViewModel()
        phoneViewModel = PhoneViewModel()
        
        isEmailMatchValid = emailViewModel.isValid
        isPhoneMatchValid = phoneViewModel.isValid
    }

    var isInputValid : AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(isEmailMatchValid, isPhoneMatchValid, isBirthDateValid)
            .map { $0 == .valid && $1 == .valid && !$2 }
            .eraseToAnyPublisher()
    }
    
    var isBirthDateValid : AnyPublisher<Bool, Never> {
        return $birthDateText
            .dropFirst()
            .compactMap { $0?.isEmpty }
            .eraseToAnyPublisher()
    }
}
