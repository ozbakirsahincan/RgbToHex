//
//  ViewController.swift
//  RgbToHex
//
//  Created by Şahincan Özbakır on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

    //TextFieldlar
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    //Aksiyonlu İşlemler
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        if secilenIndex == 0 {
            btnConvert.setTitle("Convert - RGB TO HEX", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("Convert - HEX TO RGB", for: UIControl.State.normal)
        }
    }
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        if secilenIndex == 0 {
            // RGB den HEX e çevirme işlemi
            convertRgbToHex()
            
        } else {
            // Hex den rgb ye çevirme
            convertHexToRgb()
        }
    }
    
    func convertRgbToHex() {
        guard let redValue = UInt8(txtRed.text!) else{return}
        guard let greenValue = UInt8(txtGreen.text!)else{return}
        guard let blueValue = UInt8(txtBlue.text!) else{return}
        
        let redHex = String(format: "%2X" ,redValue)
        let greenHex = String(format: "%2X" , greenValue)
        let blueHex = String(format: "%2X" , blueValue)
        
        lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
        lblSelectedColor.backgroundColor = UIColor(red:CGFloat(redValue)/255,green:CGFloat(greenValue)/255,blue: CGFloat(blueValue)/255,alpha: 1)
        
    }
    func convertHexToRgb() {
        guard let redValue = UInt8(txtRed.text!,radix: 16) else{return}
        guard let greenValue = UInt8(txtGreen.text!,radix: 16)else{return}
        guard let blueValue = UInt8(txtBlue.text!,radix: 16) else{return}
        
        lblResult.text = "RED :\(redValue)\nGREEN :\(greenValue)\nBLUE :\(blueValue)"
        lblSelectedColor.backgroundColor = UIColor(red:CGFloat(redValue)/255,green:CGFloat(greenValue)/255,blue: CGFloat(blueValue)/255,alpha: 1)
    }
    
    
    
    
    
}

