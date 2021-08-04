//
//  NickNameViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class NickNameViewController: UIViewController {

    
    
    @IBOutlet weak var tfNickname: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    
    
    var receiveId = ""
    var receivePw = ""
    var receiveEmail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // <Back 을 < 로 바꾸기
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
    
        
        
    }
    

    
    @IBAction func btnNext(_ sender: UIButton) {
        
        let nickname = String((tfNickname.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        print("닉네임과 함께 최종 보내기\(receiveEmail)")
        let insertIdPwModel = InsertIdPwModel()
        let result = insertIdPwModel.insertItems(userId: receiveId, userPw: receivePw, userNickname: nickname, userEmail: receiveEmail)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "가입이 완료되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
                
                self.performSegue(withIdentifier: "sgToSignUpOk", sender: self)

            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
       

        }else{
            let resultAlert = UIAlertController(title: "에러", message: "에러가 발생했습니다..", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
         
    }//btnNext
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "sgToSignUpOk"{

            let signOkId = segue.destination as! SignUpOkViewController
            //signInfo.receiveInfo(userId: userId, userPw: userPw)
            signOkId.receiveMsgId = receiveId

        }
    }//prepare
    
    
    
    
    //---------------------- 뷰 꾸미는 속성 (텍스트필드, 버튼)
    func setUnderLine(){
        
        tfNickname.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfNickname.frame.size.height-1, width: tfNickname.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfNickname.layer.addSublayer((border))
        tfNickname.textAlignment = .left
        tfNickname.textColor = UIColor.systemGray
    }
    
    
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }
    


}
