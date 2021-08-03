//
//  MainViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit

class MainViewController: UIViewController {

    
    
    
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblUserPassword: UILabel!
    @IBOutlet weak var lblDefaultUserId: UILabel!
    

    @IBOutlet weak var btnLogOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        lblUserId.text = Share.userID
        lblUserPassword.text = Share.userPwd
        
        let defaultUserId = UserDefaults.standard.object(forKey: "userId")
        lblDefaultUserId.text = defaultUserId as? String
        
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func btnLogOut(_ sender: UIButton) {
        
        print("delete id, pwd")
        UserDefaults.standard.removeObject(forKey: "userId")
               // UserDefaults.standard.removeObject(forKey: "userPw")
        Share.userID = ""
        print(Share.userID)
    }
    
    
    
    
    
    
    
}
