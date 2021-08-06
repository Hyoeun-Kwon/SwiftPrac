//
//  PWEmailViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/06.
//

import UIKit

class PWEmailViewController: UIViewController {

    let queryEmailModel = QueryEmailModel()

    
    @IBOutlet weak var btnAgreeAuth: UIButton!
    @IBOutlet weak var lblAgreePersonalInfo: UILabel!
    @IBOutlet weak var btnAgreePersonalInfo: UIButton!
    @IBOutlet weak var lblAgreeUse: UILabel!
    @IBOutlet weak var btnAgreeUse: UIButton!
    
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfAuthCode: UITextField!
    
    @IBOutlet weak var btnNext: UIButton!
    
    var userEmail = ""
    var tempPassword = ""
    var sendId = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
       
    }
    
    
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
    
    
    
    
    
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
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
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgToChangePw"{
            let checkId = segue.destination as! PWFindViewController
            checkId.sendId = sendId
        }
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
       
       
   

}//--------

extension PWEmailViewController: QueryEmailProtocol{
//    let Code = tfAuthCode.text
    func itemDownloaded(items: String) {
        print("item Downloaded")
        if items == "0"{
            
        }else{
            sendId = items
            self.performSegue(withIdentifier: "sgToChangePw", sender: self)
            
            //sendTemporaryPasswordToEmail()
        }
    }
  
}
