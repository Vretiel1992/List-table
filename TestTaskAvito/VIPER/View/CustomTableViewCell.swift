//
//  CustomTableViewCell.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 09.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Aeroport-Bold", size: 24)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        print(skillsLabel.contentHuggingPriority(for: .horizontal))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        phoneNumberLabel.text = nil
        skillsLabel.text = nil
    }
    
    func configure(with employee: Employee) {
        nameLabel.text = employee.name
        phoneNumberLabel.text = employee.phoneNumber
        skillsLabel.text = employee.skills.joined(separator: ", ")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(skillsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            stackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
        ])
    }
}
