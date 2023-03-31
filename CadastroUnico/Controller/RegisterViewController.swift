//
//  ViewController.swift
//  CadastroUnico
//
//  Created by Felipe Domingos on 22/09/22.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var cepField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var districtField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    
    var viewModel = RegisterViewModel()
    
    let baseUrl: String = "https://viacep.com.br/ws/"

    override func viewDidLoad() {
        super.viewDidLoad()
        cepField.delegate = self
    }
}

// extendendo delegates de textfields:
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.validateCepField(textField: cepField, url: baseUrl, cep: cepField.text ?? "") { register in
            self.addData(register: register)
        }
    }
    
    func addData(register: Register) {
        streetField.text = register.logradouro
        districtField.text = register.bairro
        cityField.text = register.localidade
        stateField.text = register.uf
    }
}
