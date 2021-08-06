//
//  ViewController.swift
//  starbucksLogin_P
//
//  Created by HyoEun Kwon on 2021/08/05.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var btnFindId: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    @IBAction func btnFindId(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "sgLoginToFindId", sender: self)
    }
    
    
    
}

