//
//  File.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/09.
//

import SwiftUI

struct StickerData: Codable, Identifiable {
    
    var id : UUID = UUID()
    var memo: String
    var date: Date
    var dateformat: String {
        
        let dateString: DateFormatter = DateFormatter()
        
        dateString.dateFormat = "yyyy-MM-dd-EEEE"
        return dateString.string(from: date)
        
        
    }
    
    var colorIndex: Int = 0
    
    var color: Color {
        
        
        get {
            switch colorIndex {
            case 0 :
                return .blue
            case 1:
                return .brown
            case 2:
                return .orange
            case 3:
                return .green
            case 4:
                return .mint
            default:
                return .white
            }
            
            
        }
        
        set {
            switch newValue {
                
            case .blue:
                colorIndex = 0
            case .brown:
                colorIndex = 1
            case .orange:
                colorIndex = 2
            case .green:
                colorIndex = 3
                
            case .mint:
                colorIndex = 4
            default :
                colorIndex = 5
                
            }
            
            
            
        }
    }
    
}
