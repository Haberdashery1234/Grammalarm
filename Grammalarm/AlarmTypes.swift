//
//  AlarmTypes.swift
//  Grammalarm
//
//  Created by Christian.Grise on 5/26/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import Foundation
import UIKit

enum AlarmType {
    case Default,
    Shake,
    Math,
    Barcode,
    Grammar,
    Draw
    
    var image : UIImage? {
        switch self {
        case .Default: return UIImage.init(named: "AlarmTypeDefault")
        case .Shake: return UIImage.init(named: "AlarmTypeShake")
        case .Math: return UIImage.init(named: "AlarmTypeMatch")
        case .Barcode: return UIImage.init(named: "AlarmTypeBarcode")
        case .Grammar: return UIImage.init(named: "AlarmTypeGrammar")
        case .Draw: return UIImage.init(named: "AlarmTypeDraw")
        }
    }
    
}
