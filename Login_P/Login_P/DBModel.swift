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
    var semail: String?
    var sid: String?
    var spassword: String?
    
    //Empty constructor  //*** 잊지말자!
    override init() {
        
    }
    
    // 배열 만들때 사용 !?  // constructor  --> 실질적 사용
    init(semail: String, sid: String, spassword: String) { //DB
        self.semail = semail
        self.sid = sid
        self.spassword = spassword
    }
    
}//class
