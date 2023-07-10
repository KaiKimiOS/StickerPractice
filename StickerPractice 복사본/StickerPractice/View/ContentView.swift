//
//  ContentView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                StickerMainView()
                
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
