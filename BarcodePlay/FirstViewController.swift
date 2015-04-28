//
//  FirstViewController.swift
//  BarcodePlay
//
//  Created by Hongbin Yang on 4/27/15.
//  Copyright (c) 2015 Hongbin Yang. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes

class FirstViewController: UIViewController {

    @IBOutlet weak var subjectHolder: UILabel!
    
    @IBOutlet weak var barView: UIImageView!

    @IBOutlet weak var codeHolder: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateCode()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toGenerate(sender: AnyObject) {
        generateCode()
    }

    func generateCode () {
        
        let uuid = NSUUID().UUIDString

        self.navigationItem.title = uuid
        codeHolder.text = uuid
        
        let gen = RSUnifiedCodeGenerator.shared
        gen.fillColor = UIColor.greenColor()
        gen.strokeColor = UIColor.grayColor()
        var image: UIImage? = gen.generateCode(uuid, machineReadableCodeObjectType: AVMetadataObjectTypeQRCode)
        if let i = image {
            self.barView.image = RSAbstractCodeGenerator.resizeImage(i, scale: 5.0)
        }
    }
}

