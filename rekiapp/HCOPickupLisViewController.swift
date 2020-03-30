//
//  HCOPickupLisViewController.swift
//  rekiapp
//
//  Created by Isabel Yepes on 8/5/18.
//  Copyright © 2018 Hacemos Contactos. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
let key = "225861c2"
let secret = "TANuo8tueoh2MWqY"
let url = URL(string: "https://rest.nexmo.com/sms/json")

var request = URLRequest(url: url!)

class HCOPickupLisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeViewPressed(_ sender: Any) {
        let sourceViewController = self.presentingViewController as! UIViewController
        sourceViewController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showDetalleRecogida(_ sender: Any) {
        performSegue(withIdentifier: "OpenDetailSolicitud", sender: self)
    }
    
    
    @IBAction func requestPIckup(_ sender: Any) {
        /*
         curl -X POST  https://rest.nexmo.com/sms/json \
         -d api_key=225861c2 \
         -d api_secret=TANuo8tueoh2MWqY \
         -d to=573006114674 \
         -d from="NEXMO" \
         -d text="Hello from Nexmo"
         */

        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "api_key=225861c2&api_secret=TANuo8tueoh2MWqY&to=573006114674&from=NEXMO&text=Please Pickup 15kg Rice, 20kg Beans, 5Lt Milk at Address 57 Nro 8-69, Bogota"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
        
    }
    

    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
