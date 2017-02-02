//
//  BillDetail.swift
//  Agree-n
//
//  Created by Alessandro Armando on 31/01/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class BillDetail: NSObject, NSCoding {
    
    static var documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("ProductsSaved")
    
    struct BillProductsKeys {
        static let nameKey = "NAME_PRODUCT"
        static let descriptionKey = "DESCRIPTION_PRODUCT"
        static let ratingKey = "RATING_PRODUCT"
        static let billKey = "BILL_PRODUCT"
        static let priceKey = "PRICE_PRODUCT"
        static let imageKey = "IMAGE_PRODUCT"
    }
    
    struct BillProductsDetail {
        var productName: String?
        var productDescription: String?
        var productRating: String?
        var productBill: String?
        var productPrice: String?
        var productImage: UIImage?
    }
    
    var AllDetail = BillProductsDetail()
    
    init?(name: String?, description: String?, rating: String?, bill: String?, price: String?, image: UIImage?) {
        AllDetail.productName = name
        AllDetail.productDescription = description
        AllDetail.productRating = rating
        AllDetail.productBill = bill
        AllDetail.productPrice = price
        AllDetail.productImage = image
        
        super.init()
        
        if (((AllDetail.productName) == nil) && ((AllDetail.productDescription) == nil) && ((AllDetail.productRating) == nil) && ((AllDetail.productImage) == nil) && ((AllDetail.productPrice) == nil)) || AllDetail.productBill == nil {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: BillProductsKeys.nameKey) as? String
        let description = aDecoder.decodeObject(forKey: BillProductsKeys.descriptionKey) as? String
        let rating = aDecoder.decodeObject(forKey: BillProductsKeys.ratingKey) as? String
        let bill = aDecoder.decodeObject(forKey: BillProductsKeys.billKey) as? String
        let price = aDecoder.decodeObject(forKey: BillProductsKeys.priceKey) as? String
        let image = aDecoder.decodeObject(forKey: BillProductsKeys.imageKey) as? UIImage
        
        self.init(name: name, description: description, rating: rating, bill: bill, price: price, image: image)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(AllDetail.productName, forKey: BillProductsKeys.nameKey)
        aCoder.encode(AllDetail.productDescription, forKey: BillProductsKeys.descriptionKey)
        aCoder.encode(AllDetail.productRating, forKey: BillProductsKeys.ratingKey)
        aCoder.encode(AllDetail.productBill, forKey: BillProductsKeys.billKey)
        aCoder.encode(AllDetail.productPrice, forKey: BillProductsKeys.priceKey)
        aCoder.encode(AllDetail.productImage, forKey: BillProductsKeys.imageKey)
    }
}

