//
//  ViewController.swift
//  AlertActionSheet_p
//
//  Created by HyoEun Kwon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    
    @IBAction func btnAlert(_ sender: UIButton) {
        //Controller
        let testAction = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        //Action
        let defaultAction = UIAlertAction(title: "default입니다.", style: .default, handler: nil)
        //Controller와 Action 연결
        testAction.addAction(defaultAction)
        //화면 띄우기
        present(testAction, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        //Controller
        let testAction2 = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        //Action
        let defaultAction = UIAlertAction(title: "actionSheet default", style: .default, handler: nil)
        //Controller와 Action 연결
        testAction2.addAction(defaultAction)
        //화면 띄우기
        present(testAction2, animated: true, completion: nil)
        
    }
    
    
    
}//ViewController

