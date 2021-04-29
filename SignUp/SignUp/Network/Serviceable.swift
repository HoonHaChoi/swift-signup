//
//  Serviceable.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation
import Combine

protocol Serviceable {
    func request(_ url: URL?) -> Future<String, Never>
    func getResource(url : URL?, complete: @escaping (Data) -> ())
}
