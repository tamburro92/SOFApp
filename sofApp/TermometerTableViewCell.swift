//
//  TermometerTableViewCell.swift
//  SOFApp
//
//  Created by Antonello Scaldaferri on 04/03/17.
//  Copyright © 2017 Antonello Scaldaferri. All rights reserved.
//

import UIKit

class TermometerTableViewCell: UITableViewCell {
    
    var id: String!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var termometer: UILabel!
    @IBOutlet var room: UILabel!
    @IBOutlet var temperature: UILabel!
    @IBOutlet var myStepper: UIStepper!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        temperature.text = "\(myStepper.value)"
        con.sendCommandTemperature(id: self.id, temperature: "0\(Int((myStepper.value)*10))")
        print("0\((myStepper.value)*10)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
