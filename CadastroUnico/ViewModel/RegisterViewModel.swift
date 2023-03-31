//
//  RegisterViewModel.swift
//  CadastroUnico
//
//  Created by Felipe Domingos on 23/09/22.
//

import Foundation
import UIKit

class RegisterViewModel {
    
    var rest = RestManager()
    
    func validateCepField(textField: UITextField, url: String, cep: String, completion: @escaping (_ register: Register) -> Void) {
        if textField.text?.isEmpty == false && textField.endEditing(true) {
            rest.validateCep(url: url, cep: cep) { register in
                completion(register)
            }
        }
    }
}
