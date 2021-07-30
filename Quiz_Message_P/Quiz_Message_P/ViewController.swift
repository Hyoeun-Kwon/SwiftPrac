//
//  ViewController.swift
//  Quiz_Message_P
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var tfSendMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvMessage.text.removeAll()
    }

    // keyboard 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //보내기 버튼 누르면 textfield의 글씨가 textView에 보여지기
    @IBAction func btnSend(_ sender: UIButton) {
        tvMessage.text += tfSendMessage.text! + "\n"
        tfSendMessage.text?.removeAll()
    }
    
    
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfSendMessage.text! += "😋"
    }
    
    
}//ViewController

