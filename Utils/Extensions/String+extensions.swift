//
//  String+extensions.swift
//  testSantander
//
//  Created by Paulo Lazarini on 05/08/22.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        return self.contains("@")
    }
    
    func isValidCpf() -> Bool {
        if self.count != 11 {
            return false
        } else {
            return true
        }
    }
    
    func isValidPassword() -> Bool {
        // o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard texttest.evaluate(with: self) else { return false }
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard texttest1.evaluate(with: self) else { return false }
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        guard texttest2.evaluate(with: self) else { return false }
        
        return true
    }
}
