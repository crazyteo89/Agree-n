//
//  AfterScannedViewController.swift
//  Agree-n
//
//  Created by Alessandro Armando on 31/01/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class AfterScannedViewController: UITableViewController {
    @IBOutlet var ratingToShow: UILabel!
    @IBOutlet var billToShow: UILabel!
    
    var billNumber = "123456789123456789"
    var billScanned = "no"
    
    var productName = [String]()
    var productPrice = [String]()
    var productImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billToShow.text = self.billScanned
        
        if billScanned == billNumber {
            let productList = self.loadProducts()
            for value in productList! {
                if value.AllDetail.productBill! == "123456789123456789" {
                    self.productName += [value.AllDetail.productName!]
                    self.productPrice += [value.AllDetail.productPrice!]
                    self.productImage += [value.AllDetail.productImage!]
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    private func loadProducts() -> [BillDetail]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: BillDetail.archiveURL.path) as? [BillDetail]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProductContentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductContentCell
        cell.productName?.text = self.productName[indexPath.row]
        cell.productPrice?.text = self.productPrice[indexPath.row]
        cell.productImage.image = self.productImage[indexPath.row]        
        return cell
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
