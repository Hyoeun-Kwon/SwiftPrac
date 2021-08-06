//
//  DBEmailModel.swift
//  starbucksLogin_P
//
//  Created by HyoEun Kwon on 2021/08/05.
//

import Foundation


class DBEmailModel: NSObject{
    
    // Property : 변수
    var userId: String?
    var userPw: String?
    var userNickname: String?
    var userEmail: String?
    
    //Empty constructor  //*** 잊지말자!
    override init() {
        
    }
    
    // 배열 만들때 사용 !?  // constructor  --> 실질적 사용
    init(userId: String, userPw: String, userNickname: String, userEmail: String) { //DB
        self.userId = userId
        self.userPw = userPw
        self.userNickname = userNickname
        self.userEmail = userEmail
        
    }
    
} // DBEmailModel
