//
//  CustomView.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

class CustomView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "defaultCell")
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: "customCell")
        tableView.backgroundColor = .systemGray3
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .systemGray
        addSubview(tableView)
        addSubview(textLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),

            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 200),
            textLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
