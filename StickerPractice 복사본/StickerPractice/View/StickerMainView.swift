//
//  StickerMainView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI

struct StickerMainView: View {
    
    
    @State var addTrueFalse:Bool = false
    @State var editTrueFalse: Bool = false
    @State var sticker: StickerData = StickerData(memo: "First", date: Date())
    @StateObject var stickerLists: StickerViewModel = StickerViewModel()
    
    var body: some View {
        
        VStack{
            List(stickerLists.stickerlists) { list in
                
                Button {
                    self.sticker = list
                    editTrueFalse = true
                } label: {
                    StickerView(sticker: list, stickerViewModel: stickerLists)
                }
                
                
                
            }
        }
        
        .listStyle(.plain)
        .navigationTitle("Sticker")
        .toolbar {
            ToolbarItem {
                Button {
                   
                    addTrueFalse = true
                } label: {
                    Label("추가", systemImage: "plus")
                    
                }
                
            }
        }
        .sheet(isPresented: $addTrueFalse) {
            AddView(sheetTrueFalse: $addTrueFalse, stickerViewModel: stickerLists)
    
        }
        .sheet(isPresented: $editTrueFalse) {
            EditView(editTrueFalse: $editTrueFalse, stickerViewModel: stickerLists, sticker: $sticker, selectedColor: $sticker.color)
        }
        .refreshable {
            stickerLists.fetchStickers()
        }
        .onAppear {
            stickerLists.fetchStickers()
        }
       
        
    }
    
    
}

struct StickerMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            StickerMainView()
        }
    }
}
