import Foundation
import UIKit

protocol LoginCoordinatorProtocol {
    func navigateToHome()
}

protocol LoginPresenterProtocol {
    func login(username: String, password: String)
    func isValidForm(username: String, password: String) -> Bool
}

final class LoginPresenter: LoginPresenterProtocol {
    

    var viewController: LoginViewControllerProtocol?
    var coordinator: LoginCoordinatorProtocol
    
     
    init(coordinator: LoginCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    

    func login(username: String, password: String) {

        if !username.isValidEmail() {
            print("Email errado")
        } else if !password.isValidPassword() {
            print("Senha errada")
        } else {
            print("Deu certo!")
            self.coordinator.navigateToHome()
        }
    }
    
    func isValidForm(username: String, password: String) -> Bool {
        return isValid(username: username) && password.isValidPassword()
    }
    
    private func isValid(username: String) -> Bool {
        return username.isValidEmail() || username.isValidCpf()
    }
}
