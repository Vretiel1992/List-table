//
//  EmployeesTableViewHeader.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 12.11.2022.
//

import UIKit

class EmployeesTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - Private Properties

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundLogoBackView
        view.layer.borderWidth = 3
        view.layer.borderColor = Constants.Colors.borderLogoBackView
        view.layer.cornerRadius = 21
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundSecondary
        view.layer.cornerRadius = 21
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.label.cgColor
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Constants.Images.avitoLogo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.aeroport60Bold
        label.textAlignment = .left
        label.minimumScaleFactor = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override Methods

    override func prepareForReuse() {
        logoLabel.text = nil
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
        logoView.layer.borderColor = UIColor.label.cgColor
    }

    // MARK: - Public Methods

    func configure(with company: Company) {
        logoLabel.text = company.name
    }

    // MARK: - Private Methods

    private func setupViews() {
        addSubview(backView)
        addSubview(separatorView)
        backView.addSubview(logoView)
        logoView.addSubview(logoImageView)
        logoView.addSubview(logoLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                             constant: -6),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),

            separatorView.topAnchor.constraint(equalTo: backView.bottomAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),

            logoView.topAnchor.constraint(equalTo: backView.topAnchor,
                                          constant: 10),
            logoView.bottomAnchor.constraint(equalTo: backView.bottomAnchor,
                                             constant: -10),
            logoView.leadingAnchor.constraint(equalTo: backView.leadingAnchor,
                                              constant: 10),
            logoView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,
                                               constant: -10),

            logoImageView.topAnchor.constraint(equalTo: logoView.topAnchor,
                                               constant: 14),
            logoImageView.trailingAnchor.constraint(equalTo: logoView.centerXAnchor,
                                                    constant: -55),
            logoImageView.widthAnchor.constraint(equalToConstant: 52),
            logoImageView.heightAnchor.constraint(equalToConstant: 52),

            logoLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor,
                                               constant: 5),
            logoLabel.topAnchor.constraint(equalTo: topAnchor),
            logoLabel.widthAnchor.constraint(equalToConstant: 160),
            logoLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}
