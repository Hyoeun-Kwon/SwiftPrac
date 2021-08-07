//
//  CheckFindIdViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/03.
//

import UIKit

class CheckFindIdViewController: UIViewController {

    
    
    @IBOutlet weak var lblCheckId: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
   
    //변수: 받은 아이디
    var sendId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(">>>>>>___")
        self.navigationController?.navigationBar.topItem?.title = ""
        lblCheckId.text = "고객님의 아이디는 \(sendId) 입니다."

        // 데이터베이스의 이메일값을 비교 해당 아이디를 불러와야함!
        // 그리고 그 아이디를 prepare로 넘겨서 로그인하기 버튼 눌렀을때 로그인창에 띄워주기
        
        setRadius()
        
    }//viewDidLoad
    
    
    //로그인버튼: 로그인 화면으로
    @IBAction func btnLogin(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)

    }//btnLogin
    
    
    
    
    
    //버튼 둥글게
    func setRadius(){
        btnLogin.layer.cornerRadius = 20
    }//setRadius
    
  
}//---------




