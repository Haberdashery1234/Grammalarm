//
//  FirstViewController.swift
//  Grammalarm
//
//  Created by Christian.Grise on 1/7/17.
//  Copyright © 2017 Christian.Grise. All rights reserved.
//

import UIKit

class MyAlarmsViewController: UIViewController {

    @IBOutlet weak var alarmsTableView: UITableView!
    
    var alarms = [Alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.navigationItem.title = navigationItem.title
        tabBarController?.navigationItem.rightBarButtonItem = navigationItem.rightBarButtonItem
        
        alarmsTableView.setExtraSeparators(hidden: true)
        alarmsTableView.configureAutomaticDimensions(withDefaultRowHeight: 44);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .some("AlarmDetailsSegue"):
            let alarmDetailsVC = segue.destination as! AlarmDetailsViewController
            alarmDetailsVC.alarm = Alarm()
        default:
            break
        }
    }
    
    // MARK: - IBActions
    @IBAction func addAlarm() {
        performSegue(withIdentifier: "AlarmDetailsSegue", sender: nil)
    }
}

extension MyAlarmsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MyAlarmsViewController : UITableViewDelegate {
    
}
