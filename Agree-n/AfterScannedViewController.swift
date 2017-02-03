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
    @IBOutlet var priceToShow: UILabel!
    
    var billNumber = "123456789123456789"
    var billScanned = "no"
    
    var productName = [String]()
    var productPrice = [String]()
    var productRating = [String]()
    
    var billRating = [Float]()
    var billPrice = [Float]()
    var productImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.billToShow.text = self.billScanned
        
        if billScanned == billNumber {
            let productList = self.loadProducts()
            for value in productList! {
                if value.AllDetail.productBill! == "123456789123456789" {
                    self.productName += [value.AllDetail.productName!]
                    self.productRating += [value.AllDetail.productRating!]
                    self.productPrice += [value.AllDetail.productPrice!]
                    self.productImage += [value.AllDetail.productImage!]
                }
            }
        }
        for value in self.productRating {
            let estractedRating = (Float)(value)
            self.billRating += [(Float)(estractedRating!)]
        }
        for value in self.productPrice {
            let estractedPrice = value.replacingOccurrences(of: "€", with: "")
            self.billPrice += [(Float)(estractedPrice)!]
        }
        
        var totalBillPrice: Float = 0.0
        var totalBillRating: Float = 0.0
        for value in self.billPrice {
            totalBillPrice += value
        }
        for value in self.billRating {
            totalBillRating += (Float)(value)
        }
        
        self.priceToShow.text = (String)(totalBillPrice)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .up
        
        totalBillRating = totalBillRating / (Float)(self.billRating.count)
        self.ratingToShow.text = formatter.string(for: totalBillRating)
        switch totalBillRating {
        case 0.0...2.50:
            self.ratingToShow.textColor = UIColor.init(red: 230.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        case 2.51...3.99:
            self.ratingToShow.textColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        default:
            self.ratingToShow.textColor = UIColor.init(red: 87.0/255.0, green: 175.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetailsViewController
                destinationController.nameTaken = self.productName[indexPath.row]
                destinationController.imageTaken = self.productImage[indexPath.row]
                destinationController.ratingTaken = self.productRating[indexPath.row]
            }
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
