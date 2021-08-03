//
//  IDFindViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//
import Foundation
import UIKit
import MessageUI
class IDFindViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
        

        


    }//viewDidLoad
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
        let mailComposeViewController = configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true, completion: nil)
                    print("can send mail")
                } else {
                    self.showSendMailErrorAlert()
                }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients(["let.khe92@gmail.com"])
            mailComposerVC.setSubject("봉사꾼 IOS 문의 메일")
            mailComposerVC.setMessageBody("여러분의 소중한 의견 감사드립니다. \n - 봉사꾼 -", isHTML: false)
            
            return mailComposerVC
        }
        
    func showSendMailErrorAlert() {
            let sendMailErrorAlert = UIAlertView(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", delegate: self, cancelButtonTitle: "확인")
            sendMailErrorAlert.show()
        }
        
        // MARK: MFMailComposeViewControllerDelegate Method
    private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            controller.dismiss(animated: true, completion: nil)
        }
    
    
    
    
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
    

}//----

