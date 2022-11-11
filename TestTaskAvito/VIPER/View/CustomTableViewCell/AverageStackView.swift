//
//  AverageStackView.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 11.11.2022.
//

import UIKit

class AverageStackView: UIStackView {

    private lazy var stackViewForImages: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var stackViewForViews: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 21
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()

    private lazy var phoneView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 21
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner,
        ]
        return view
    }()

    private lazy var skillsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 21
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner,
            .layerMaxXMaxYCorner
        ]
        return view
    }()

    private lazy var nameImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .label
        imageView.layer.cornerRadius = 21
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .label
        imageView.layer.cornerRadius = 21
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var skillsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gear.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .label
        imageView.layer.cornerRadius = 21
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        alignment = .fill
        axis = .horizontal
        spacing = 7
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(stackViewForImages)
        addArrangedSubview(stackViewForViews)
        stackViewForImages.addArrangedSubview(nameImage)
        stackViewForImages.addArrangedSubview(phoneImage)
        stackViewForImages.addArrangedSubview(skillsImage)
        stackViewForViews.addArrangedSubview(nameView)
        stackViewForViews.addArrangedSubview(phoneView)
        stackViewForViews.addArrangedSubview(skillsView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameImage.heightAnchor.constraint(equalToConstant: 42),
            nameImage.widthAnchor.constraint(equalToConstant: 42),
        ])
    }
}
