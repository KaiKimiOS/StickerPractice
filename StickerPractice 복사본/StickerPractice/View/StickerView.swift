//
//  StickerView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI

struct StickerView: View {
    
    var sticker: StickerData
    var stickerViewModel : StickerViewModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading){
                
                Text(sticker.memo)
                    .font(.title)
                    .padding()
                
                Text(sticker.dateformat)
                    .font(.caption)
                    .padding()
                
            }
            
            //            .padding()
            Spacer()
            
            
        }
        .background(sticker.color)
        .cornerRadius(20)
        .contextMenu{
            
            Button {
                stickerViewModel.removeFunction(sticker)
                
            } label: {
                Text("Remove")
                Image(systemName: "trash.slash")
            }
            
        }
        
    }
}

//struct StickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        StickerView(stickerStore: StickerStore(), sticker: Stickerli(memo: "Hello", date: Date()))
//    }
//}
