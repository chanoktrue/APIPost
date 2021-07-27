//
//  APIPostApp.swift
//  APIPost
//
//  Created by Thongchai Subsaidee on 27/7/2564 BE.
//

import SwiftUI

@main
struct APIPostApp: App {
    
    @ObservedObject var apiVM = APIViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(apiVM)
        }
    }
}
