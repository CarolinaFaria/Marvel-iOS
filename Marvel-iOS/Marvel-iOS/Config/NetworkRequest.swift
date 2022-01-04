//
//  REST.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import Foundation

enum GenericError: Error {
    case urlError
    case dataError
    case responseError
    case serverError
}

class NetworkRequest {
    
    private let basePath = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=37f8b1d0d0197e41efecfb2245031783&hash=ad0e328330fbdb456863c0a685e7dbb6&limit=50"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private let session = URLSession(configuration: configuration)

    
    func fetchGenericData<T: Decodable> (completion: @escaping (T) -> (),onError: @escaping (GenericError) -> Void){
        guard let url = URL(string: self.basePath) else {
            onError(.urlError)
            return
        }
        let dataTask = self.session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let response = response as? HTTPURLResponse,
                  let data = data
            else {
                onError(.responseError)
                    return
                }
                if response.statusCode == 200 {
                    do {
                        let object = try JSONDecoder().decode(T.self, from: data)
                        completion(object)
                    } catch {
                        onError(.dataError)
                    }
                } else {
                    onError(.serverError)
                }
        }
        dataTask.resume()
    }
}
