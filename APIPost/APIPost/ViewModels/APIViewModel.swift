//
//  APIViewModel.swift
//  APIPost
//
//  Created by Thongchai Subsaidee on 27/7/2564 BE.
//

import Foundation

class APIViewModel: ObservableObject {
    
    
    func getApi() {
        APIService().api2 { result in
            switch result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
