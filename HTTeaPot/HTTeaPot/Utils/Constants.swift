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
    
    public struct Identifier {
        let mainStoryboard: String = "Main"
        let detailsVC: String = "Details"
        
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
    
    public struct SearchBar {
        let searchFieldKey: String = "searchField"
        let placeholderKey: String = "placeholderLabel"
        let placeholder: String = "Search for Code or Name"
    }
    
    public struct Font {
        let robotoRegular: String = "RobotoSlab-Regular"
        let robotoBold: String = "RobotoSlab-Bold"
        let robotoSemiBold: String = "RobotoSlab-SemiBold"
    }
    
}
