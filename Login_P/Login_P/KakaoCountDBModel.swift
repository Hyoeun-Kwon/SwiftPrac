//
//  KakaoCountDBModel.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/10.
//

import Foundation

class KakaoCountDBModel: NSObject{
        
    var count: String?
    
    //Empty constructor  //*** 잊지말자!
    override init() {
        
    }
    
    init(count: String) { //DB
        self.count = count
    }
    
}//class
