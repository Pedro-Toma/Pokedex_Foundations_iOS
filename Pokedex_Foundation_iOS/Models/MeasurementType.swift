//
//  MeasurementType.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 08/02/26.
//

import SwiftUI

enum MeasurementType {
    
    case weight
    case height
    
    var unit: String {
        switch self {
            case .weight:
                return "kg"
            case .height:
                return "m"
        }
    }
    
    var icon: String {
        switch self {
            case .weight:
                return "scalemass.fill"
            case .height:
                return "ruler.fill"
        }
    }
}
