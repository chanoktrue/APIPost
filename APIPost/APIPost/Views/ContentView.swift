//
//  ContentView.swift
//  APIPost
//
//  Created by Thongchai Subsaidee on 27/7/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var apiVM: APIViewModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                apiVM.getApi()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
