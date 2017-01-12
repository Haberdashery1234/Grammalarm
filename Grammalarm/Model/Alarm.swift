//
//  Alarm.swift
//  Grammalarm
//
//  Created by Christian.Grise on 1/11/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import Foundation
import CGUIKit

class Alarm {
    
    var isEnabled: Bool
    var time: String
    var days: [DayOfWeek]
    var name: String
    var type: AlarmType
    var ringtone: String
    var vibrate: Bool
    
    init() {
        isEnabled = true
        let dForm: DateFormatter = DateFormatter()
        dForm.dateFormat = "h:mm a"
        time = dForm.string(from: Date.init())
        days = []
        name = "Alarm"
        type = .Default
        ringtone = ""
        vibrate = false
    }
    
    init(with dict: [String : Any]) {
        isEnabled = dict["isEnabled"] as! Bool
        time = dict["time"] as! String
        days = dict["days"] as! [DayOfWeek]
        name = dict["name"] as! String
        type = dict["type"] as! AlarmType
        ringtone = dict["ringtone"] as! String
        vibrate = dict["vibrate"] as! Bool
    }
}
