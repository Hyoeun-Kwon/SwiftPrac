//
//  ChangePw.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/06.
//

import Foundation

class ChangePwModel{
    
    var urlPath = Share.IP + ":8080/starbucks/jsp/he/changePwUpdate.jsp"
    
    func changePwItems(password: String, id: String) -> Bool { //data를 달고 넘어와서 DB연결해야함
        
        var result: Bool = true
        let urlAdd = "?password=\(password)&id=\(id)" // 띄어쓰기하면 안됨!
        urlPath = urlPath + urlAdd // 진짜 url
        print("changePw urlPath: \(urlPath)")
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)! //얘는 optional이므로 ! // 한글이 %로 쫙!
        

        // 서버에서 데이터 받아오는 동안 다른 일을 해야지!
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default) //Session만듬, Foundation 안써도 됨!
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            // data, response, error 타입
            //서버에서 신호주는거: response, 브라우저에서 신호주는것: request
            if error != nil{
                print("Failed to changePw data")
                result = false
            }else{
                print("ChangePw data is succeed")
                result = true
                
            }
            
        }
        // resume 위에 url, defaultSission, task 는 선언임
        //task 실행
        task.resume()
        return result
    }

}//-----
