//
//  ViewModel.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import Foundation

protocol ViewModelProtocol {
    var postData: [Post] { get set }
    var selectedPost: DetailPost? { get set }
    var didSelectPost: ((Int) -> Void)? { get set }
    var currentPost: Int? { get set }
    func getDetailScreen(id: Int) async
    func getLitsData() async
    func toSelectedPost()
}

final class ViewModel: ViewModelProtocol {
    
    @Injected(\.networkService) var networkService
    var postData: [Post] = []
    var selectedPost: DetailPost?
    var didSelectPost: ((Int) -> Void)?
    var currentPost: Int?
    
     func getLitsData() async {
        do {
            if let data = try await networkService.getPost().posts  {
                postData = data
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func getDetailScreen(id: Int) async {
        do {
            let data = try await networkService.getDetail(id: "\(id)")
            selectedPost = data.post
            print(selectedPost!)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func toSelectedPost() {
        didSelectPost = { [weak self] postID in
            Task { [self] in
                if let strongSelf = self {
                    await strongSelf.getDetailScreen(id: postID)
                }
            }
        }
    }
}
