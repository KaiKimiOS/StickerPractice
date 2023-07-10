//
//  EditView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI

struct EditView: View {
    @Binding var editTrueFalse: Bool
    @State var stickerViewModel:StickerViewModel
    
    @Binding var sticker: StickerData
    
    @Binding var selectedColor: Color
    @State var text: String = ""
    
    var color: [Color]  = [.blue,.brown,.orange,.green,.mint]
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("Select Color").font(.title)
                
                
                
                HStack {
                    ForEach(color, id:\.self) { color in
                        
                        ColorView(selectedColor: $selectedColor, color: color)
                        
                    }
                    
                }
                Text("Write Memo").font(.title)
                TextField("메모를 입력해주세요", text: $sticker.memo, axis: .vertical)
                    .padding()
                    .font(.title)
                Spacer()
                
            }
            .navigationTitle("Edit Sticker")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem {
                    Button {
                        
                       //변경안했는데 완료하면 다시 그대로
                        sticker.color = selectedColor
                        sticker.memo = sticker.memo
                        sticker.date = Date()
                        stickerViewModel.updateSticker(sticker)
                        editTrueFalse = false
                       }
                label: {
                    Text("완료")
                }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button {
                        editTrueFalse = false
                    } label: {
                        Text("취소")
                        
                    }
                    
                }
            }
            
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
