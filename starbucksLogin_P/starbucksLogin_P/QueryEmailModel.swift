//
//  QueryEmailModel.swift
//  starbucksLogin_P
//
//  Created by HyoEun Kwon on 2021/08/05.
//

import Foundation

protocol QueryEmailProtocol{
   
    func itemDownloaded(items: NSArray)
}


class QueryEmailModel{
    
    var delegate: QueryEmailProtocol!
    
    func downloadItems(subUrl: String){
        
        var urlPath = "http://192.168.103.130:8080/starbucks/he/findIdSelect.jsp?email=\(subUrl)"
        
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Id Data is downloaded")
                self.parseJSON(data!)
            }
            
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray //as는 casting
          
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary() // 딕셔너리 타입 [{},{}]
        let locations = NSMutableArray()  // : ArrayList 라고 생각하면됨! <> NSArray
        print(jsonResult.count, "ddddd")
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let userId = jsonElement["userId"] as? String,
               let userPw = jsonElement["userPw"] as? String,
               let userNickname = jsonElement["userNickname"] as? String,
               let userEmail = jsonElement["userEmail"] as? String {
                //Share.searchUserId = userId
                print("parseid  \(userId)")
               let query = DBEmailModel(userId: userId, userPw: userPw, userNickname: userNickname, userEmail: userEmail)
                locations.add(query) // 2줄이 생김 (java Bean 처럼)
            }
    
        }
        
        // 테이블 뷰를 만들때 데이터를 같이 가져올 수 있음
        // 스위프트는 class 에 async 라고만 적어주면 async야
        
        //테이블 뷰도 실행되지만 얘도 동시에 실행되어야함 _ 어싱
        //async 방식은 DispatchQueue 사용
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            //itemDownloaded에게 파싱한 내용 주기
            
            self.delegate.itemDownloaded(items: locations)
            print("locstions : \(locations)")
        })
        
    }
}
