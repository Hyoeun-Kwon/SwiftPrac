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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        lblUserId.text = Share.userID
        lblUserPassword.text = Share.userPwd
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
