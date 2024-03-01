//
//  DetailScreenViewController.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 29.02.2024.
//

import UIKit

class DetailScreenViewController: UIViewController {

    // MARK: - Properties
    @Injected(\.viewModel) var viewModel
    
    // MARK: - Views
    private let detailImage: UIImageView = {
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    // MARKL - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Post"
        likeImage.image = UIImage(named: "like")
        likes.text = "\(viewModel.selectedPost?.likesCount ?? 0)"
        timeshamp.text = "\(viewModel.selectedPost?.timeshamp.formattedDate() ?? "0")"
        titleLabel.text = viewModel.selectedPost?.title
        textLabel.text = viewModel.selectedPost?.text
    }

    private func constreints() {
        
    }

}