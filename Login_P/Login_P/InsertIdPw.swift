//
//  InsertIdPw.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/02.
//

import Foundation

//insert는 protocol이 필요없음
class InsertIdPwModel{
    var urlPath = Share.IP + ":8080/starbucks/he/userIdPwNickInsert.jsp" // + urlAdd ( ?와 & 로 쭉쭉 이어갈 거임)
    
    func insertItems(userId: String, userPw: String, userNickname: String) -> Bool { //data를 달고 넘어와서 DB연결해야함
        // Error message를 주기위해 Bool ( 잘됏다 아니다!)
        var result: Bool = true
        let urlAdd = "?userId=\(userId)&userPw=\(userPw)&userNickname=\(userNickname)" // 띄어쓰기하면 안됨!
        urlPath = urlPath + urlAdd // 진짜 url
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        

        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to insert idPw data")
                result = false
            }else{
                print("idPw Data is Inserted")
                result = true
                
            }
            
        }
        // resume 위에 url, defaultSission, task 는 선언임
        //task 실행
        task.resume()
        return result
    }

}//-----

