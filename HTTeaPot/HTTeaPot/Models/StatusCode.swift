//
//  StatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import Foundation

enum CodeType: String{
    case informational = "1xx informational"
    case success = "2xx success"
    case redirection = "3xx redirection"
    case clientError = "4xx client Error"
    case serverError = "5xx server Error"
}

struct StatusCode {
    let code: String
    let title: String
    let description: String
    let type: CodeType
    let source: String
}
