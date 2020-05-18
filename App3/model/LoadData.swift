//
//  LoadData.swift
//  App3
//
//  Created by Vương Toàn Bắc on 5/15/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

class LoadData{
    var userData = [DataJ]()
    
    func readJson(completion: @escaping ([DataJ]?) -> Void) {
        
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([DataJ].self, from: data)
                completion(dataFromJson)
                print(dataFromJson)
            } catch {
                print(error)
            }
        }
    }
    
    
}
