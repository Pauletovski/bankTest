import UIKit

protocol LoginServiceDelegate {
    func presentUsers(users: [User])
}

typealias ServiceDelegate = LoginServiceDelegate & UIViewController

class LoginService {
    
    weak var delegate: ServiceDelegate?
    
    public func getUsers() {
        guard let url = Constants.userURL else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self.delegate?.presentUsers(users: users)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: ServiceDelegate) {
        self.delegate = delegate
    }
}


