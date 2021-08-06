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
    
    /////////////////////////////////
    // TEST        //
    // / / / / / / /
    
    let queryEmailModel = QueryEmailModel()
   // var userSearchId: String = ""
    var userEmail = ""
    var tempPassword = ""
    var sendId = ""
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfAuthCode: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    
    //인증약관 동의버튼
    @IBOutlet weak var btnAgreeAuth: UIButton!
    @IBOutlet weak var lblAgreePersonalInfo: UILabel!
    @IBOutlet weak var btnAgreePersonalInfo: UIButton!
    @IBOutlet weak var lblAgreeUse: UILabel!
    @IBOutlet weak var btnAgreeUse: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
        
        if !MFMailComposeViewController.canSendMail() {
                   print("Mail services are not available")
                   return
               }
        
        //searchId()
        //queryEmailModel.delegate = self

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
    
    
    
    //이메일 인증번호 보내기
    @IBAction func btnSendCode(_ sender: UIButton) {
//        let mailComposeViewController = configuredMailComposeViewController()
//                if MFMailComposeViewController.canSendMail() {
//                    // Present the view controller modally.
//                    self.present(mailComposeViewController, animated: true, completion: nil)
//                    print("can send mail")
//                } else {
//                    self.showSendMailErrorAlert()
//                }
      


    }//btnSendCode
    

    //다음버튼 누르면 : 인증번호 일치시 넘어가기 (일단 낫널이면 넘어가기)
    @IBAction func btnNext(_ sender: UIButton) {
        //searchId()
        //searchIdfor()
       
        
        if tfAuthCode.text?.isEmpty == false && btnAgreeAuth.isSelected == true {
            //self.searchId()
            userEmail = String((tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
            queryEmailModel.delegate = self
            queryEmailModel.downloadItems(subUrl: userEmail)
            //searchId()
            
           
            
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
    
//    func searchId(){
//        userEmail = String((tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//        let queryEmailModel = QueryEmailModel()
//        queryEmailModel.delegate = self
//        queryEmailModel.downloadItems(subUrl: tfEmail.text!)
//        //queryEmailModel.downloadItems(subUrl: userEmail)
//
//    }//searchId
    
    
//    func searchIdfor(){
//        print("searchId() :", feedItem.count)
//        for i in 0..<feedItem.count{
//            let item: DBEmailModel = feedItem[i] as! DBEmailModel
//            Share.searchUserId = item.userId!
//            print("--->",Share.searchUserId)
//        }
//    }
    
  
    
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
    
    
    
//    //prepare로 입력된 이메일 값 넘기기!
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        userEmail = String((tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//
//            print("아이디찾기 보내기 : \(userEmail)")
//            searchId()
//            print("userSearchId가 들어오는가? \(userSearchId)요고야")
//        if segue.identifier == "sgToCheckFindId" {
//
//            let checkFindId = segue.destination as! CheckFindIdViewController
//            //checkFindId.receiveEmail(item: userEmail)
////            checkFindId.receiveEmail = userEmail
//
//            checkFindId.receiveEmail(email: userSearchId)
//
//        }
//    }//prepare
    
    //static
    
    
    
 
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
    
    
    // 임시 비밀번호 이메일 전송
        func sendTemporaryPasswordToEmail() -> Bool{
            
            return queryEmailModel.sendEmail(email: userEmail, password: tempPassword)
        }

        // 임시 비밀번호 발급 - 8자리
        func issueTemporaryPassword(){
            let num = 8 // 발급할 비밀번호 자릿수
            let temp = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            
            for _ in 0..<num{
                let random = Int(arc4random_uniform(UInt32(temp.count)))
                tempPassword += String(temp[temp.index(temp.startIndex, offsetBy: random)])
            }
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgToCheckFindId"{
            
            let checkId = segue.destination as! CheckFindIdViewController
            checkId.sendId = sendId
        }
    }
    
    

}//----

/// TEST EXTENSION

extension IDFindViewController: QueryEmailProtocol{
//    let Code = tfAuthCode.text
    func itemDownloaded(items: String) {
        print("item Downloaded")
        if items == "0"{
            
        }else{
            sendId = items
            self.performSegue(withIdentifier: "sgToCheckFindId", sender: self)
            
            //sendTemporaryPasswordToEmail()
        }
    }
  
}


