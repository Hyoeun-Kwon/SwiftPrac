//
//  MainViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit
import KakaoSDKUser
class MainViewController: UIViewController {

    
    var receiveKakaoEmail = ""
    var receiveKakaoId = ""
    var receiveKakaoPw = ""
    
    
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblUserPassword: UILabel!
    @IBOutlet weak var lblDefaultUserId: UILabel!
    @IBOutlet weak var lblKakaoEmail: UILabel!
    
    @IBOutlet weak var btnLogOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        lblUserId.text = Share.userID
        lblUserPassword.text = Share.userPwd
        
        let defaultUserId = UserDefaults.standard.object(forKey: "userId")
        lblDefaultUserId.text = defaultUserId as? String
        
        lblKakaoEmail.text = receiveKakaoEmail
        print("넘어와서 찍히는 kakaoEmail \(receiveKakaoEmail)")
        
        
    }//viewDidLoad
    
    // Test
    func receiveKakaoInfo(email: String, id: String, password: String){
        
        self.receiveKakaoEmail = email
        self.receiveKakaoId = id
        self.receiveKakaoPw = password
        
    }
    
    
    @IBAction func btnLogOut(_ sender: UIButton) {
        
        print("delete id, pwd")
        print(Share.userID)

        
        let logOutAlert = UIAlertController(title: "경고", message: "로그아웃을 하시겠습니까?", preferredStyle: .alert)
        let onAction = UIAlertAction(title: "확인", style: .default, handler: { ACTION in
            
            UserDefaults.standard.removeObject(forKey: "userId")
            // UserDefaults.standard.removeObject(forKey: "userPw")
            Share.userID = ""
            UserApi.shared.unlink {(error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("unlink() success.")
                }
            }
            
            self.navigationController?.popToRootViewController(animated: true)

        })
        
        logOutAlert.addAction(onAction)
        present(logOutAlert, animated: true, completion: nil)
    }
    
  
    
    
    
    
    
}
