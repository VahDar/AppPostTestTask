//
//  PostViewController.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    var viewModel: ViewModelProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constraints()
    }

    // MARK: - View
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostViewCell.self, forCellReuseIdentifier: String(describing: PostViewCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - SetupUI and Constreints
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Post"
        
    }
    
    private func constraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - FetchData
    private func fetchData() {
        Task {
            await viewModel?.getLitData()
            tableView.reloadData()
        }
    }
    
    // MARK: - Setup TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostViewCell(style: .default, reuseIdentifier: String(describing: PostViewCell.self))
        let post = (viewModel?.postData[indexPath.row])!
        cell.selectionStyle = .none
        cell.expandButtonHandler = { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
            self?.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
        cell.configure(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
