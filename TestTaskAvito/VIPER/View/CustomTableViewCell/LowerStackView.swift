//
//  LowerStackView.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 11.11.2022.
//

import UIKit

class LowerStackView: UIStackView {

    private lazy var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundNameBackView
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.Colors.borderNameBackView
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()

    private lazy var phoneView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundPhoneBackView
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.Colors.borderPhoneBackView
        return view
    }()

    private lazy var skillsView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundSkillsBackView
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.Colors.borderSkillsBackView
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        alignment = .fill
        axis = .vertical
        distribution = .fillEqually
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(nameView)
        addArrangedSubview(phoneView)
        addArrangedSubview(skillsView)
    }
}
