//
//  DetailScreenViewController.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 29.02.2024.
//

import UIKit
import SDWebImage

class DetailScreenViewController: UIViewController {

    // MARK: - Properties
    @Injected(\.viewModel) var viewModel
    
    // MARK: - Views
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textLabel: UILabel = {
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
    
    private let likes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeshamp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        constreints()
    }
    // MARKL - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Post"
        likeImage.image = UIImage(named: "like")
        imageView.sd_setImage(with: URL(string: viewModel.selectedPost?.postImage ?? ""))
        likes.text = "\(viewModel.selectedPost?.likesCount ?? 0)"
        timeshamp.text = "\(viewModel.selectedPost?.timeshamp.formattedDate() ?? "0")"
        titleLabel.text = viewModel.selectedPost?.title
        textLabel.text = viewModel.selectedPost?.text
    }

    private func constreints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [likeImage, likes, timeshamp, titleLabel, textLabel, imageView].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likeImage.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            likeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likeImage.widthAnchor.constraint(equalToConstant: 16),
            likeImage.heightAnchor.constraint(equalToConstant: 16),
            
            likes.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: likeImage.trailingAnchor, constant: 3),
            
            timeshamp.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            timeshamp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            
        ])
    }

}
