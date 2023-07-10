//
//  AddView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI

struct AddView: View {
    
    @Binding var sheetTrueFalse: Bool
    
    var stickerViewModel: StickerViewModel
    
    @State var selectedColor: Color = .blue
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
                TextField("메모를 입력해주세요", text: $text, axis: .vertical)
                    .padding()
                    .font(.title)
                Spacer()
                
            }
            .navigationTitle("Add Sticker")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem {
                    Button {
                        sheetTrueFalse = false
                        stickerViewModel.addFunction(memo: text, color: selectedColor)
                    } label: {
                        Text("완료")
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button {
                        sheetTrueFalse = false
                    } label: {
                        Text("취소")
                        
                    }
                    
                }
            }
            
        }
    }
}
//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            AddView(sheetTrueFalse: .constant(false), text: "메모를 입력하세요",stickerViewModel: )
//        }
//    }
//}
