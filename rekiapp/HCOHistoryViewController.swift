//
//  HCOHistoryViewController.swift
//  rekiapp
//
//  Created by Isabel Yepes on 8/5/18.
//  Copyright © 2018 Hacemos Contactos. All rights reserved.
//

import UIKit
import CarouselSwift

class HCOHistoryViewController: UIViewController, CarouselViewDataSourse, CarouselViewDelegate {

    @IBOutlet weak var kilogramosView: CarouselView!
    @IBOutlet weak var unidadesView: CarouselView!
    
    var pageCount:Int = 6
    var visiblePageCount:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        kilogramosView.cellPerPage = self.visiblePageCount
        kilogramosView.type = .loop
        kilogramosView.dataSource = self
        kilogramosView.delegate = self
        kilogramosView.pagingType = .cellLimit
        kilogramosView.tag = 12345
        kilogramosView.reload()
        //kilogramosView.autoScroll(1, increase: true)
        
        unidadesView.cellPerPage = self.visiblePageCount
        unidadesView.type = .loop
        unidadesView.dataSource = self
        unidadesView.delegate = self
        unidadesView.pagingType = .cellLimit
        unidadesView.tag = 54321
        unidadesView.reload()
        //unidadesView.autoScroll(1, increase: true)
    }

    func numberOfView(_ carousel: CarouselView) -> Int {
        return pageCount
    }
    
    func carousel(_ carousel:CarouselView, viewForIndex index:Int) -> UIView? {
        
        let padding:CGFloat = 5
        let v = UIView()
        v.backgroundColor = UIColor.green
        v.isOpaque = false
        
        if carousel.tag == 12345 {
            let imagefilename = "barrapapel-" + String(index + 1)
            let historyImage = UIImage(named: imagefilename)
            let historyImageView = UIImageView(image: historyImage)
            v.addSubview(historyImageView)
            
            historyImageView.translatesAutoresizingMaskIntoConstraints = false
            let w = historyImageView.heightAnchor.constraint(equalTo: v.heightAnchor, multiplier: 1, constant: -padding * 2)
            let h = historyImageView.widthAnchor.constraint(equalTo: v.widthAnchor, multiplier: 1, constant: -padding * 2)
            let cx = historyImageView.centerXAnchor.constraint(equalTo: v.centerXAnchor)
            let cy = historyImageView.centerYAnchor.constraint(equalTo: v.centerYAnchor)
            
            NSLayoutConstraint.activate([w, h, cx, cy])
            //v.layer.borderColor = UIColor.red.cgColor
            v.layer.borderWidth = 0
            return (index % 6 == 0 && index != 0) ? nil : v
        } else {
            let imagefilename = "circular-PV-" + String(index + 1)
            let historyImage = UIImage(named: imagefilename)
            let historyImageView = UIImageView(image: historyImage)
            v.addSubview(historyImageView)
            
            historyImageView.translatesAutoresizingMaskIntoConstraints = false
            let w = historyImageView.heightAnchor.constraint(equalTo: v.heightAnchor, multiplier: 1, constant: -padding * 2)
            let h = historyImageView.widthAnchor.constraint(equalTo: v.widthAnchor, multiplier: 1, constant: -padding * 2)
            let cx = historyImageView.centerXAnchor.constraint(equalTo: v.centerXAnchor)
            let cy = historyImageView.centerYAnchor.constraint(equalTo: v.centerYAnchor)
            
            NSLayoutConstraint.activate([w, h, cx, cy])
            v.layer.borderColor = UIColor.red.cgColor
            v.layer.borderWidth = 0
            return (index % 6 == 0 && index != 0) ? nil : v
        }
    }
    
    
    // CarouselViewDelegate
    func carousel(_ carousel: CarouselView, didScrollFrom: Int, to: Int) {
        print("CarouselView didScrollFrom \(didScrollFrom) \(to)")
    }
    
    func carousel(_ carousel: CarouselView, scrollFrom: Int, to: Int, progress: CGFloat) {
        print("CarouselView scrollFrom \(scrollFrom) \(to) \(progress)")
    }
    
    func carousel(_ carousel: CarouselView, didTapAt cell: Int) {
        print("CarouselView didTapAt \(cell)")
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
