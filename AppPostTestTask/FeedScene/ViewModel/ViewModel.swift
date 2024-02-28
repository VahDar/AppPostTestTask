//
//  ViewModel.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import Foundation

protocol ViewModelProtocol {
    var postData: [Post] { get set }
    
}

final class ViewModel: ViewModelProtocol {
    
    @Injected(\.networkService) var networkService
    var postData: [Post] = []
    
    init() {
        Task {
            await getLitData()
        }
    }
    
    private func getLitData() async {
        do {
            if let data = try await networkService.getPost().posts  {
                postData = data
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
}
