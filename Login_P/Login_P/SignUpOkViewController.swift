//
//  SignUpOkViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class SignUpOkViewController: UIViewController {

    
    
    @IBOutlet weak var tfWelcomeMsg: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        setRadius()
        
    }
    

    
    
    @IBAction func btnNext(_ sender: UIButton) {
       
        self.performSegue(withIdentifier: "sgSignToLogin", sender: self)
    
    }
    
    
    
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }

}
