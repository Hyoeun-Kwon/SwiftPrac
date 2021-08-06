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
    var sendId = ""
    
    // Array
//    var feedItem: NSMutableArray = NSMutableArray()
    //var receiveEmail: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(">>>>>>___")
        self.navigationController?.navigationBar.topItem?.title = ""
        lblCheckId.text = "고객님의 아이디는 \(sendId) 입니다."

        //let defaultUserId = UserDefaults.standard.object(forKey: "userId")
        //메세지 창에 현재 아이디
        //lblCheckId.text = "고객님의 아이디는 \(defaultUserId as! String) 입니다."
        //lblCheckId.text = "고객님의 아이디는 \(Share.userID) 입니다."
        // 데이터베이스의 이메일값을 비교 해당 아이디를 불러와야함!
        // 그리고 그 아이디를 prepare로 넘겨서 로그인하기 버튼 눌렀을때 로그인창에 띄워주기? --> 나중에 해도 됨
        
       //이거로 파싱!
//        print("feed에는:\(feedItem)")
        
//        print("check1")
//        let item: DBModel = feedItem[0] as! DBModel
//        print("check2")
        
//
//        print("ddddddddd",Share.searchUserId)
//        //lblCheckId.text = "고객님의 아이디는 \(receiveEmail) 입니다."
//        lblCheckId.text = "고객님의 아이디는 \(Share.searchUserId) 입니다."
        
//        checkId()
        setRadius()
        
    }//viewDidLoad
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        print("dldldldldl")
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        //lblCheckId.text = "고객님의 아이디는 \(Share.searchUserId) 입니다."
//        lblCheckId.text = "고객님의 아이디는 \(sendId) 입니다."
//    }
    
//    func receiveEmail(email: String) {
//        receiveEmail = email
//    }
    
    
//    func checkId(){
//        let searchIdModel = SearchIdModel()
//        searchIdModel.delegate = self
//        print("input : \(receiveEmail)")
//        searchIdModel.downloadItems(subUrl: receiveEmail)
//        print("check1")
//        //let item: DBModel = feedItem[0] as! DBModel
//        var item : DBModel = DBModel()
//        //item = feedItem[0] as! DBModel
//        print("check2")
//        lblCheckId.text = "고객님의 아이디는 \(String(describing: item.userId)) 입니다."
//    }

//    func receiveEmail(item: String) {
//
//         self.receiveEmail = item
//
//     }
    
    

    
    func setRadius(){
        btnLogin.layer.cornerRadius = 20
    }
    
  
}//----

//extension CheckFindIdViewController: SearchIdModelProtocol{
//    func itemDownloaded(items: NSArray) {
//        feedItem = items as! NSMutableArray //jsp 통해-> Bean -> Bean을 통해서 뭉텅이로 담겨져있다 가져온 data 가 들어올거임!
//        print("Bean을 통해 들어온 피드아이템 \(feedItem)")
//    }
//
//}



