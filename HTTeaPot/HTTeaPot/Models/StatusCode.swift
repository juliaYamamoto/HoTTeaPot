//
//  StatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import Foundation

enum CodeType: String, Codable{
    case informational  = "1xx informational"
    case success        = "2xx success"
    case redirection    = "3xx redirection"
    case clientError    = "4xx client error"
    case serverError    = "5xx server error"
}

struct StatusCode: Codable {
    let code: String
    let title: String
    let description: String
    let type: String
    let source: String
}

struct AllStatusCode: Codable {
    let statusCode: [StatusCode]
}

