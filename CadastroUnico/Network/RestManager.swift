//
//  RestManager.swift
//  CadastroUnico
//
//  Created by Felipe Domingos on 22/09/22.
//

import Foundation
import Alamofire

class RestManager {
    func validateCep(url: String, cep: String, completion: @escaping (_ register: Register)-> Void) {
        AF.request("\(url)\(cep)/json/", method: .get).response { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(Register.self, from: data) else {return}
                completion(userData)
            }
        }
    }
}
