//
//  DetailViewController.swift
//  Table_P
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    
    // prepare로 넘긴 값을 받는 변수
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 화면에 띄워주기
         = receiveItem
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
