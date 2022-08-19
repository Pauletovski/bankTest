////
////  LoginManager.swift
////  testSantander
////
////  Created by Paulo Lazarini on 23/05/22.
////

import UIKit

protocol DashboardServiceDelegate {
    func presentDashboard(dashboard: [Dashboard])
}

typealias DashboardDelegate = DashboardServiceDelegate & UIViewController

class DashboardService {
    
    weak var delegate: DashboardDelegate?
    
    public func getDashboard() {
        guard let url = Constants.homeURL else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
        }
            do {
                let dashboard = try JSONDecoder().decode([Dashboard].self, from: data)
                self.delegate?.presentDashboard(dashboard: dashboard)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: DashboardDelegate) {
        self.delegate = delegate
    }
}
    
    
