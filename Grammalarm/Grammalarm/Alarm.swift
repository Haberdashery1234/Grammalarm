//
//  Alarm.swift
//  Grammalarm
//
//  Created by Christian.Grise on 1/11/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import Foundation

enum DayOfWeek: String {
    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
    case Sunday = "Sunday"
    
    var description: String {
        get {
            return self.rawValue
        }
    }
    
    var dayNumber: Int {
        get {
            return self.hashValue
        }
    }
    
    private static let days = [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]
    
    static func fromNumber(number: Int) -> DayOfWeek {
        // FIXME check number index out of bounds
        return days[number]
    }
}

class Alarm: NSObject, NSCoding {
    var alarmId: UUID!
    var alarmName: String!
    var times: [ NSDate ]!
    var days: [ DayOfWeek ]!
    var snoozes: Int = 0
    var dismissType: String!
    var snoozeTime: Int = 0
    var alarmSound: String!
    var vibrate: Bool = false
    
    init(with dict: [String : Any]) {
        guard
            let alarmId = dict["alarmId"] as? UUID,
            let alarmName = dict["alarmName"] as? String,
            let times = dict["times"] as? [NSDate],
            let days = dict["days"] as? [DayOfWeek],
            let snoozes = dict["snoozes"] as? Int,
            let dismissType = dict["dismissType"] as? String,
            let snoozeTime = dict["snoozeTime"] as? Int,
            let alarmSound = dict["alarmSound"] as? String,
            let vibrate = dict["vibrate"] as? Bool
            else { return }
        
        self.alarmId = alarmId
        self.alarmName = alarmName
        self.times = times
        self.days = days
        self.snoozes = snoozes
        self.dismissType = dismissType
        self.snoozeTime = snoozeTime
        self.alarmSound = alarmSound
        self.vibrate = vibrate
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard
            let alarmId = decoder.decodeObject(forKey: "alarmId") as? UUID,
            let alarmName = decoder.decodeObject(forKey: "alarmName") as? String,
            let times = decoder.decodeObject(forKey: "times") as? [NSDate],
            let days = decoder.decodeObject(forKey: "days") as? [DayOfWeek],
            let snoozes = decoder.decodeObject(forKey: "snoozes") as? Int,
            let dismissType = decoder.decodeObject(forKey:"dismissType") as? String,
            let snoozeTime = decoder.decodeObject(forKey:"snoozeTime") as? Int,
            let alarmSound = decoder.decodeObject(forKey:"alarmSound") as? String,
            let vibrate = decoder.decodeObject(forKey:"vibrate") as? Bool
            else { return nil }
        
        let alarmDict: [String : Any] = [
            "alarmId" : alarmId,
            "alarmName" : alarmName,
            "times" : times,
            "days" : days,
            "snoozes" : snoozes,
            "dismissType" : dismissType,
            "snoozeTime" : snoozeTime,
            "alarmSound" : alarmSound,
            "vibrate" : vibrate
        ]
        
        self.init(with: alarmDict)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.alarmId, forKey: "alarmId")
        aCoder.encode(self.alarmName, forKey: "alarmName")
        aCoder.encode(self.times, forKey: "times")
        aCoder.encode(self.days, forKey: "days")
        aCoder.encode(self.snoozes, forKey: "snoozes")
        aCoder.encode(self.dismissType, forKey: "dismissType")
        aCoder.encode(self.snoozeTime, forKey: "snoozeTime")
        aCoder.encode(self.alarmSound, forKey: "alarmSound")
        aCoder.encode(self.vibrate, forKey: "vibrate")
    }
}
