//
//  request.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/03/29.
//

import Foundation
import Combine

class Service : Serviceable {
    
    func request(_ url: URL?) -> Future<String, Never> {
        return Future<String, Never> { promise in
            self.getResource(url: url) { (result) in
                promise(.success(String(data: result, encoding: .utf8) ?? ""))
            }
        }
    }
      
    func getResource(url : URL?, complete: @escaping (Data) -> ())  {
        guard let url = url else { return }

        URLSession.shared.dataTask(with: url) { data, res, error in
            guard error == nil else {
                return
            }
            guard let response = res as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return
            }
            guard let data = data else {
                return
            }
            complete(data)
        }.resume()
    }
}



