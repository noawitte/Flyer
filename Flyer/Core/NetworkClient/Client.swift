//
//  Client.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import Foundation

enum ClientError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

@Observable
class Client {
    /// Fetch and decode any Decodable model from a URL
    func get<T: Decodable>(_ path: String, baseURL: URL = URL(string: "https://api.example.com")!) async throws -> T {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw ClientError.invalidResponse
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Decoding error: \(error)")
            throw ClientError.decodingError
        }
    }

    /// Generic mock loader using any factory block
    func mock<T>(_ builder: () -> T) async -> T {
        return builder()
    }
}
