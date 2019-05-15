//--------------------------------------------------------------------------
//                           UFDA-WMEPPG v1.0
//                          Copyright (C) 2019
//
//--------------------------------------------------------------------------
//  This Swift file is part of the project UFDA-WMEPPG:
//  an iOS Mobile Application (UFDA), developed in Swift,
//  Optimized to display data acquired from two or more PPG sensors;
//  Optimized for connecting to WMEPPG or any GATT compliant commercially
//  available heart rate monitors.
//
//  https://github.com/ITLeiria/UFDA-WMEPPG/tree/master/iOS_Mobile_Application
//
//-CITATION-----------------------------------------------------------------
//  If you use this software please cite one of the following papers:
//
//
//-DESCRIPTION--------------------------------------------------------------
//
//  BLEDevicesTableViewCell.swift
//
//-DISCLAIMER---------------------------------------------------------------
//  This program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//  You can use this source code without licensing fees only for NON-COMMERCIAL research
//  and EDUCATIONAL purposes only.
//  You cannot repost this file without prior written permission from the authors.
//
//-AUTHORS------------------------------------------------------------------
//  Márcio Fernandes Calil*
//  Ihor Koval*
//  Luís Marcelino*
//  Luís Conde Bento* **
//  Sérgio Faria*
//
//  *School of Technology and Management - Polytechnic Institute of Leiria
//  **Institute of Systems and Robotics   - University of Coimbra
//--------------------------------------------------------------------------

import UIKit
import CoreBluetooth

protocol BLEDevicesCellDelegate: class {
    func didTapConnect(_ cell: BLEDevicesTableViewCell, peripheral: CBPeripheral)
}

class BLEDevicesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBLEDeviceName: UILabel!
    @IBOutlet weak var btnConnectBLE: UIButton!
    
    
    weak var delegate: BLEDevicesCellDelegate?

    private var displayPeripheral: DisplayPeripheral!
    
    func populate(displayPeripheral: DisplayPeripheral) {
        self.displayPeripheral = displayPeripheral
        
        if let peripheralName = displayPeripheral.peripheral.name
        {
            lblBLEDeviceName.text = peripheralName
        }
    
        btnConnectBLE.isHidden = !displayPeripheral.isConnectable
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func connectBLEDevice(_ sender: Any) {
        delegate?.didTapConnect(self, peripheral: displayPeripheral.peripheral)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}