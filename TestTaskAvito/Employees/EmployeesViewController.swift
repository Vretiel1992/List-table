//
//  EmployeesViewController.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

protocol EmployeesViewInput: AnyObject {
    func update(with companyModel: CompanyModel)
    func update(with error: String)
}
    
protocol EmployeesViewOutput: AnyObject {
    func viewDidLoad()
}

class EmployeesViewController: UIViewController {

    // MARK: - Public Properties

    var presenter: EmployeesViewOutput?

    // MARK: - Private Properties

    private var company: Company?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: Constants.Text.defaultCell)
        tableView.register(EmployeesTableViewCell.self,
                           forCellReuseIdentifier: Constants.Text.customCell)
        tableView.register(EmployeesTableViewHeader.self,
                           forHeaderFooterViewReuseIdentifier: Constants.Text.customHeader)
        tableView.backgroundColor = Constants.Colors.backgroundPrimary
        tableView.isHidden = true
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var updateButton: UIButton = {
        let button = UIButton()
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .systemBlue
            config.baseForegroundColor = .white
            config.cornerStyle = .capsule
            config.title = "update view..."
            button.addTarget(self,
                             action: #selector(updateView(parametrSender:)),
                             for: .touchUpInside)
            button.configuration = config
        } else {
            button.setTitle("update view...",
                            for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.isHighlighted = true
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 25
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.addTarget(self,
                             action: #selector(updateView(parametrSender:)),
                             for: .touchUpInside)
        }
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        view.backgroundColor = Constants.Colors.backgroundApp
        view.addSubview(tableView)
        view.addSubview(textLabel)
        view.addSubview(updateButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                              constant: -30),
            textLabel.widthAnchor.constraint(equalToConstant: 200),
            textLabel.heightAnchor.constraint(equalToConstant: 50),

            updateButton.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            updateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                 constant: 30),
            updateButton.widthAnchor.constraint(equalToConstant: 200),
            updateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Object Methods

    @objc func updateView(parametrSender: Any) {
        presenter?.viewDidLoad()
    }
}

// MARK: - EmployeesViewInput

extension EmployeesViewController: EmployeesViewInput {

    func update(with companyModel: CompanyModel) {
        DispatchQueue.main.async {
            self.company = companyModel.company
            self.company?.employees.sort(by: < )
            self.tableView.reloadData()
            self.updateButton.isHidden = true
            self.textLabel.isHidden = true
            self.tableView.isHidden = false
        }
    }

    func update(with error: String) {
        DispatchQueue.main.async {
            self.company = nil
            self.textLabel.text = error
            self.tableView.isHidden = true
            self.textLabel.isHidden = false
            self.updateButton.isHidden = false
        }
    }
}

// MARK: - UITableViewDataSource

extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        company?.employees.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Text.customCell,
            for: indexPath
        ) as? EmployeesTableViewCell else {
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

extension EmployeesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        206
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: Constants.Text.customHeader
        ) as? EmployeesTableViewHeader else {
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
