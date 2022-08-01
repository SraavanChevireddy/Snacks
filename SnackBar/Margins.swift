//
//  ViewMargins.swift
//  GenericButtons
//
//  Created by Sraavan Chevireddy on 7/20/22.
//

import SwiftUI

enum margin:CGFloat{
    case small = 12
    case medium = 20
    case large = 24
    case zero = 0
}

extension CGFloat{
    var large:CGFloat {
        margin.large.rawValue
    }
    var medium:CGFloat {
        margin.medium.rawValue
    }
    var small:CGFloat {
        margin.small.rawValue
    }
    var zero:CGFloat {
        margin.zero.rawValue
    }
}

enum buttonType{
    case primary
    case secondary
    case teritary
}

