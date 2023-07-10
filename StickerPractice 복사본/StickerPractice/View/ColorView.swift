//
//  ColorView.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI

struct ColorView: View {
    
   @Binding var selectedColor: Color
    var color: Color
    
    var body: some View {
        
        Button {
            // Buttond의 Action이 좀 길어질듯하면
            // 따로 method만들어 호출하는 편이 좋다
           selectedColor = color
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(color)
                    .shadow(radius: 6)
                    .frame(height: 60)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }

        
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(selectedColor: .constant(.blue), color: .blue)
    }
}
