//
//  ViewController.swift
//  lab_05
//
//  Created by Tech on 2026-02-17.
//

import UIKit

class ViewController: UIViewController {
    
    var item:String
    
    @IBOutlet weak var itemLabel: UILabel!
    var item:[String: String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = cell.textLabel?.text = "\(items[indexPath.row]["meaning"] ?? "-")"
    }


}

