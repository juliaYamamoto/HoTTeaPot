//
//  Color.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-23.
//

import Foundation

func getColorNameForType(_ type: CodeType) -> String {
    
    switch type {
    case .informational:
        return Constants.ColorName().purple
    case .success:
        return Constants.ColorName().blue
    case .redirection:
        return Constants.ColorName().green
    case .clientError:
        return Constants.ColorName().red
    case .serverError:
        return Constants.ColorName().yellow
    }
}
