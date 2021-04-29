//
//  State.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/30.
//

import Foundation

protocol Validable {
    func isValid() -> Bool
}

enum PasswordState : Validable{
    case notEnoughCount
    case notUpperWord
    case notNumber
    case notSymbol
    case valid
    
    var message: String {
      switch self {
      case .notEnoughCount:
        return "8자 이상 16자 이하로 입력해주세요"
      case .notUpperWord:
        return "영문 대문자 최소 1자 이상 포함"
      case .notNumber:
        return "숫자를 최소 1자 이상 포함"
      case .notSymbol:
        return "특수문자를 최소 1자 이상 포함"
      case .valid :
        return "안전한 비밀번호 입니다"
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}

enum PasswordConfirmState : Validable {
    case notEqual
    case valid
    
    var message: String {
      switch self {
      case .notEqual:
        return "비밀번호가 일치하지 않습니다"
      case .valid :
        return "비밀번호가 일치합니다"
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}


enum IdState : Validable {
    case idExist
    case notStandard
    case valid
    
    var message: String {
      switch self {
      case .idExist:
        return "이미 사용중인 아이디입니다"
      case .notStandard :
        return "5~20자의 영문 소문자, 숫자와 특수기호(_)(-) 만 사용 가능합니다"
      case .valid :
        return "사용 가능한 아이디입니다"
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}

enum NameState : Validable {
    case empty
    case valid
    
    var message: String {
      switch self {
      case .empty:
        return "이름은 필수 입력 항목입니다"
      case .valid :
        return ""
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}

enum EmailState : Validable {
    case notCorrect
    case valid
    
    var message: String {
      switch self {
      case .notCorrect:
        return "이메일 주소를 다시 확인해주세요"
      case .valid :
        return ""
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}

enum PhoneState : Validable {
    case notCorrect
    case valid
    
    var message: String {
      switch self {
      case .notCorrect:
        return "형식에 맞지 않는 번호입니다"
      case .valid :
        return ""
      }
    }
    
    func isValid() -> Bool {
        self == .valid ? true : false
    }
}
