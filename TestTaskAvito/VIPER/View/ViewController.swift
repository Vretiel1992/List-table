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
    
    func update(with viewModel: ViewModel)
    func update(with error: String)
}

class EmployeeViewController: UIViewController {

    // MARK: - Public Properties

    var presenter: AnyPresenter?

    // MARK: - Private Properties
    private var company: Company?
//    private var employees: [Employee] = []
    private lazy var customView = CustomView()

    // MARK: - Lifecycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }
}

// MARK: - AnyView

extension EmployeeViewController: AnyView {

    func update(with viewModel: ViewModel) {
        print("got company")
        DispatchQueue.main.async {
            self.company = viewModel.company
            self.company?.employees.sort(by: < )
            self.customView.tableView.reloadData()
            self.customView.tableView.isHidden = false
        }
    }

    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.company = nil
            self.customView.textLabel.text = error
            self.customView.tableView.isHidden = true
            self.customView.textLabel.isHidden = false
        }
    }
}

// MARK: - UITableViewDataSource

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        company?.employees.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Text.customCell,
            for: indexPath
        ) as? CustomTableViewCell else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.Text.defaultCell,
                for: indexPath
            )
            return cell
        }
        
        if let employees = company?.employees {
            cell.configure(with: employees[indexPath.row])
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension EmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        206
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: Constants.Text.customHeader
        ) as? CustomTableViewHeader else {
            return nil
        }
        if let company = company {
            view.configure(with: company)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        company != nil ? 100 : 0
    }
}
