//
//  APIModel.swift
//  APIPost
//
//  Created by Thongchai Subsaidee on 27/7/2564 BE.
//

import SwiftUI

struct APIModel: Codable {
    let status: Bool
    let code: Int
    let message: String
    let data: [APIData]
}

struct APIData: Codable {
    let policyName: String
    let policyArn: String
}
