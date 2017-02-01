//
//  UserDetail.swift
//  Agree-n
//
//  Created by Alessandro Armando on 01/02/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class UserDetail: NSObject, NSCoding {
    
    static var documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("UserSaved")
    
    struct UserDetailKey {
        static let nameKey = "USER_KEY"
        static let passwordKey = "PASSWORD_KEY"
        static let imageKey = "IMAGE_KEY"
    }
    
    struct UserDetails {
        var userName: String?
        var userPassword: String?
        var userImage: UIImage?
    }
    
    var AllDetail = UserDetails()
    
    init?(name: String?, password: String?, image: UIImage?) {
        AllDetail.userName = name
        AllDetail.userPassword = password
        AllDetail.userImage = image
        
        super.init()
        
        if AllDetail.userName == nil && AllDetail.userPassword == nil && AllDetail.userImage == nil {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: UserDetailKey.nameKey) as? String
        let password = aDecoder.decodeObject(forKey: UserDetailKey.passwordKey) as? String
        let image = aDecoder.decodeObject(forKey: UserDetailKey.imageKey) as? UIImage
        
        self.init(name: name, password: password, image: image)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(AllDetail.userName, forKey: UserDetailKey.nameKey)
        aCoder.encode(AllDetail.userPassword, forKey: UserDetailKey.passwordKey)
        aCoder.encode(AllDetail.userImage, forKey: UserDetailKey.imageKey)
    }
}
