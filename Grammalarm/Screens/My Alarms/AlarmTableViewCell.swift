//
//  AlarmTableViewCell.swift
//  Grammalarm
//
//  Created by Christian.Grise on 5/26/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var enableAlarmSwitch: UISwitch!
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var alarmDaysLabel: UILabel!
    @IBOutlet weak var alarmNameLabel: UILabel!
    @IBOutlet weak var alarmTypeImage: UIImageView!
    @IBOutlet weak var moreOptionsButton: UIButton!
    
    var alarm: Alarm!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with alarm: Alarm) {
        
    }
}
