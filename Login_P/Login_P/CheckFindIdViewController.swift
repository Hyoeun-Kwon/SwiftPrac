//
//  CheckFindIdViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class CheckFindIdViewController: UIViewController {

    
    
    @IBOutlet weak var lblCheckId: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        //let defaultUserId = UserDefaults.standard.object(forKey: "userId")
        //메세지 창에 현재 아이디
        //lblCheckId.text = "고객님의 아이디는 \(defaultUserId as! String) 입니다."
        lblCheckId.text = "고객님의 아이디는 \(Share.userID) 입니다."
        
        setRadius()
       
    }
    

    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgCheckIdToLogin", sender: self)
    
    
    }
    
    
    
    

    func setRadius(){
        btnLogin.layer.cornerRadius = 20
    }
    
  
}//----
