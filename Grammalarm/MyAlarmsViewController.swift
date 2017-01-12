//
//  FirstViewController.swift
//  Grammalarm
//
//  Created by Christian.Grise on 1/7/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import UIKit

class MyAlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var enableAlarmSwitch: UISwitch!
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var alarmDaysLabel: UILabel!
    @IBOutlet weak var alarmNameLabel: UILabel!
    @IBOutlet weak var alarmTypeImage: UIImageView!
    @IBOutlet weak var moreOptionsButton: UIButton!
    
    var alarm: Alarm!
}

class MyAlarmsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

