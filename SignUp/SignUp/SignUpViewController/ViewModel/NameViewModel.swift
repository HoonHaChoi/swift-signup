//
//  NameViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/31.
//

import Foundation
import Combine

class NameViewModel {
    
    @Published var nameText = ""
    
    var isValid : AnyPublisher<NameState, Never> {
        $nameText
            .dropFirst()
            .map { $0.isEmpty ? NameState.empty : NameState.valid }
            .eraseToAnyPublisher()
    }
    
}
