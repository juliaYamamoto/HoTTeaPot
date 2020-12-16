//
//  JsonParser.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-11.
//

import Foundation

class JsonParser {
    
    static func from<T: Codable> (path: String, ofType: T.Type) -> T? {
        guard let jsonPath = Bundle.main.path(forResource: path, ofType: "json") else {
            return nil
        }
        
        do {
            guard let jsonData = try String(contentsOfFile: jsonPath).data(using: .utf8) else {
                return nil
            }
            
            let decodedData = try JSONDecoder().decode(ofType.self, from: jsonData)
            return decodedData
            
        } catch {
            print(error)
            return nil
        }
    }
}
