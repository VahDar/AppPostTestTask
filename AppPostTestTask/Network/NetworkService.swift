//
//  NetworkService.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPost() async throws -> PostsListModel
    func getDetail(id: String) async throws -> DetailScreenModel
}

final class NetworkService: NetworkHTTPClient, NetworkServiceProtocol {
    
    
    
    func getPost() async throws -> PostsListModel {
        do {
            return try await fetchData(
                from: Endpoint.list.path, requestMethod: RequestMethod.get,
                responseType: PostsListModel.self)
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            throw error
        }
    }
    
    func getDetail(id: String) async throws -> DetailScreenModel {
        do {
            return try await fetchData(from: Endpoint.detail(id: id).path, requestMethod: RequestMethod.get, responseType: DetailScreenModel.self)
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            throw error
        }
    }
}
