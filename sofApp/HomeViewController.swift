//
//  HomeViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit
import QuartzCore


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var actualScene: Scenary?
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var lightButton: UIButton!
    
    @IBOutlet weak var temperatureButton: UIButton!
    @IBOutlet weak var shutterButton: UIButton!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    
    
    @IBAction func settemperatureAction(_ sender: UIStepper) {
        temperature.text = "\(myStepper.value) °C"
    }
    
    @IBAction func turnOffAllLights(_ sender: UIButton) {
        con.sendCommandLights(status: DeviceLight.STATUS.OFF)
        for item in allLights {
            item.status = DeviceLight.STATUS.OFF
        }
        myTableView.reloadData()
    }
    
    @IBAction func closeAllShutter(_ sender: UIButton) {
    }
    
    @IBAction func setGeneralTemperature(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        
        if (allLights.count == 0) {
            lightButton.isEnabled = false
        } else {
            lightButton.isEnabled = true
        }
        if (allTemp.count == 0) {
            temperatureButton.isEnabled = false
            myStepper.isEnabled = false
            
        } else {
            temperatureButton.isEnabled = true
            myStepper.isEnabled = true
        }
        if (allShutters.count == 0) {
            shutterButton.isEnabled = false
        } else {
            shutterButton.isEnabled = true
        }
        */
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteLights.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (favoriteLights.count == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            return cell
        }
        let lightDev = favoriteLights[indexPath.row]
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "light")
            cell.lightPoint.text = "Light: \(lightDev.environment)\(lightDev.id)"
            cell.room.text = lightDev.room?.name
            cell.id = lightDev.id
            cell.lightDev = lightDev
            cell.enviroment = lightDev.environment
            if (lightDev.status == DeviceLight.STATUS.ON) {
                cell.mySwitch.isOn = true
        } else {
            cell.mySwitch.isOn = false
        }
            return cell
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.myTableView.reloadData()
        if (actualScene == nil) {
            myImageView.layer.cornerRadius = 25
            myImageView.backgroundColor = UIColor.gray
            myLabel.text = "Select a scene"
        }
        if (allLights.count == 0) {
            lightButton.isEnabled = false
        } else {
            lightButton.isEnabled = true
        }
        if (allTemp.count == 0) {
            temperatureButton.isEnabled = false
            myStepper.isEnabled = false
            
        } else {
            temperatureButton.isEnabled = true
            myStepper.isEnabled = true
        }
        if (allShutters.count == 0) {
            shutterButton.isEnabled = false
        } else {
            shutterButton.isEnabled = true
        }

        
    }
    
    
}
