//
//  HistoryTableViewController.swift
//  Agree-n
//
//  Created by Matteo Palmieri on 05/02/17.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var BillID = ["17/01/2017","20/01/2017","21/01/2017","23/01/2017","26/01/2017","17/01/2017", "20/01/2017","21/01/2017","23/01/2017","26/01/2017"]
    var BillImages = ["QrCode.jpg","QrCode.jpg","QrCode.jpg","QrCode.jpg","QrCode.jpg","QrCode.jpg", "QrCode.jpg","QrCode.jpg","QrCode.jpg","QrCode.jpg"]
    var billToSend = "123456789123456789"
    
    /*
    @IBAction func segueBill(_ sender: UIButton) {
        self.billToSend = "123456789123456789"
        self.performSegue(withIdentifier: "CheckForBill" , sender: sender)
    }
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckForBill" {
            let destinationController = segue.destination as! AfterScannedViewController
            destinationController.billScanned = self.billToSend
        }
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BillID.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "billCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BillTableViewCell
        
        // Configure the cell...
        //cell.textLabel?.text = envNames[indexPath.row]
        //cell.imageView?.image = UIImage(named: "livestock.jpg")
        cell.billLabel.text = BillID[indexPath.row]
        cell.billImage.image = UIImage(named: BillImages[indexPath.row])
        
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
