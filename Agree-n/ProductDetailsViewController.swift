//
//  ProductDetailsViewController.swift
//  Agree-n
//
//  Created by Alessandro Armando on 03/02/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UITableViewController {
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productRating: UILabel!
    @IBOutlet var alternativeImage1: UIImageView!
    @IBOutlet var alternativeImage2: UIImageView!
    @IBOutlet var alternativeTitle1: UILabel!
    @IBOutlet var alternativeTitle2: UILabel!
    
    var ratingTaken = ""
    var imageTaken = UIImage()
    var nameTaken = ""
    var descriptionTaken = ""
    
    var detailTitle = ["Description:"]
    var detailInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 30
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.productImage.image = self.imageTaken
        self.productName.text = self.nameTaken
        self.productRating.text = self.ratingTaken
        self.detailInfo += [descriptionTaken]
        
        let ratingInFloat = (Float)(self.ratingTaken)!
       
        switch ratingInFloat {
        case 0.0...2.50:
            self.productRating.textColor = UIColor.init(red: 230.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        case 2.51...3.99:
            self.productRating.textColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        default:
            self.productRating.textColor = UIColor.init(red: 87.0/255.0, green: 175.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        
        self.valuateAlternative(nameTaken)
    }
    
    func valuateAlternative (_ name: String) {
        if name == "Uova AMADORI" {
            self.alternativeTitle1.text = "Grano saraceno ECOR"
            self.alternativeImage1.image = UIImage(named: "grano_saraceno_ecor")
            self.alternativeTitle2.text = "Noci sorrento FATINA"
            self.alternativeImage2.image = UIImage(named: "noci_fatina")
        } else if name == "Arrosto di vitello" {
            self.alternativeTitle1.text = "Tofu bio CEREAL BIO"
            self.alternativeImage1.image = UIImage(named: "tofu_bio_cerealbio")
            self.alternativeTitle2.text = "Lenticchie SELECT"
            self.alternativeImage2.image = UIImage(named: "lenticchie_select")
        }
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
        return self.detailTitle.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsCell", for: indexPath) as! ProductDetailsViewCell
        cell.detailTitle?.text = self.detailTitle[indexPath.row]
        cell.detailInfo?.text = self.detailInfo[indexPath.row]
        tableView.tableFooterView = UITableView()
        
        return cell
    }
}
