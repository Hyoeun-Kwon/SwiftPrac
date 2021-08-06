//
//  VerifyDuplicatedIdModel.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/08/06.
//

import Foundation

protocol VerifyDuplicatedIdProtocol{
   
    func itemDownloaded(items: String)
}


class VerifyDuplicatedIdModel{
    
    var delegate: VerifyDuplicatedIdProtocol!
    
    func downloadItems(subUrl: String){
        
        var urlPath = Share.IP + ":8080/starbucks/he/verifyDuplicatedId.jsp?id=\(subUrl)"
        print(urlPath)
        
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download verifyDuplicatedId data")
            }else{
                print("VerifyDuplicatedId Data is downloaded")
                self.parseJSON(data!)
            }
            
        }
        task.resume()
    }
    
    func sendEmail(email: String, password: String) -> Bool{
            
            var result : Bool = true
            var urlPath = Share.IP + ":8080/starbucks/he/findPassword_SendEmail.jsp"
            let urlAdd = "?email=\(email)&password=\(password)"
            urlPath += urlAdd
            print(urlPath)
            
            // 한글 url encoding
            urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            
            let url: URL = URL(string: urlPath)!
            let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
            let task = defaultSession.dataTask(with: url){(data, response, error) in
                if error != nil{
                    print("Failed to send email")
                    result = false
                }else{
                    print("Email is sended")
                    result = true
                }
            }
            task.resume()
            return result
        }
    
    

    func parseJSON(_ data: Data){
        var json = ["":""]
        do{
            json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:String]
                   }catch let  error as NSError{
                       print(error)
                   }
                   let result = json["result"]!
        
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            //itemDownloaded에게 파싱한 내용 주기
            
            self.delegate.itemDownloaded(items: result)
            print("locations : \(result)")
        })
        
    }
}
