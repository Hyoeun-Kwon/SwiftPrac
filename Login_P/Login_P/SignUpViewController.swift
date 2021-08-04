//
//  SignUpViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit

class SignUpViewController: UIViewController {

    
    //이용약관버튼
    @IBOutlet weak var btnAgreeUse: UIButton!
    //개인정보 약관버튼
    @IBOutlet weak var btnAgreePersonalInfo: UIButton!
    //Email-광고성정보
    @IBOutlet weak var btnAgreeAd: UIButton!
    //이용약관 전체 동의
    @IBOutlet weak var btnAgreeAll: UIButton!
    
    //다음버튼
    @IBOutlet weak var btnNext: UIButton!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    // <Back 을 < 로 바꾸기
    self.navigationController?.navigationBar.topItem?.title = ""
     setRadius()
    

    }//viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
         setRadius()
    }
    
    
    
    //전체약관동의
    @IBAction func btnAgreeAll(_ sender: UIButton) {
        if sender.isSelected == false {
            
            btnAgreeAll.isSelected = true
            btnAgreeAll.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            
            btnAgreeUse.isSelected = true
            btnAgreeUse.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            print("selected")

            btnAgreePersonalInfo.isSelected = true
            btnAgreePersonalInfo.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)

            btnAgreeAd.isSelected = true
            btnAgreeAd.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)

        }else{
            
            btnAgreeAll.isSelected = false
            btnAgreeAll.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            

            btnAgreeUse.isSelected = false
            print("Not selected")
            btnAgreeUse.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            
            btnAgreePersonalInfo.isSelected = false
            btnAgreePersonalInfo.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            
            btnAgreeAd.isSelected = false
            btnAgreeAd.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            
        }

        
    }
    
    
 
    //이용약관동의 (필)
    @IBAction func btnAgreeUse(_ sender: UIButton) {

        // 누르면 이미지가 채워지는 것으로 변경!
        if sender.isSelected == true {
            btnAgreeUse.isSelected = false
            print("Not selected")
            btnAgreeUse.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
//            btnAgreeUse.point(inside: width , with: <#T##UIEvent?#>)
            
        }else {
            btnAgreeUse.isSelected = true
            btnAgreeUse.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            print("selected")

        }
        
    }//btnAgreeUse
    
    

    //개인정보 수집 및 이용동의 (필)
    @IBAction func btnAgreePersonalInfo(_ sender: UIButton) {
        if sender.isSelected == true{
            btnAgreePersonalInfo.isSelected = false
            btnAgreePersonalInfo.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }else{
            btnAgreePersonalInfo.isSelected = true
            btnAgreePersonalInfo.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }
        
        
    }//btnAgreePersonalInfo
    
    
    //E-mail 및 SMS
    @IBAction func btnAgreeEmailAd(_ sender: UIButton) {
        if sender.isSelected == true{
            btnAgreeAd.isSelected = false
            btnAgreeAd.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }else{
            btnAgreeAd.isSelected = true
            btnAgreeAd.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }
        
    }
    

    // 다음 버튼
    @IBAction func btnNext(_ sender: UIButton) {
        //sgAgreeToInsert
        
        
        if btnAgreeUse.isSelected == true && btnAgreePersonalInfo.isSelected == true{
            // 버튼 눌렀을때 해당 segue로 가게 하겠다.
            if btnAgreeAd.isSelected == false{
                let agreeAlert = UIAlertController(title: "확인", message: "광고성 정보 수집 동의를 거부하였습니다.", preferredStyle: .alert)
                let agreeAction = UIAlertAction(title: "확인", style: .default, handler: {ACTION in
                    self.performSegue(withIdentifier: "sgAgreeToAuth", sender: self)

                })
                
                agreeAlert.addAction(agreeAction)
                present(agreeAlert, animated: true, completion: nil)
            }else{
                self.performSegue(withIdentifier: "sgAgreeToAuth", sender: self)

            }
            
        }else{
            //불일치시
            let agreeAlert = UIAlertController(title: "경고", message: "필수 이용약관을 체크해 주세요!", preferredStyle: .alert)
            let agreeAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            //idAlert.view.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            agreeAlert.addAction(agreeAction)
            present(agreeAlert, animated: true, completion: nil)
        }

        
        
        
    }//btnNext
    
    //버튼 둥글게
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }
    

}//---------
