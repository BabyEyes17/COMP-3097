//
//  ViewController.swift
//  lab_04
//
//  Created by Tech on 2026-02-03.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier{
            
            case "toSecond":
                if let dest = segue.destination as? SecondViewController{
                    dest.message = "Message from main"
                }
                
            case "toModal":
                if let dest = segue.destination as? ModalViewController{
                    dest.callback = {t in print(t)}
                }
                
            default: print("Unknown")
        }
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
        if let src = segue.source as? SecondViewController{
            
            print(src.message)
        }
    }
}



