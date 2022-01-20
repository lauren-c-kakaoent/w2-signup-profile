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
func networkRequest(url: URL, method: RequestMethod, data: Data) {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let task = URLSession.shared.uploadTask(with: request, from: data) { data, response, error in
        if let error = error {
            print("error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
               (200...299).contains(response.statusCode) else {
               print ("server error")
               return
       }
       if let mimeType = response.mimeType,
           mimeType == "application/json",
           let data = data,
           let dataString = String(data: data, encoding: .utf8) {
           print ("got data: \(dataString)")
       }

    }
    task.resume()
}

func signUpRequest(data: Data) {
    let url = URL(string: "https://api.codesquad.kr/signup")!
    return networkRequest(url: url, method: .POST, data: data)
}

