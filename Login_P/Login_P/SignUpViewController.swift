//
//  SignUpViewController.swift
//  Login_P
//
//  Created by HyoEun Kwon on 2021/07/29.
//

import UIKit

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var btnNextL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // <Back 을 < 로 바꾸기
    self.navigationController?.navigationBar.topItem?.title = ""
     setRadius()
        
        
        
    }
    
    //전체 약관동의 버튼
    @IBAction func btn_box(_ sender: UIButton) {
        
        
    }
    
    
    // 다음 버튼
    @IBAction func btnNext(_ sender: UIButton) {
        //sgAgreeToInsert
        // 버튼 눌렀을때 해당 segue로 가게 하겠다.
        self.performSegue(withIdentifier: "sgAgreeToInsert", sender: self)
        
        
        
        
    }
    
    //--------
    
    func setRadius(){
        btnNextL.layer.cornerRadius = 20
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
