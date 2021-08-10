//
//  KakaoCountModel.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/10.
//

import Foundation

protocol KakaoCountProtocol{
   
    func kakaoCountDownloaded(items: NSArray)
}


class KakaoCountModel{
    
    var delegate: KakaoCountProtocol!
    let urlPath = Share.IP + ":8080/starbucks/jsp/he/kakaoCountSelect.jsp"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
     
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
            
        }
      
        //task 실행
        task.resume()
    }
    

    func parseJSON(_ data: Data){
        var jsonResult = NSArray()//어레이
        do{
            
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray //as는 casting
        
        }catch let error as NSError{
            print(error)
        }
        
        //하나씩 뽑아오기
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
   
        
        
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let count = jsonElement["count"] as? String{
               let query = KakaoCountDBModel(count: count)
                
                locations.add(query)
            }
    
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.kakaoCountDownloaded(items: locations)
        })
        
    }
}
