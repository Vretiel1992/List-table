//
//  EmployeeViewController.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

// ViewController
// Protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with parse: JSONContainer)
    func update(with error: String)
}

class EmployeeViewController: UIViewController {

    var presenter: AnyPresenter?
    private var employees: [Employee] = []
    private let customView = CustomView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }
}

extension EmployeeViewController: AnyView {
    
    func update(with parse: JSONContainer) {
        print("got employees")
        DispatchQueue.main.async {
            self.employees = parse.company.employees
            self.customView.tableView.reloadData()
            self.customView.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.employees = []
            self.customView.textLabel.text = error
            self.customView.tableView.isHidden = true
            self.customView.textLabel.isHidden = false
        }
    }
}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "customCell",
            for: indexPath
        ) as? CustomTableViewCell else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "defaultCell",
                for: indexPath
            )
            return cell
        }
        let employees = employees[indexPath.row]
        cell.configure(with: employees)
        return cell
    }
}

extension EmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
