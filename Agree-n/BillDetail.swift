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
        static let locationKey = "LOCATION_PRODUCT"
        static let typeKey = "TYPE_PRODUCT"
        static let billKey = "BILL_PRODUCT"
        static let imageKey = "IMAGE_PRODUCT"
    }
    
    struct BillProductsDetail {
        var productName: String?
        var productLocation: String?
        var productType: String?
        var productBill: String?
        var productImage: UIImage?
    }
    
    var AllDetail = BillProductsDetail()
    
    init?(name: String?, location: String?, type: String?, bill: String?, image: UIImage?) {
        AllDetail.productName = name
        AllDetail.productLocation = location
        AllDetail.productType = type
        AllDetail.productBill = bill
        AllDetail.productImage = image
        
        super.init()
        
        if (((AllDetail.productName) == nil) && ((AllDetail.productLocation) == nil) && ((AllDetail.productType) == nil) && ((AllDetail.productImage) == nil)) || AllDetail.productBill == nil {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: BillProductsKeys.nameKey) as? String
        let location = aDecoder.decodeObject(forKey: BillProductsKeys.locationKey) as? String
        let type = aDecoder.decodeObject(forKey: BillProductsKeys.typeKey) as? String
        let bill = aDecoder.decodeObject(forKey: BillProductsKeys.billKey) as? String
        let image = aDecoder.decodeObject(forKey: BillProductsKeys.imageKey) as? UIImage
        
        self.init(name: name, location: location, type: type, bill: bill, image: image)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(AllDetail.productName, forKey: BillProductsKeys.nameKey)
        aCoder.encode(AllDetail.productLocation, forKey: BillProductsKeys.locationKey)
        aCoder.encode(AllDetail.productType, forKey: BillProductsKeys.typeKey)
        aCoder.encode(AllDetail.productBill, forKey: BillProductsKeys.billKey)
        aCoder.encode(AllDetail.productImage, forKey: BillProductsKeys.imageKey)
    }
}

