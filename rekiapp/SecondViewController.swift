//
//  SecondViewController.swift
//  rekiapp
//
//  Created by Isabel Yepes on 8/4/18.
//  Copyright © 2018 Hacemos Contactos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func addSolicitudRecogida(_ sender: Any) {
        performSegue(withIdentifier: "openListaRecogidaView", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

