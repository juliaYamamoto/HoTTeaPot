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
    
    public struct ColorName {
        let purple: String = "PurpleTypeOne"
        let blue: String = "BlueTypeTwo"
        let green: String = "GreenTypeThree"
        let red: String = "RedTypeFour"
        let yellow: String = "YellowTypeFive"
        
        let grayTitle: String = "GrayTitle"
        let graySubtitle: String = "GraySubtitle"
    }
    
    public struct Cell {
        let identifier: String = "StatusCodeCell"
    }
    
    public struct Font {
        let robotoRegular: String = "RobotoSlab-Regular"
        let robotoBold: String = "RobotoSlab-Bold"
        let robotoSemiBold: String = "RobotoSlab-SemiBold"
    }
    
}
