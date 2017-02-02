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
        if checkForAllSampleProducts != nil {
            let sample1 = BillDetail(name: "Uova AMADORI", description: "Da aggiungere", rating: "2.5", bill: "123456789123456789", price: "2.00€", image: UIImage(named: "uova_amadori"))!
            let sample2 = BillDetail(name: "Arrosto di vitello", description: "Da aggiungere", rating: "2.0", bill: "123456789123456789", price: "15.00€", image: UIImage(named: "arrosto_di_vitello"))!
            let sample3 = BillDetail(name: "Grano saraceno ECOR", description: "Da aggiungere", rating: "4.5", bill: "123456789123456789", price: "2.80€", image: UIImage(named: "grano_saraceno_ecor"))!
            let sample4 = BillDetail(name: "Noci sorrento FATINA", description: "Da aggiungere", rating: "4.0", bill: "123456789123456789", price: "2.89€", image: UIImage(named: "noci_fatina"))!
            let sample5 = BillDetail(name: "Latte intero BERNA", description: "Da aggiungere", rating: "2.5", bill: "123456789123456789", price: "1.60€", image: UIImage(named: "latte_berna_intero"))!
            let sample6 = BillDetail(name: "Petto di Pollo AMADORI", description: "Da aggiungere", rating: "2.0", bill: "123456789123456789", price: "10.00€", image: UIImage(named: "petto_pollo_amadori"))!
            let sample7 = BillDetail(name: "Macine MULINO BIANCO", description: "Da aggiungere", rating: "2.0", bill: "123456789123456789", price: "1.70€", image: UIImage(named: "macine_mulino_bianco"))!
            let sample8 = BillDetail(name: "Nutella", description: "Da aggiungere", rating: "1.5", bill: "123456789123456789", price: "7.50€", image: UIImage(named: "nutella"))!
            let sample9 = BillDetail(name: "Marmellata Ciliegia Zuegg", description: "Da aggiungere", rating: "3.0", bill: "123456789123456789", price: "2.20€", image: UIImage(named: "mermellata_ciliegia_zuegg"))!
            let sample10 = BillDetail(name: "Tofu bio CEREAL BIO", description: "Da aggiungere", rating: "5.0", bill: "123456789123456789", price: "10.00€", image: UIImage(named: "tofu_bio_cerealbio"))!
            let sample11 = BillDetail(name: "Lenticchie SELECT", description: "Da aggiungere", rating: "4.5", bill: "123456789123456789", price: "2.80€", image: UIImage(named: "lenticchie_select"))!
            
            self.saveProducts(list: [sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8, sample9, sample10, sample11])
        } /*else {
            for value in checkForAllSampleProducts! {
                if value.AllDetail.productBill! == "123456789123456789" {
                    print(value.AllDetail.productName!)
                    print(value.AllDetail.productPrice!)
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
