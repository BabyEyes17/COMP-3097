//
//  ModalViewController.swift
//  lab_04
//
//  Created by Tech on 2026-02-03.
//

import UIKit

class ModalViewController: UIViewController {
    
    var callback:((String)->Void)?
    
    @IBAction func dismissAction(_ sender: Any) {
        
        if let f = callback{
            f("Message from modal")
        }
        
        self.dismiss(animated: true) {
            
            print("dismissed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
