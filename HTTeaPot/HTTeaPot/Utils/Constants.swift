//
//  Constants.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-11.
//

import Foundation

class Constants: NSObject {

    public struct JSON {
        let fileName: String = "httpStatusCode"
    }
    
    public struct TypeName {
        let informational: String = "1xx informational"
        let success: String = "2xx success"
        let redirection: String = "3xx redirection"
        let clientError: String = "4xx client error"
        let serverError: String = "5xx server error"
    }
}
