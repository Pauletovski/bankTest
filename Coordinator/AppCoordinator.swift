//
//  AppCoordinator.swift
//  testSantander
//
//  Created by Paulo Lazarini on 07/08/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    var currentViewController: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(presenter: loginPresenter)
        loginPresenter.viewController = loginViewController
        
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        
        currentViewController = loginViewController
    }
}

extension AppCoordinator: LoginCoordinatorProtocol {
    func navigateToHome() {
        let homeViewController = ViewController()
        currentViewController?.present(homeViewController, animated: true, completion: { [weak self] in
            self?.currentViewController = homeViewController
        })
    }
}
