//
//  SignUp_InsertInfoEmailViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/30.
//

import UIKit
import FirebaseAuth
class SignUp_InsertInfoEmailViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBirthNum: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    
    //test
    @IBOutlet weak var tfPwd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
    }
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
//        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
//        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPwd.text!
//
//                ) { (user, error) in
//
//                    if user !=  nil{
//
//                        print("register success")
//
//                    }
//
//                    else{
//
//                        print("register failed")
//
//                    }
//
//        }
        
        guard let email = tfEmail.text, let password = tfPwd.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in

            guard let user = authResult?.user else { return }

                      if error == nil {
                          // TODO: 회원가입 정상 처리 후 다음 로직, 로그인 페이지 or 바로 로그인 시키기
                        print(user)
                      } else {
                          // TODO: 회원가입 실패
                        print(user)
                      }
                  }
 }//btn


    
    
    
    
    
    
    
    
    // 터치
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //---------------------- 뷰 꾸미는 속성 (텍스트필드, 버튼)
    
    
    func setUnderLine(){
        
        //이름
        tfName.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfName.frame.size.height-1, width: tfName.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfName.layer.addSublayer((border))
        tfName.textAlignment = .left
        tfName.textColor = UIColor.systemGray
        
        //생년월일
        tfBirthNum.borderStyle = .none
        let border1 = CALayer()
        border1.frame = CGRect(x: 0, y: tfBirthNum.frame.size.height-1, width: tfBirthNum.frame.width, height: 1)
        border1.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfBirthNum.layer.addSublayer((border1))
        tfBirthNum.textAlignment = .left
        tfBirthNum.textColor = UIColor.systemGray
        
        
        //이메일
        tfEmail.borderStyle = .none
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: tfEmail.frame.size.height-1, width: tfEmail.frame.width, height: 1)
        border2.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfEmail.layer.addSublayer((border2))
        tfEmail.textAlignment = .left
        tfEmail.textColor = UIColor.systemGray
        
        
        
    }
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//-----
