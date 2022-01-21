//
//  NetworkRequest.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/20.
//

import Foundation

enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

// [TODO] Reponse 리턴하도록 변경
func networkRequest(url: URL, method: RequestMethod, data: Data) async throws -> (Data, URLResponse)? {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return try? await URLSession.shared.data(for: request, delegate: nil)
}

func signUpRequest(data: Data) async -> HTTPURLResponse? {
    let url = URL(string: "https://api.codesquad.kr/signup")!
    let result = try? await networkRequest(url: url, method: .POST, data: data)
    if let (_, response) = result {
        return response as? HTTPURLResponse
    }
    return nil
}

