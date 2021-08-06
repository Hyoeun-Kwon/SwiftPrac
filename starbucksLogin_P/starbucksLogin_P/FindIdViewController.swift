//
//  FindIdViewController.swift
//  starbucksLogin_P
//
//  Created by HyoEun Kwon on 2021/08/05.
//

import UIKit

class FindIdViewController: UIViewController {
   
    let queryEmailModel = QueryEmailModel()
    var feedItem: NSArray = NSArray()
    var userEmail = ""

    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfAuthCode: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
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
        queryEmailModel.delegate = self
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
        
        //searchIdfor()
//        DispatchQueue.global(qos: .userInteractive){
            userEmail = String((tfEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
            queryEmailModel.downloadItems(subUrl: userEmail)
//        }
        if tfAuthCode.text?.isEmpty == false && btnAgreeAuth.isSelected == true {
            //self.searchId()
            self.performSegue(withIdentifier: "sgToCheckSearchId", sender: self)
            //searchId()
            
            // / / / / / / //
            // TEST        //
            // / / / / / / //
            
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
//        queryEmailModel.delegate = self
//        //queryEmailModel.downloadItems(subUrl: tfEmail.text!)
//        queryEmailModel.downloadItems(subUrl: userEmail)
//        print(userEmail)
//        print(Share.searchUserId)
//    }
//MARK: searchId
    
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

    /// TEST EXTENSION

extension FindIdViewController: QueryEmailProtocol{
    
    func itemDownloaded(items: NSArray) {
        print("item Downloaded")
        feedItem = items
        //searchId()
        let item: DBEmailModel = feedItem[0] as! DBEmailModel
        Share.searchUserId = item.userId!
    }
    
    
}

