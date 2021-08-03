//
//  SignUp_InsertInfoEmailViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/30.
//

import UIKit
//import FirebaseAuth

class SignUp_InsertInfoEmailViewController: UIViewController {

    
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
      //버튼눌렀을때 id password 입력창으로
        self.performSegue(withIdentifier: "sgToInsertIdPwd", sender: self)
        
        
//        var currentUser: User? {
//               return Auth.auth().currentUser
//           }
//
//        func sendLoginLink(email: String, completion: @escaping (Bool)->Void) {
//               guard !email.isEmpty else {
//                   completion(false)
//                   return
//               }
//
//            let actionCodeSettings = ActionCodeSettings()
//            actionCodeSettings.url = URL(string: "https://cs342.page.link")
//            actionCodeSettings.handleCodeInApp = true // The sign-in operation has to always be completed in the app.
//            actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
//
//               Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { (error) in
//                   if let error = error {
//                       print(error.localizedDescription)
//                       completion(false)
//                       return
//
//
//
//                   }
//
//                   completion(true)
//               }
//           }
    
        
       
        
        
        
        
        
//        guard let email = tfEmail.text, let password = tfPwd.text else { return }
//
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//
//            guard let user = authResult?.user else { return }
//
//                      if error == nil {
//                          // TODO: 회원가입 정상 처리 후 다음 로직, 로그인 페이지 or 바로 로그인 시키기
//                        print(user)
//                      } else {
//                          // TODO: 회원가입 실패
//                        print(user)
//                      }
//                  }
        
        
//        private func loadFireBaseCreateUser(email : String , password : String)
//
//            {
//
//                Auth.auth().createUser(withEmail: email, password:password) { (authResult, error) in
//
//                     if let error = error
//
//                     {
//
//                        if let errorCode : AuthErrorCode = AuthErrorCode(rawValue: error._code)
//
//                        {
//
//                           print("-> error -> \(error.localizedDescription) -> code -> \(errorCode.rawValue)")
//
//
//
//                           switch errorCode.rawValue
//
//                           {
//
//                           case AuthErrorCode.invalidEmail.rawValue:
//
//                                // 이메일 주소의 형식이 잘못되었음을 나타냅니다.
//
//                                self.setAlert(title: "error", msg: "이메일 양식이 맞지 않습니다.")
//
//                                return
//
//                           case AuthErrorCode.emailAlreadyInUse.rawValue:
//
//                                //  로그인 시도에 사용된 이메일 주소가 이미 존재함을 나타냅니다. fetchProvidersForEmail을 호출하여 사용자가 어느 로그인 시스템을 사용했는지 확인하고, 사용자에게 그중 한 가지 방법으로 로그인하라는 메시지를 띄우세요.
//
//                                self.setAlert(title: "error", msg: "이 이메일로 등록 된 유저가 있습니다.")
//
//                                return
//
//                           case AuthErrorCode.operationNotAllowed.rawValue:
//
//                                // 이메일 및 비밀번호 계정의 사용 설정이 되어 있지 않음을 나타냅니다. Firebase 콘솔의 인증 섹션에서 사용 설정을 하세요.
//
//                                self.setAlert(title: "error", msg: "operationNotAllowed")
//
//                                return
//
//                           case AuthErrorCode.weakPassword.rawValue:
//
//                                // 너무 안전성이 낮은 비밀번호를 설정하려고 했음을 나타냅니다. NSError.userInfo 사전 객체 내의 NSLocalizedFailureReasonErrorKey 필드에 사용자에게 표시할 수 있는 자세한 설명이 있습니다.
//
//                                self.setAlert(title: "error", msg: "weakPassword")
//
//                                return
//
//                           default:
//
//                               self.setAlert(title: "error", msg: "error -> \(error.localizedDescription) -> code -> \(errorCode.rawValue)")
//
//                               return
//
//                           }
//
//                       }
//
//                    }
//
//                    else
//
//                    {
//
//                        // success
//
//                        if let user = authResult?.user
//
//                        {
//
//
//
//                        }
//
//                        else
//
//                        {
//
//                            self.setAlert(title: "error", msg: "error ->")
//
//                        }
//
//                    }
//
//                }
//
//            }


     
        
        
        
        
        
        
        
        
        
        
        
        
        

//        let actionCodeSettings = ActionCodeSettings()
//        actionCodeSettings.url = URL(string: "https://www.example.com")
//        // The sign-in operation has to always be completed in the app.
//        actionCodeSettings.handleCodeInApp = true
//        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
//        actionCodeSettings.setAndroidPackageName("com.example.android",
//                                                 installIfNotAvailable: false, minimumVersion: "12")

        
        
 }//btn


    
    
    
    
    
    
    
    
    // 터치
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //---------------------- 뷰 꾸미는 속성 (텍스트필드, 버튼)
    
    
    func setUnderLine(){
         
        //이메일
        tfEmail.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfEmail.frame.size.height-1, width: tfEmail.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfEmail.layer.addSublayer((border))
        tfEmail.textAlignment = .left
        tfEmail.textColor = UIColor.systemGray
        
        //패스워드
        tfPwd.borderStyle = .none
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: tfPwd.frame.size.height-1, width: tfPwd.frame.width, height: 1)
        border2.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfPwd.layer.addSublayer((border2))
        tfPwd.textAlignment = .left
        tfPwd.textColor = UIColor.systemGray
        
        
        
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
