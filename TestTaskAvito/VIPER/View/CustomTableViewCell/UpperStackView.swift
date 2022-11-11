//
//  UpperStackView.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 11.11.2022.
//

import UIKit

class UpperStackView: UIStackView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 22)
        label.textAlignment = .center
        return label
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkerFelt-Wide", size: 20)
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
        spacing = 22
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(nameLabel)
        addArrangedSubview(phoneNumberLabel)
        addArrangedSubview(skillsLabel)
    }
}
