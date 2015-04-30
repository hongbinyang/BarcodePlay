//
//  BarcodeReaderController.swift
//  BarcodePlay
//
//  Created by Hongbin Yang on 4/29/15.
//  Copyright (c) 2015 Hongbin Yang. All rights reserved.
//

import UIKit
import RSBarcodes

class BarcodeReaderController: RSCodeReaderViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.focusMarkLayer.strokeColor = UIColor.redColor().CGColor
        
        self.cornersLayer.strokeColor = UIColor.yellowColor().CGColor
        
        self.tapHandler = { point in
            println(point)
        }
        
        self.barcodesHandler = { barcodes in
            var finalCode:String?
            for barcode in barcodes {
                println("Barcode found: type=" + barcode.type + " value=" + barcode.stringValue)
                finalCode = barcode.stringValue
            }
            let objAlertController = UIAlertController(title: "Read barcode", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            let objAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:
                nil)
            objAlertController.addAction(objAction)
            objAlertController.message = finalCode
            self.presentViewController(objAlertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
