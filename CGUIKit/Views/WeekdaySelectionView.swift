//
//  WeekdaySelectionView.swift
//  Grammalarm
//
//  Created by Christian.Grise on 5/30/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import UIKit

public enum DayOfWeek {
    case monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
    
    var fullDisplayName : String {
        switch self {
        case .monday: return NSLocalizedString("Monday", comment: "Monday string")
        case .tuesday: return NSLocalizedString("Tuesday", comment: "Tuesday string")
        case .wednesday: return NSLocalizedString("Wednesday", comment: "Wednesday string")
        case .thursday: return NSLocalizedString("Thursday", comment: "Thursday string")
        case .friday: return NSLocalizedString("Friday", comment: "Friday string")
        case .saturday: return NSLocalizedString("Saturday", comment: "Saturday string")
        case .sunday: return NSLocalizedString("Sunday", comment: "Sunday string")
        }
    }
    
    var shortDisplayName : String {
        switch self {
        case .monday: return NSLocalizedString("Mon", comment: "Monday short string")
        case .tuesday: return NSLocalizedString("Tue", comment: "Tuesday short string")
        case .wednesday: return NSLocalizedString("Wed", comment: "Wednesday short string")
        case .thursday: return NSLocalizedString("Thu", comment: "Thursday short string")
        case .friday: return NSLocalizedString("Fri", comment: "Friday short string")
        case .saturday: return NSLocalizedString("Sat", comment: "Saturday short string")
        case .sunday: return NSLocalizedString("Sun", comment: "Sunday short string")
        }
    }
    
    var veryShortDisplayName : String {
        switch self {
        case .monday: return NSLocalizedString("M", comment: "Monday short string")
        case .tuesday: return NSLocalizedString("T", comment: "Tuesday short string")
        case .wednesday: return NSLocalizedString("W", comment: "Wednesday short string")
        case .thursday: return NSLocalizedString("Th", comment: "Thursday short string")
        case .friday: return NSLocalizedString("F", comment: "Friday short string")
        case .saturday: return NSLocalizedString("S", comment: "Saturday short string")
        case .sunday: return NSLocalizedString("Su", comment: "Sunday short string")
        }
    }
}

public class WeekdaySelectionView: MultiSelectionSegmentedControl {

    let days: [DayOfWeek] = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    
    public func setup() {
        var items = [String]()
        for day in self.days {
            items.append(day.shortDisplayName)
        }
        insertSegmentsWithTitles(items)
    }
}
