//
//  StickerViewModel.swift
//  StickerPractice
//
//  Created by kaikim on 2023/07/10.
//

import SwiftUI


class StickerViewModel: ObservableObject {
    
    
   @Published var stickerlists: [StickerData] =  [
    
    StickerData(memo: "안녕", date: Date()),
    StickerData(memo: "스티커야", date: Date())
    
    ]
    
    
    func addFunction(memo:String, color: Color) {
        
        var newMemo = StickerData(memo: memo, date: Date())
        newMemo.color = color
        stickerlists.insert(newMemo, at: 0)
        saveStickers()
        
    }
    
    func removeFunction(_ sticker:StickerData) {
        
        var index = 0
        
        for i in stickerlists {
            
            
            if i.id == sticker.id {
                stickerlists.remove(at: index)
                saveStickers()
                break
            }
            
            index += 1
        }
        
        
    }
    
    
    func updateSticker(_ sticker: StickerData) {
        var index: Int = 0
        
        for tempSticker in stickerlists {
            
            if tempSticker.id == sticker.id {
//                stickers[index] = sticker
                stickerlists.remove(at: index)
                stickerlists.insert(sticker, at:0)
                saveStickers()
                break
            }
            
            index += 1
        }
    }
    
    
    func fetchStickers() {
        // UserDefaults의 데이터를 가져오는 국룰 코드
        do {
            // UserDefaults에서 "Stickers"라는 key의 값을 가져오는데
            // 이 value는 어떤 타입인지를 따로 알려주니는 않는다
            // JSON을 인코딩해서 Data 만들어 저장한거니까
            // 우리는 미리 이것이 Data 타입이라고 생각하고
            // 형 변환 (as? Data)과 관련된 if let 옵셔널 바인딩 처리로
            // 올바르게 Data 타입의 data 인스턴스가 잡혔을때만 관련 처리를 진행한다
            if let data = UserDefaults.standard.object(forKey: "Stickers") as? Data {
                let decoder: JSONDecoder = JSONDecoder()
                stickerlists = try decoder.decode([StickerData].self, from: data)
            }
        } catch {
            print("UserDefaults로 부터 데이터 가져오기 실패")
        }
    }
    
    func saveStickers() {
        // JSON으로 배열 등등의 복잡 데이터를 단일한 데이터로 만들어준다
        // 앞으로도 이런거 있으면 이 코드 복붙하자!
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(stickerlists)
            
            // 지금은 UserDefaults에 저장하지만,
            // 나중엔 이 부분이 외부의 클라우드 등등에 접속하는 코드로
            // 다양하게 바뀔 수 있다
            UserDefaults.standard.set(data, forKey: "Stickers")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
    }
}
