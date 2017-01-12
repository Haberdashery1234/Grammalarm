//
//  AlarmDetailsViewController.swift
//  Grammalarm
//
//  Created by Christian.Grise on 5/26/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import UIKit
import CGUIKit

class AlarmDetailsViewController: UIViewController {

    @IBOutlet weak var alarmDetailsTable: UITableView!
    
    var alarm: Alarm!
    var alarmDetailsDictionaryOrder = [ "name", "time", "repeat", "ringtone", "vibrate", "dismiss method" ]
    var alarmDetailsDictionary = [String : Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmDetailsTable.configureAutomaticDimensions(withDefaultRowHeight: 56)
        buildTableContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildTableContents() {
        alarmDetailsDictionary["name"] = alarm.name
        alarmDetailsDictionary["time"] = alarm.time
        alarmDetailsDictionary["repeat"] = alarm.days
        alarmDetailsDictionary["ringtone"] = alarm.ringtone
        alarmDetailsDictionary["vibrate"] = alarm.vibrate
        alarmDetailsDictionary["dismiss method"] = alarm.type
    }
    
    // MARK: - IBActions
    @IBAction func saveAlarm() {
        
    }
    
    @IBAction func cancelTapped() {
        _ = navigationController?.popViewController(animated: true)
    }
}

extension AlarmDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let cellType = alarmDetailsDictionaryOrder[indexPath.row]
        switch cellType {
        case "name":
            cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! AlarmDetailsTableViewCell
        case "time":
            cell = tableView.dequeueReusableCell(withIdentifier: "timeCell") as! AlarmDetailsTableViewCell
        case "repeat":
            cell = tableView.dequeueReusableCell(withIdentifier: "repeatDaysSelectCell") as! AlarmDetailsTableViewCell
        case "ringtone":
            cell = tableView.dequeueReusableCell(withIdentifier: "ringtoneCell") as! AlarmDetailsTableViewCell
        case "vibrate":
            cell = tableView.dequeueReusableCell(withIdentifier: "vibrateCell") as! AlarmDetailsTableViewCell
        case "dismiss method":
            cell = tableView.dequeueReusableCell(withIdentifier: "dismissMethodCell") as! AlarmDetailsTableViewCell
        default:
            break
        }
        
        return cell
    }
}

extension AlarmDetailsViewController: UITableViewDelegate {
    
}
