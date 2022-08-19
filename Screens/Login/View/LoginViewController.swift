//
//  loginViewController.swift
//  testSantander
//
//  Created by Paulo Lazarini on 23/05/22.
//

import UIKit

protocol LoginViewControllerProtocol {
    func presentAlert(errorMessage: String)
}

final class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    // MARK: Outlets
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // MARK: Properties
    
    private var presenter: LoginPresenterProtocol
    
    // MARK: Lifecycle
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Methods
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let username = userTextfield.text ?? ""
        let password = passwordTextfield.text ?? ""
        
        if self.presenter.isValidForm(username: username, password: password) {
            self.presenter.login(username: username, password: password)
        } else {
            self.presentAlert(message: "Usuário ou senha inválidos!")
        }
        

    }

    func presentAlert(errorMessage: String) {
        self.presentAlert(message: errorMessage)
    }
}

