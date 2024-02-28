//
//  PostViewCell.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var isExpanded = false
    var expandButtonHandler: (() -> Void)?
    private let bottomLayoutGuide = UILayoutGuide()
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let previewTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeshampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let expundButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Expand", for: .normal)
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let likesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Flow funcs
    
    func configure(with post: Post) {
        SetupUI()
        titleLabel.text = post.title
        previewTextLabel.text = post.previewText
        likesCountLabel.text = "\(post.likesCount)"
        timeshampLabel.text = "\(post.timeshamp.daysAgo())"
        previewTextLabel.numberOfLines = isExpanded ? 0 : 2
        expundButton.setTitle(isExpanded ? "Collapse" : "Expend" , for: .normal)
        
        if previewTextLabel.text?.count ?? 0 <= 100 {
            expundButton.isHidden = true
        } else {
            expundButton.isHidden = false
        }
    }
    
    private func SetupUI() {
        likeImage.image = UIImage(named: "like")
        expundButton.addTarget(self, action: #selector(expundButtonTapped), for: .touchUpInside)
    }
    
    @objc func expundButtonTapped() {
        isExpanded.toggle()
        previewTextLabel.numberOfLines = isExpanded ? 0 : 2
        previewTextLabel.layoutIfNeeded()
        expundButton.setTitle(isExpanded ? "Colapse" : "Expand", for: .normal)
        expandButtonHandler?()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
                contentView.addSubview(containerStack)
                containerStack.addArrangedSubview(titleLabel)
                containerStack.addArrangedSubview(previewTextLabel)
                containerStack.addArrangedSubview(bottomStack)
                likesStack.addArrangedSubview(likeImage)
                likesStack.addArrangedSubview(likesCountLabel)
                bottomStack.addArrangedSubview(likesStack)
                bottomStack.addArrangedSubview(timeshampLabel)
                containerStack.addArrangedSubview(expundButton)
                
                NSLayoutConstraint.activate([
                    containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                    containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                    likeImage.widthAnchor.constraint(equalToConstant: 16),
                    likeImage.heightAnchor.constraint(equalToConstant: 16)
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
