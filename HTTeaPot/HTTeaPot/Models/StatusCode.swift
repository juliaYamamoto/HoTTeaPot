//
//  StatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import Foundation

struct StatusCode: Codable {
    
    // MARK: - Properties
    
    let code: String
    let title: String
    let description: String
    let type: String
    let source: String
}
