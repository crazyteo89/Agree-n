//
//  CheckForBillViewController.swift
//  Agree-n
//
//  Created by Alessandro Armando on 02/02/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class CheckForBillViewController: UIViewController {
    
    var billToSend = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendBillForCheck(_ sender: UIButton) {
        //self.billToSend = (sender.titleLabel?.text)!
        self.billToSend = "123456789123456789"
        self.performSegue(withIdentifier: "CheckForBill" , sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckForBill" {
            let destinationController = segue.destination as! AfterScannedViewController
            destinationController.billScanned = self.billToSend
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
