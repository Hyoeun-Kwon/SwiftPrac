//
//  ViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    @IBOutlet weak var btnLoginL: UIButton!
    
    var feedItem: NSMutableArray = NSMutableArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //textField 밑줄로 만들기
        setUnderLineId()
        setUnderLinePwd()
        
        //버튼 라운드
        setRadius()
        
    }
    
    
    //query Model 실행
    func doQueryModel(){
        
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
        
    }
    
    
    //로그인 버튼
    @IBAction func btnLogin(_ sender: UIButton) {
        
        doQueryModel()
        
        
        
        let item: DBModel = feedItem[0] as! DBModel

        if tfUserId.text == item.sid && tfUserPassword.text == item.spassword{
            // id가 통과되면
            Share.userID = tfUserId.text!
            Share.userPwd = tfUserPassword.text!
            // 버튼 눌렀을때 해당 segue로 가게 하겠다.
            self.performSegue(withIdentifier: "sgLoginToMain", sender: self)
            
        }else{//불일치시
            let idAlert = UIAlertController(title: "경고", message: "ID나 암호가 불일치 합니다!", preferredStyle: .alert)
            let idAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            //idAlert.view.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            idAlert.addAction(idAction)
            present(idAlert, animated: true, completion: nil)

        }

    }
    
    // 아이디찾기 버튼
    @IBAction func btnFindUserId(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "sgFindUserId", sender: self)

    }
    
    
    // 비밀번호 찾기
    @IBAction func btnFindPwd(_ sender: UIButton) {
    
    
    }
    
    // 회원가입
    @IBAction func btnSignUp(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgLoginToSignUp", sender: self)

    
    }
    
    
    
    
    //---------------------- 뷰 꾸미는 속성 (텍스트필드, 버튼)
    func setUnderLineId(){
        
        tfUserId.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfUserId.frame.size.height-1, width: tfUserId.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfUserId.layer.addSublayer((border))
        tfUserId.textAlignment = .left
        tfUserId.textColor = UIColor.systemGray
    }
    
    func setUnderLinePwd(){
        
        tfUserPassword.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: tfUserPassword.frame.size.height-1, width: tfUserPassword.frame.width, height: 1)
        border.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tfUserPassword.layer.addSublayer((border))
        tfUserPassword.textAlignment = .left
        tfUserPassword.textColor = UIColor.systemGray
    }
    
    
    func setRadius(){
        btnLoginL.layer.cornerRadius = 20
    }
    
    //터치
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}//

extension ViewController: QueryModelProtocol{ //데이터 불러올거야!
    func itemDownloaded(items: NSArray) { //NSArray(배열 중 제일큰것) : 타입 꼭 지정안해도 ok..!? -> String과 Int 같이 쓸 수 있음
        feedItem = items as! NSMutableArray //jsp 통해-> Bean -> Bean을 통해서 뭉텅이로 담겨져있다 가져온 data 가 들어올거임!
        // 데이터가 새로 들어왔으니 table을 다시 구성해줘
    }
}
