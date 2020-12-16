//
//  TestObject.swift
//  HTTeaPotTests
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import Foundation
@testable import HTTeaPot

class TestObject {
    
    // MARK: - Status Code Fakes
    
    public let statusCode100 = StatusCode(code: "100", title: "continue", description: "description 100", type: "1xx informational", source: "source 100")
    public let statusCode101 = StatusCode(code: "101", title: "switching protocols", description: "description 101", type: "1xx informational", source: "source 101")
    public let statusCode102 = StatusCode(code: "102", title: "processing", description: "description 102", type: "1xx informational", source: "source 102")

    public let statusCode200 = StatusCode(code: "200", title: "OK", description: "description 200", type: "2xx success", source: "source 200")
    public let statusCode201 = StatusCode(code: "201", title: "created", description: "description 201", type: "2xx success", source: "source 201")
    public let statusCode202 = StatusCode(code: "202", title: "accepted", description: "description 202", type: "2xx success", source: "source 202")

    public let statusCode300 = StatusCode(code: "300", title: "multiple choices", description: "description 300", type: "3xx redirection", source: "source 300")

    public let statusCode400 = StatusCode(code: "400", title: "bad request", description: "description 400", type: "4xx client error", source: "source 400")
    public let statusCode418 = StatusCode(code: "418", title: "I'm a teapot", description: "description 418", type: "4xx client error", source: "source 418")

    public let statusCode500 = StatusCode(code: "500", title: "internal server error", description: "description 500", type: "5xx client error", source: "source 500")
    
    
    // MARK: - All Status Code Fake
    public let allStatusCode = AllStatusCode(statusCode: [TestObject().statusCode100, TestObject().statusCode101, TestObject().statusCode102, TestObject().statusCode200, TestObject().statusCode201, TestObject().statusCode202, TestObject().statusCode300, TestObject().statusCode400, TestObject().statusCode418, TestObject().statusCode500])
}
