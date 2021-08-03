//
//  PWFindViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class PWFindViewController: UIViewController {

    // 업데이트!!
    
    //비밀번호 변경 메세지
    @IBOutlet weak var lblMessage: UILabel!
    
    //텍스트필드와 버튼
    @IBOutlet weak var tfNewPw: UITextField!
    @IBOutlet weak var tfNewPwCheck: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    //라벨
    @IBOutlet weak var lblPw: UILabel!
    @IBOutlet weak var lblCheckPw: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let defaultUserId = UserDefaults.standard.object(forKey: "userId")
        
        remove()
        self.navigationController?.navigationBar.topItem?.title = ""
        setUnderLine()
        setRadius()
        
        
        //인증이 완료 되어 맞다면!! 으로 변경
        //메세지 창에 현재 아이디
        //lblMessage.text = "\(defaultUserId as! String)님의 비밀번호를 변경합니다."
        lblMessage.text = "\(Share.userID)님의 비밀번호를 변경합니다."

       
    }//viewDidLoad
    
    //라벨 클리어
    func remove(){
        
        lblPw.text = ""
        lblCheckPw.text = ""
        
    }
    

    //패스워드 정규식 체크
    func isValidPw(mypassword : String) -> Bool {
        //숫자+문자 포함해서 5~20글자 사이의 text 체크하는 정규표현식
        let passwordReg = ("^[a-zA-Z0-9]{5,20}$")//String 프로퍼티에 정규식 사용
//        let passwordReg = ("(?=.*[A-Za-z])(?=.*[0-9]).{10,20}")//String 프로퍼티에 정규식 사용
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)//프로퍼티 초기화
        return passwordTesting.evaluate(with: mypassword)
        
    }
    
    
    //비밀번호 텍스트 필드와 비교
    func checkIsValidPw() -> Bool {
        if isValidPw(mypassword: tfNewPw.text!) == false {
            lblPw.text = "패스워드는 5~20자의 문자와 숫자로 입력해야 합니다."
            return false
        }
            return true
    }
    
    //비밀번호 확인 체크
    func checkPw() -> Bool{
        if tfNewPw.text! == tfNewPwCheck.text!{
            lblCheckPw.text = "비밀번호가 일치합니다."
            return true
        }else{
            lblCheckPw.text = "비밀번호가 일치하지 않습니다."
            return false
        }
    }
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        remove()
        
        if checkIsValidPw() == true && checkPw() == true{
            //self.performSegue(withIdentifier: "sgToNickName", sender: self)
           
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    //---------------------- 뷰 꾸미는 속성 (텍스트필드, 버튼)
    // 터치
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func setUnderLine(){
         
        //새로운 비밀번호
        tfNewPw.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfNewPw.frame.size.height-1, width: tfNewPw.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfNewPw.layer.addSublayer((border))
        tfNewPw.textAlignment = .left
        tfNewPw.textColor = UIColor.systemGray
    
        
        
        //새로운 비밀번호 확인
        tfNewPwCheck.borderStyle = .none
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: tfNewPwCheck.frame.size.height-1, width: tfNewPwCheck.frame.width, height: 1)
        border2.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfNewPwCheck.layer.addSublayer((border2))
        tfNewPwCheck.textAlignment = .left
        tfNewPwCheck.textColor = UIColor.systemGray
        
    }
        
        
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }

}//-----
