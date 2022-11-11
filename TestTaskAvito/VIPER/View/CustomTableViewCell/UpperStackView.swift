//
//  UpperStackView.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 11.11.2022.
//

import UIKit

class UpperStackView: UIStackView {

    // MARK: - Public Properties

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.futura22Bold
        label.textAlignment = .center
        return label
    }()

    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.americanTypewriter20Bold
        label.textAlignment = .center
        return label
    }()

    lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.markerFelt20Wide
        label.textAlignment = .center
        label.minimumScaleFactor = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        if #available(iOS 14.0, *) {
            label.lineBreakStrategy = .hangulWordPriority
        }
        label.numberOfLines = 2
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupViews() {
        alignment = .fill
        axis = .vertical
        spacing = 22
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(nameLabel)
        addArrangedSubview(phoneNumberLabel)
        addArrangedSubview(skillsLabel)
    }
}
