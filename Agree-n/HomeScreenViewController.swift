//
//  HomeScreenViewController.swift
//  Agree-n
//
//  Created by Alessandro Armando on 31/01/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var userLogged = "user"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        /* Il titolo va modificato in base al nome utente*/
        //self.navigationItem.title = "Ciao " + self.userLogged
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignOut))
        
        let checkForAllSampleProducts = self.loadProducts()
        /* Se si vuole aggiungere un prodotto di esempio cambiare "==" -> "!=" .
         Così facendo verrà effettuata la sovrascrittura forzata dei prodotti*/
        if checkForAllSampleProducts == nil {
            let sample1 = BillDetail(name: "Esempio 1", location: "Locazione esempio 1", type: "Tipo esempio 1", bill: "123456789123456789", image: UIImage(named: "acqua_buxton"))!
            let sample2 = BillDetail(name: "Esempio 2", location: "Locazione esempio 2", type: "Tipo esempio 2", bill: "123456789123456789", image: UIImage(named: "bacon"))!
            let sample3 = BillDetail(name: "Esempio 3", location: "Locazione esempio 3", type: "Tipo esempio 3", bill: "123456789123456789", image: UIImage(named: "beer"))!
            let sample4 = BillDetail(name: "Esempio 4", location: "Locazione esempio 4", type: "Tipo esempio 4", bill: "123456789123456789", image: UIImage(named: "cocacola_lattina"))!
            let sample5 = BillDetail(name: "Esempio 5", location: "Locazione esempio 5", type: "Tipo esempio 5", bill: "123456789123456789", image: UIImage(named: "formaggio"))!
            let sample6 = BillDetail(name: "Esempio 6", location: "Locazione esempio 6", type: "Tipo esempio 6", bill: "123456789123456789", image: UIImage(named: "mortadellina"))!
            self.saveProducts(list: [sample1, sample2, sample3, sample4, sample5, sample6])
        } /*else {
            for value in checkForAllSampleProducts! {
                if value.AllDetail.productBill! == "123456789123456789" {
                    print(value.AllDetail.productName!)
                    print(value.AllDetail.productLocation!)
                    print(value.AllDetail.productType!)
                    print(value.AllDetail.productImage!)
                }
            }
         }*/

    }
    
    func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveProducts (list products: [BillDetail]) {
        let isSuccesufulSave = NSKeyedArchiver.archiveRootObject(products, toFile: BillDetail.archiveURL.path)
        if !isSuccesufulSave {
            print("Some problems in saving state...")
        }
    }
    
    func loadSampleProducts() -> [BillDetail]? {
        return self.loadProducts()
    }
    
    func loadProducts() -> [BillDetail]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: BillDetail.archiveURL.path) as? [BillDetail]
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
