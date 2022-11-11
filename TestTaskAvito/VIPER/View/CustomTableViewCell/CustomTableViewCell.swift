//
//  CustomTableViewCell.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 09.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundMainBackView
        view.layer.borderWidth = 2
        view.layer.borderColor = Constants.Colors.borderMainBackView
        view.layer.cornerRadius = 21
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lowerStackView = LowerStackView()
    private lazy var averageStackView = AverageStackView()
    private lazy var upperStackView = UpperStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        upperStackView.nameLabel.text = nil
        upperStackView.phoneNumberLabel.text = nil
        upperStackView.skillsLabel.text = nil
    }

    func configure(with employee: Employee) {
        upperStackView.nameLabel.text = employee.name
        upperStackView.phoneNumberLabel.text = employee.phoneNumber
        upperStackView.skillsLabel.text = employee.skills.joined(separator: ", ")
    }
    
    private func setupViews() {
        backgroundColor = .systemGray3
        contentView.backgroundColor = .systemGray3
        contentView.addSubview(backView)
        contentView.addSubview(separatorView)
        backView.addSubview(lowerStackView)
        lowerStackView.addSubview(averageStackView)
        averageStackView.addSubview(upperStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                             constant: -6),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                              constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -8),
            
            separatorView.topAnchor.constraint(equalTo: backView.bottomAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            lowerStackView.topAnchor.constraint(equalTo: backView.topAnchor,
                                                constant: 10),
            lowerStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor,
                                                   constant: -10),
            lowerStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor,
                                                    constant: 10),
            lowerStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,
                                                     constant: -10),
            
            averageStackView.topAnchor.constraint(equalTo: lowerStackView.topAnchor,
                                                  constant: 9),
            averageStackView.bottomAnchor.constraint(equalTo: lowerStackView.bottomAnchor,
                                                     constant: -9),
            averageStackView.leadingAnchor.constraint(equalTo: lowerStackView.leadingAnchor,
                                                      constant: 9),
            averageStackView.trailingAnchor.constraint(equalTo: lowerStackView.trailingAnchor,
                                                       constant: -9),
            
            upperStackView.topAnchor.constraint(equalTo: averageStackView.topAnchor,
                                                constant: 2),
            upperStackView.bottomAnchor.constraint(equalTo: averageStackView.bottomAnchor,
                                                   constant: -2),
            upperStackView.leadingAnchor.constraint(equalTo: averageStackView.leadingAnchor,
                                                    constant: 65),
            upperStackView.trailingAnchor.constraint(equalTo: averageStackView.trailingAnchor,
                                                     constant: -16)
        ])
    }
}
