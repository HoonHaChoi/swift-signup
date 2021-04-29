//
//  IdViewModel.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/31.
//

import Foundation
import Combine

class IdViewModel {
    
    @Published var idText = ""
    
    private var idList : [String] = []
    private var service : Serviceable
    private var cancellable : AnyCancellable?
    
    init() {
        service = Service()
        requestIdList()
    }
    
    var isValid : AnyPublisher<IdState , Never> {
        Publishers.Zip(setTextRule,isIdexist)
            .map {
                if $0 { return IdState.notStandard }
                if $1 { return IdState.idExist }
                return IdState.valid
            }.eraseToAnyPublisher()
    }
    
    private func requestIdList() {
        cancellable = service.request(EndPoint.url).sink { (list) in
            self.idList = self.match(text: list)
        }
    }
    
    private var setTextRule : AnyPublisher<Bool, Never> {
        let pattern = "^[a-z0-9_-]{5,20}$"
        return $idText
            .dropFirst()
            .map { $0.range(of : pattern, options: .regularExpression) == nil }
            .eraseToAnyPublisher()
    }
    
    private var isIdexist : AnyPublisher<Bool, Never> {
        return $idText
            .dropFirst()
            .map { self.idList.contains($0) }
            .eraseToAnyPublisher()
    }
    
    private func match(text : String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: "[a-zA-Z]+", options: .caseInsensitive) else { return [] }
        let result = regex.matches(in: text, range: _NSRange(location: 0, length: text.count))
        return result.map {
            String(text[Range($0.range, in: text)!])
        }
    }
}
