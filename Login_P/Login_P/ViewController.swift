//
//  ViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
class ViewController: UIViewController {

    
    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    @IBOutlet weak var btnLoginL: UIButton!
    
    
    @IBOutlet weak var btnKakao: UIButton!
    
    
    var feedItem: NSMutableArray = NSMutableArray()
    var countItem: NSMutableArray = NSMutableArray()
    
    // kakao 위해 추가
    var kakaoUserEmail = ""
    var kakaoUserId = ""
    var kakaoUserPw = ""
    var kakaoUserNickname = ""

    var kakaoCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //텍스트필드 지우기
        remove()
        
        //textField 밑줄로 만들기
        setUnderLineId()
        setUnderLinePwd()
        
        //버튼 라운드
        setRadius()
        print(UserDefaults.standard.object(forKey: "userId")!)
        //값이 있으면 유저디포트 -> 쉐어바에 들어가있는 아이디값을 넣어줘야하고 +//세그 메인화면
//        if UserDefaults.standard.object(forKey: "userId") != nil { // UserDefault에 값이 있다
//
//            Share.userID = UserDefaults.standard.object(forKey: "userId") as! String
//            print(Share.userID)
//            self.performSegue(withIdentifier: "sgLoginToMain", sender: self) //Main으로 가는 sg만들기
//
//        }else{

            // 없으면 불러오기!
//            doQueryModel()

//        }//if
        
        

//        if let user = Auth.auth().currentUser {
//
//            tfUserId.placeholder = "이미 로그인 된 상태입니다."
//
//            tfUserPassword.placeholder = "이미 로그인 된 상태입니다."
//
//            btnLoginL.setTitle("이미 로그인 된 상태입니다.", for: .normal)
//
//        }
        
    }//viewDidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        remove()
        doQueryModel()
       //doKakaoCountModel()
        
    }
    
    func remove(){
        tfUserId.text?.removeAll()
        tfUserPassword.text?.removeAll()
    }
    
    
    func doKakaoCountModel(){
        let kakaoCountModel = KakaoCountModel()
        kakaoCountModel.delegate = self
        kakaoCountModel.downloadItems()
        
    }
    
    
    @IBAction func btnKakao(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인
          if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print("kakao login install",error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                   // do something
                    _ = oauthToken
                   // 어세스토큰
                   let accessToken = oauthToken?.accessToken
                    
                }
            }
          }else{
            
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            
               if let error = error {
                 print(error)
               }
               else {
                print("loginWithKakaoAccount() success.")
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                       
                        print("me() success.")
                        // Kakao 에서 받은 이메일 정보
                        self.kakaoUserEmail = String(user!.kakaoAccount!.email!)
                        self.kakaoUserNickname = String(user!.kakaoAccount!.profile!.nickname!)
                        print("kakaoUserEmail에 담기는 값: \(self.kakaoUserEmail)")
                        // 임의의 아이디, 비밀번호 카카오변수에 넣기
                        self.kakaoUserId = String((user!.id!))
                        print("useridwillbe : \(self.kakaoUserId)")
                        self.kakaoUserPw = "kakaoPassword"
                        // 카카오 변수에 넣음 임의 아이디 비밀번호 -> Share에 넣기
                        Share.userID = self.kakaoUserId
                        Share.userPwd = self.kakaoUserPw
                        // UserDefaults에 값넣기 
                        UserDefaults.standard.set(self.kakaoUserId, forKey: "userId")
                        
                        let insertIdPwModel = InsertIdPwModel()
                        let result = insertIdPwModel.insertItems(userId: self.kakaoUserId, userPw: self.kakaoUserPw, userNickname: self.kakaoUserNickname, userEmail: self.kakaoUserEmail)

                        if result{
                            let resultAlert = UIAlertController(title: "완료", message: "카카오톡으로 가입이 완료되었습니다.", preferredStyle: .alert)
                            let onAction = UIAlertAction(title: "확인", style: .default, handler: { ACTION in

                                self.performSegue(withIdentifier: "sgLoginToMain", sender: self)

                            })

                            resultAlert.addAction(onAction)
                            self.present(resultAlert, animated: true, completion: nil)


                        }else{
                            let resultAlert = UIAlertController(title: "에러", message: "가입이 불가합니다. 다시 확인해주세요", preferredStyle: .alert)
                            let onAction = UIAlertAction(title: "확인", style: .default, handler: { ACTION in
                            })

                            resultAlert.addAction(onAction)
                            self.present(resultAlert, animated: true, completion: nil)

                        }
                        
                    }
                }

                //do something
                _ = oauthToken
               }
            }
          }//else
    }//btnKakao
    
    

    //query Model 실행
    func doQueryModel(){
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    
   
    
    //로그인 버튼
    @IBAction func btnLogin(_ sender: UIButton) {
 
        var count: Int = 0
        
        for i in 0..<feedItem.count {
            let item: DBModel = feedItem[i] as! DBModel
            guard let id = item.userId else {
                return
            }
            guard let password = item.userPw else {
                return
            }
            
            if tfUserId.text == id && tfUserPassword.text == password {
                // 아이디와 비밀번호가 일치하면
                count += 1
                Share.userID = tfUserId.text!
                UserDefaults.standard.set(tfUserId.text!, forKey: "userId")

                Share.userPwd = tfUserPassword.text!// password는 없어야 함 ! --> 후에 지우기
                
                self.performSegue(withIdentifier: "sgLoginToMain", sender: self)
                
            } // if
            
        } // for
        
        if count == 0 {
        //불일치시
        let idAlert = UIAlertController(title: "경고", message: "ID나 암호가 불일치 합니다!", preferredStyle: .alert)
        let idAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        //idAlert.view.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        idAlert.addAction(idAction)
        present(idAlert, animated: true, completion: nil)

        }//if
    }
    
    
    // 아이디찾기 버튼
    @IBAction func btnFindUserId(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "sgFindUserId", sender: self)

    }
    
    
    // 비밀번호 찾기
    @IBAction func btnFindPwd(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "sgToFindUserPw", sender: self)
    
    }
    
    
    // 회원가입
    @IBAction func btnSignUp(_ sender: UIButton) {
        //유저 디폴트가 널값일때만 넘어가게 한다!!
//        if UserDefaults.standard.string(forKey: "userId") == nil{
            self.performSegue(withIdentifier: "sgLoginToSignUp", sender: self)
//        }
    }//btnSignUp
    
    
    //let kakaoUserEmail = String(user!.kakaoAccount!.email!)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "sgLoginToMain"{

            let kakaoLogin = segue.destination as! MainViewController
            //signInfo.receiveInfo(userId: userId, userPw: userPw)
            
            kakaoLogin.receiveKakaoInfo(email: self.kakaoUserEmail, id: self.kakaoUserId, password: self.kakaoUserPw)
//            kakaoLogin.receiveKakaoEmail = kakaoUserEmail
//            print("kakaoUserEmail 담아오나? \(kakaoUserEmail)")
//            kakaoLogin.receiveKakaoId = kakaoUserId
//            kakaoLogin.receiveKakaoPw = kakaoUserPw

        }
    }//prepare
    
    
    
    
    
    
    
    
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
    

 
}//----

extension ViewController: QueryModelProtocol{ //데이터 불러올거야!
    func itemDownloaded(items: NSArray) { //NSArray(배열 중 제일큰것) : 타입 꼭 지정안해도 ok..!? -> String과 Int 같이 쓸 수 있음
        feedItem = items as! NSMutableArray //jsp 통해-> Bean -> Bean을 통해서 뭉텅이로 담겨져있다 가져온 data 가 들어올거임!
        // 데이터가 새로 들어왔으니 table을 다시 구성해줘
    }
}//extension

extension ViewController: KakaoCountProtocol{ //데이터 불러올거야!
    func kakaoCountDownloaded(items: NSArray) {
        countItem = items as! NSMutableArray
        
        print("item:\(items.count)")
        
        self.kakaoCount = Int(items.count)
        // kakaoCount = kakao 회원 수
        
    }
}

