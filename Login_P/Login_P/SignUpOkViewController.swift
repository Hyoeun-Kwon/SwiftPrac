//
//  SignUpOkViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class SignUpOkViewController: UIViewController {
    
    //받은id
    var receiveMsgId = ""
    
    @IBOutlet weak var lblWelcomeMsg: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        setRadius()
        
        //전 페이지에서 아이디 값을 한번더 넘겨와서 넣어줘야 함
        lblWelcomeMsg.text = "\(receiveMsgId)님, 회원가입이 완료되었습니다."
        
        
    }//viewDidLoad
    

    
    
    @IBAction func btnNext(_ sender: UIButton) {
       //네비게이션의처음: 로그인화면으로 돌아가기
        self.navigationController?.popToRootViewController(animated: true)

    
    }//btnNext
    
    
    
    
    func setRadius(){
        btnNext.layer.cornerRadius = 20
    }//setRadius

}//-----
