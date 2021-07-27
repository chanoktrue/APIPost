//
//  APIService.swift
//  APIPost
//
//  Created by Thongchai Subsaidee on 27/7/2564 BE.
//

import Foundation

enum AuthError: Error {
    case noData
    case custom(message: String)
}

struct APIService {

    let identifyId = "xxxx"
    let urlString = "xxxx"
    
    
    
    var url: URL {
        let url = URL(string: urlString)!
        return url
    }
    
    var dict: [String: String] {
        let dict = ["identity_id": identifyId]
        return dict
    }
    
    func api() {

        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        request.httpBody = data
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let json = try JSONDecoder().decode(APIModel.self, from: data)
                print(json.message)
            }catch{
                print("")
            }
        }
        
        task.resume()
        
    }
    
    func api2(completion: @escaping (Result<APIModel, AuthError>) -> ()) {
        
        func getPostString() -> String {
            var data = [String]()
            for(key, value) in dict {
                data.append(key + "=\(value)")
            }
            return data.map({String($0)}).joined(separator: "&")
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        let bodyString = getPostString()
        let bodyData = bodyString.data(using: .utf8)
        request.httpBody = bodyData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        
            guard let data = data, error == nil else {
                completion(.failure(.custom(message: error?.localizedDescription ?? "")))
                return
            }
            
            do{
                let json = try JSONDecoder().decode(APIModel.self, from: data)
                completion(.success(json))
            }catch{
                completion(.failure(.custom(message: error.localizedDescription )))
            }
            
        }
        
        task.resume()
        
    }
    

}
