//
//  SignUp_InsertInfoEmailViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/30.
//
import Foundation
import UIKit
//import FirebaseAuth
import MessageUI
class SignUp_InsertInfoEmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfAuthCode: UITextField!
    
    //인증약관 동의버튼
    @IBOutlet weak var btnAgreeAuth: UIButton!
    @IBOutlet weak var lblAgreePersonalInfo: UILabel!
    @IBOutlet weak var btnAgreePersonalInfo: UIButton!
    @IBOutlet weak var lblAgreeUse: UILabel!
    @IBOutlet weak var btnAgreeUse: UIButton!
    
    
    var userEmail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
        
    }//viewDidLoad
    
    
    
    //약관동의버튼 누르면 -> 아래 동의 라벨들 사라지기
    @IBAction func btnAgreeAuth(_ sender: UIButton) {
        if sender.isSelected == true{
                    lblAgreePersonalInfo.isHidden = false
                    btnAgreePersonalInfo.isHidden = false
                    lblAgreeUse.isHidden = false
                    btnAgreeUse.isHidden = false
                    btnAgreeAuth.isSelected = false
                    btnAgreeAuth.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                }else{
                    lblAgreePersonalInfo.isHidden = true
                    btnAgreePersonalInfo.isHidden = true
                    lblAgreeUse.isHidden = true
                    btnAgreeUse.isHidden = true
                    btnAgreeAuth.isSelected = true
                    btnAgreeAuth.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                }
        
    }
    
    
    
    
    
    
    @IBAction func btnSendCode(_ sender: UIButton) {
        
        let mailComposeViewController = configuredMailComposeViewController()
                        if MFMailComposeViewController.canSendMail() {
                            // Present the view controller modally.
                            self.present(mailComposeViewController, animated: true, completion: nil)
                            print("can send mail")
                        } else {
                            self.showSendMailErrorAlert()
                        }

    }//btnSendCode
    

    
    
    @IBAction func btnNext(_ sender: UIButton) {
      //버튼눌렀을때 id password 입력창으로
        
        if tfAuthCode.text?.isEmpty == false && btnAgreeAuth.isSelected == true {
            self.performSegue(withIdentifier: "sgToInsertIdPwd", sender: self)
            
        }else if tfAuthCode.text?.isEmpty == true && btnAgreeAuth.isSelected == true{
            
            let CodeAlert = UIAlertController(title: "경고", message: "인증번호를 입력해주세요", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            CodeAlert.addAction(onAction)
            present(CodeAlert, animated: true, completion: nil)
            
        }else if tfAuthCode.text?.isEmpty == false && btnAgreeAuth.isSelected == false {
            let CodeAlert = UIAlertController(title: "경고", message: "필수 항목을 동의해주세요", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            CodeAlert.addAction(onAction)
            present(CodeAlert, animated: true, completion: nil)
        }else{
            let CodeAlert = UIAlertController(title: "경고", message: "필수 항목 동의와 인증번호를 입력해주세요", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            CodeAlert.addAction(onAction)
            present(CodeAlert, animated: true, completion: nil)
        }
      
 }//btnNext


    //이메일 함수 -1
      func configuredMailComposeViewController() -> MFMailComposeViewController {
              let mailComposerVC = MFMailComposeViewController()
              mailComposerVC.mailComposeDelegate = self
          
          // Configure the fields of the interface.
              mailComposerVC.setToRecipients(["let.khe92@gmail.com"])
              mailComposerVC.setSubject("비밀번호 변경 번호")
              mailComposerVC.setMessageBody("여러분의 소중한 비밀번호를 누군가에게 알려주지 마세요. \n - 사이렌오더 -", isHTML: false)
              
              return mailComposerVC
          }
       
      //이메일 함수 -2
      func showSendMailErrorAlert() {
              let sendMailErrorAlert = UIAlertView(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", delegate: self, cancelButtonTitle: "확인")
              sendMailErrorAlert.show()
          }
          
      
      // MARK: MFMailComposeViewControllerDelegate Method
      //이메일 함수 -3
      private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
              controller.dismiss(animated: true, completion: nil)
          }

    
    
    //prepare로 입력된 이메일 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        userEmail = String((tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        
        print("보내기\(userEmail)")

        if segue.identifier == "sgToInsertIdPwd"{

            let signInfoEmail = segue.destination as! SignUp_IdPwdViewController
            //signInfo.receiveInfo(userId: userId, userPw: userPw)
            signInfoEmail.receiveEmail = userEmail

        }
    }//prepare
    
    
    
    
    
    
    
    
    
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
        tfAuthCode.borderStyle = .none
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: tfAuthCode.frame.size.height-1, width: tfAuthCode.frame.width, height: 1)
        border2.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfAuthCode.layer.addSublayer((border2))
        tfAuthCode.textAlignment = .left
        tfAuthCode.textColor = UIColor.systemGray
        
        
        
    }
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }
    
    

}//-----
