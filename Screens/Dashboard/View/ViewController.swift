//
//  ViewController.swift
//  testSantander
//
//  Created by Paulo Lazarini on 31/05/22.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LoginServiceDelegate, DashboardServiceDelegate {
    
    
    var coordinator: Coordinator?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nomeConta: UILabel!
    @IBOutlet weak var numeroConta: UILabel!
    @IBOutlet weak var saldoConta: UILabel!
    
    var dashboardService = DashboardService()
    
    var login = LoginService()
    
    private var users = [User]()
    
    private var dashboard = [Dashboard]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        dashboardService.setViewDelegate(delegate: self)
        dashboardService.getDashboard()
        
        login.setViewDelegate(delegate: self)
        login.getUsers()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        tableView.reloadData()

        
        
    }
    
    func presentDashboard(dashboard: [Dashboard]) {
        self.dashboard = dashboard
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func presentUsers(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.nomeConta.text? = users[0].customerName
            self.numeroConta.text? = users[0].accountNumber
            self.saldoConta.text? = "R$ \(users[0].checkingAccountBalance)"
        }
    }


    
    @IBAction func logoutButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        
        cell.paymentDate.text = dashboard[indexPath.row].paymentDate
        cell.valorConta.text = dashboard[indexPath.row].electricityBill
        cell.contaDeLuz.text = "Conta de Luz"
        
        return cell
    }
}
