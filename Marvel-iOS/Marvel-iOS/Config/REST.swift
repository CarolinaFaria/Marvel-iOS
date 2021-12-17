//
//  REST.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import Foundation

enum CharacterError{
    case urlError
    case dataError
    case responseError
    case serverError
    case error
}

class REST {
    // deixar como variavel de ambiente
    private static let basePath = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=37f8b1d0d0197e41efecfb2245031783&hash=ad0e328330fbdb456863c0a685e7dbb6&limit=100"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadCharacters(onComplete: @escaping ([Result]?) -> Void, onError: @escaping (CharacterError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.urlError)
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.responseError)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        return }
                    do {
                        let requestData = try JSONDecoder().decode(Request.self, from: data)
                        let data = requestData.data
                        let characters = data.results
                        onComplete(characters)
                    } catch {
                        print(error.localizedDescription)
                        onError(.dataError)
                    }
                } else {
                    print("Algum status inválido pelo servidor!!")
                    onError(.serverError)
                }
            } else {
                print(error!)
                onError(.error)
            }
        }
        dataTask.resume()
    }
}
