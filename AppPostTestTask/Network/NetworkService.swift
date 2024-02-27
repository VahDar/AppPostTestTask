//
//  NetworkService.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPost() async throws -> PostsListModel
}

final class NetworkService: NetworkHTTPClient, NetworkServiceProtocol {
    
    func getPost() async throws -> PostsListModel {
        do {
            return try await fetchData(
                from: Endpoint.list.path,
                responseType: PostsListModel.self)
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            throw error
        }
    }
}
