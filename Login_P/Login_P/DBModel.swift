//
//  DBModel.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/30.
//

import Foundation

// 데이터 불러오는 것
class DBModel: NSObject{
    //그냥 써도 상관없으나 타입주는게 좋다! NSObject 가 가장 큼
        
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
    
}//class
